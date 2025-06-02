let helpMenu = document.getElementById('help-menu');
let closeBtn = document.getElementById('close-btn');
let helpContent = document.querySelector('.help-content');
let searchInput = document.getElementById('search-input');
let helpTabs = document.querySelector('.help-tabs');
let currentTab = 'all';
let helpData = [];
let tooltip = document.getElementById('tooltip');
let notification = document.getElementById('notification');
let themeToggle = document.querySelector('.theme-toggle');
let bookmarkedSections = new Set();
let currentLanguage = 'en';
let configSettings = {}; // Global variable to store config settings

// Shortcuts System
let shortcuts = {
    aliases: [],
    combinations: [],
    macros: []
};

// Initialize theme
document.documentElement.setAttribute('data-theme', 'dark');

// Theme toggle
themeToggle.addEventListener('click', () => {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', newTheme);
    themeToggle.innerHTML = `<i class="fas fa-${newTheme === 'dark' ? 'moon' : 'sun'}"></i>`;
    showNotification(`Switched to ${newTheme} theme`);
});

// Show notification
function showNotification(message, duration = 3000) {
    notification.textContent = message;
    notification.classList.add('show');
    setTimeout(() => {
        notification.classList.remove('show');
    }, duration);
}

// Show tooltip
function showTooltip(element, text) {
    const rect = element.getBoundingClientRect();
    tooltip.textContent = text;
    tooltip.style.left = `${rect.left + rect.width / 2}px`;
    tooltip.style.top = `${rect.bottom + 10}px`;
    tooltip.classList.add('show');
}

// Hide tooltip
function hideTooltip() {
    tooltip.classList.remove('show');
}

// Quick actions
document.querySelectorAll('.action-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
        const action = e.currentTarget.dataset.action;
        
        // Check if action is enabled in config
        if (action === 'history' && !configSettings.enableHistory) return;
        // Assuming similar config for favorites and shortcuts
        if (action === 'favorites' && !configSettings.enableFavorites) return;
        if (action === 'shortcuts' && !configSettings.enableShortcuts) return;

        switch(action) {
            case 'copy':
                copyContent();
                break;
            case 'print':
                printContent();
                break;
            case 'bookmark':
                toggleBookmark();
                break;
            case 'favorites':
                toggleSidePanel('favorites-panel');
                break;
            case 'history':
                toggleSidePanel('history-panel');
                break;
            case 'shortcuts':
                toggleSidePanel('shortcuts-panel');
                break;
        }
    });
});

// Copy content
function copyContent() {
    const content = Array.from(helpContent.querySelectorAll('.help-section'))
        .map(section => {
            const title = section.querySelector('h2').textContent;
            const items = Array.from(section.querySelectorAll('li'))
                .map(item => item.textContent)
                .join('\n');
            return `${title}\n${items}`;
        })
        .join('\n\n');
    
    navigator.clipboard.writeText(content).then(() => {
        showNotification('Content copied to clipboard');
        document.querySelector('[data-action="copy"]').classList.add('copy-success');
        setTimeout(() => {
            document.querySelector('[data-action="copy"]').classList.remove('copy-success');
        }, 300);
    });
}

// Print content
function printContent() {
    const printWindow = window.open('', '_blank');
    printWindow.document.write(`
        <html>
            <head>
                <title>Help Menu Content</title>
                <style>
                    body { font-family: Arial, sans-serif; padding: 20px; }
                    h2 { color: #4CAF50; }
                    ul { list-style: none; padding-left: 20px; }
                    li { margin: 10px 0; }
                </style>
            </head>
            <body>
                ${helpContent.innerHTML}
            </body>
        </html>
    `);
    printWindow.document.close();
    printWindow.print();
}

// Toggle bookmark
function toggleBookmark() {
    const activeSection = document.querySelector('.help-section:focus-within');
    if (activeSection) {
        const sectionId = activeSection.querySelector('h2').textContent;
        if (bookmarkedSections.has(sectionId)) {
            bookmarkedSections.delete(sectionId);
            showNotification('Section unbookmarked');
        } else {
            bookmarkedSections.add(sectionId);
            showNotification('Section bookmarked');
            document.querySelector('[data-action="bookmark"]').classList.add('bookmarked');
            setTimeout(() => {
                document.querySelector('[data-action="bookmark"]').classList.remove('bookmarked');
            }, 300);
        }
    }
}

// Keyboard shortcuts
document.addEventListener('keydown', (e) => {
    if (!helpMenu.classList.contains('hidden')) {
        switch(e.key) {
            case '/':
                if (!e.ctrlKey && !e.metaKey) {
                    e.preventDefault();
                    searchInput.focus();
                }
                break;
            case 'Escape':
                closeHelpMenu();
                break;
            case 'ArrowUp':
            case 'ArrowDown':
                navigateSections(e.key);
                break;
        }
    }
});

// Navigate sections with arrow keys
function navigateSections(direction) {
    const sections = Array.from(helpContent.querySelectorAll('.help-section'));
    const currentIndex = sections.findIndex(section => section.matches(':focus-within'));
    let nextIndex;
    
    if (direction === 'ArrowUp') {
        nextIndex = currentIndex > 0 ? currentIndex - 1 : sections.length - 1;
    } else {
        nextIndex = currentIndex < sections.length - 1 ? currentIndex + 1 : 0;
    }
    
    sections[nextIndex].focus();
}

// Close help menu
function closeHelpMenu() {
    helpMenu.classList.add('hidden');
    fetch(`https://${GetParentResourceName()}/closeHelpMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

// Search functionality
searchInput.addEventListener('input', (e) => {
    const searchTerm = e.target.value.toLowerCase();
    filterContent(searchTerm);
});

// Tab functionality
helpTabs.addEventListener('click', (e) => {
    if (e.target.classList.contains('tab-btn')) {
        // Update active tab
        document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
        e.target.classList.add('active');
        
        // Update current tab and filter content
        currentTab = e.target.dataset.tab;
        filterContent(searchInput.value.toLowerCase());
    }
});

// Function to filter content based on search and tab
function filterContent(searchTerm) {
    const sections = document.querySelectorAll('.help-section');
    
    sections.forEach(section => {
        const title = section.querySelector('h2').textContent.toLowerCase();
        const items = section.querySelectorAll('li');
        let hasVisibleItems = false;
        
        items.forEach(item => {
            const text = item.textContent.toLowerCase();
            const matchesSearch = text.includes(searchTerm);
            const matchesTab = currentTab === 'all' || title.includes(currentTab.toLowerCase());
            
            if (matchesSearch && matchesTab) {
                item.style.display = 'block';
                hasVisibleItems = true;
            } else {
                item.style.display = 'none';
            }
        });
        
        section.style.display = hasVisibleItems ? 'block' : 'none';
    });
}

// Function to create tabs from help text
function createTabs(helpText) {
    const tabs = ['all'];
    helpText.forEach(section => {
        const tabName = section.title.split(' ')[0].toLowerCase();
        if (!tabs.includes(tabName)) {
            tabs.push(tabName);
        }
    });
    
    tabs.forEach(tab => {
        const btn = document.createElement('button');
        btn.className = 'tab-btn';
        btn.dataset.tab = tab;
        btn.textContent = tab.charAt(0).toUpperCase() + tab.slice(1);
        if (tab === 'all') btn.classList.add('active');
        helpTabs.appendChild(btn);
    });
}

// Listen for messages from the game client
window.addEventListener('message', (event) => {
    let data = event.data;

    if (data.type === 'showHelpMenu') {
        helpMenu.classList.remove('hidden');
        helpData = data.helpText;
        currentLanguage = data.currentLanguage;
        configSettings = data.configSettings || {}; // Store received config settings
        
        // Update language selector if it exists
        const languageSelect = document.getElementById('language-select');
        if (languageSelect) {
            languageSelect.value = currentLanguage;
        }
        
        // Handle visibility of quick action buttons based on config
        document.querySelector('[data-action="copy"]').style.display = configSettings.enableQuickActions && configSettings.quickActions?.copy ? 'flex' : 'none';
        document.querySelector('[data-action="print"]').style.display = configSettings.enableQuickActions && configSettings.quickActions?.print ? 'flex' : 'none';
        document.querySelector('[data-action="bookmark"]').style.display = configSettings.enableQuickActions && configSettings.quickActions?.bookmark ? 'flex' : 'none';
        document.querySelector('[data-action="favorites"]').style.display = configSettings.enableFavorites ? 'flex' : 'none';
        document.querySelector('[data-action="history"]').style.display = configSettings.enableHistory ? 'flex' : 'none';
        document.querySelector('[data-action="shortcuts"]').style.display = configSettings.enableShortcuts ? 'flex' : 'none';

        createTabs(helpData);
        updateHelpContent(helpData);
    } else if (data.type === 'hideHelpMenu') {
        helpMenu.classList.add('hidden');
    }
});

// Function to update help content
function updateHelpContent(helpText) {
    helpContent.innerHTML = '';
    
    helpText.forEach(section => {
        let sectionDiv = document.createElement('div');
        sectionDiv.className = 'help-section';
        sectionDiv.setAttribute('tabindex', '0');
        
        let title = document.createElement('h2');
        title.innerHTML = `<i class="fas fa-${getIconForSection(section.title)}"></i> ${section.title}`;
        sectionDiv.appendChild(title);
        
        let list = document.createElement('ul');
        section.content.forEach(item => {
            let listItem = document.createElement('li');
            listItem.textContent = item;
            list.appendChild(listItem);
        });
        
        sectionDiv.appendChild(list);
        helpContent.appendChild(sectionDiv);
    });
    
    makeSectionsFocusable();
}

// Function to get appropriate icon for section
function getIconForSection(title) {
    const icons = {
        'Chat': 'comments',
        'Jobs': 'briefcase',
        'Useful': 'info-circle',
        'Rules': 'exclamation-triangle'
    };
    
    for (const [key, icon] of Object.entries(icons)) {
        if (title.includes(key)) return icon;
    }
    return 'question-circle';
}

// Close menu when pressing ESC
document.addEventListener('keyup', (event) => {
    if (event.key === 'Escape') {
        helpMenu.classList.add('hidden');
        fetch(`https://${GetParentResourceName()}/closeHelpMenu`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        });
    }
});

// Add tooltip event listeners
document.querySelectorAll('[title]').forEach(element => {
    element.addEventListener('mouseenter', (e) => {
        showTooltip(e.target, e.target.title);
    });
    element.addEventListener('mouseleave', hideTooltip);
});

// Make sections focusable
function makeSectionsFocusable() {
    document.querySelectorAll('.help-section').forEach(section => {
        section.setAttribute('tabindex', '0');
    });
}

// Initialize shortcuts panel
function initializeShortcuts() {
    loadShortcuts();
    setupShortcutTabs();
    setupShortcutModal();
    updateShortcutsList();
}

// Load shortcuts from localStorage
function loadShortcuts() {
    const savedShortcuts = localStorage.getItem('helpMenuShortcuts');
    if (savedShortcuts) {
        shortcuts = JSON.parse(savedShortcuts);
    }
}

// Save shortcuts to localStorage
function saveShortcuts() {
    localStorage.setItem('helpMenuShortcuts', JSON.stringify(shortcuts));
}

// Setup shortcut tabs
function setupShortcutTabs() {
    const tabs = document.querySelectorAll('.shortcut-tab');
    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            // Remove active class from all tabs and sections
            document.querySelectorAll('.shortcut-tab').forEach(t => t.classList.remove('active'));
            document.querySelectorAll('.shortcut-section').forEach(s => s.classList.remove('active'));
            
            // Add active class to clicked tab and corresponding section
            tab.classList.add('active');
            const sectionId = `${tab.dataset.tab}-section`;
            document.getElementById(sectionId).classList.add('active');
        });
    });
}

// Setup shortcut modal
function setupShortcutModal() {
    const modal = document.getElementById('add-shortcut-modal');
    const form = document.getElementById('shortcut-form');
    const shortcutKey = document.getElementById('shortcut-key');
    let isRecording = false;
    let currentKeys = [];

    // Open modal
    document.querySelectorAll('.add-shortcut').forEach(button => {
        button.addEventListener('click', () => {
            const type = button.dataset.type;
            form.dataset.type = type;
            modal.classList.add('active');
        });
    });

    // Close modal
    document.querySelectorAll('.close-modal').forEach(button => {
        button.addEventListener('click', () => {
            modal.classList.remove('active');
            form.reset();
            shortcutKey.classList.remove('recording');
            isRecording = false;
            currentKeys = [];
        });
    });

    // Record keyboard shortcut
    shortcutKey.addEventListener('click', () => {
        isRecording = !isRecording;
        shortcutKey.classList.toggle('recording');
        currentKeys = [];
    });

    // Handle keyboard input
    document.addEventListener('keydown', (e) => {
        if (!isRecording) return;
        e.preventDefault();
        
        const key = e.key.toLowerCase();
        if (!currentKeys.includes(key)) {
            currentKeys.push(key);
            shortcutKey.value = currentKeys.join(' + ');
        }
    });

    // Handle form submission
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const type = form.dataset.type;
        const name = document.getElementById('shortcut-name').value;
        const command = document.getElementById('shortcut-command').value;
        const description = document.getElementById('shortcut-description').value;
        const key = shortcutKey.value;

        const shortcut = {
            id: Date.now(),
            name,
            command,
            description,
            key: key || null
        };

        shortcuts[type].push(shortcut);
        saveShortcuts();
        updateShortcutsList();
        
        modal.classList.remove('active');
        form.reset();
        shortcutKey.classList.remove('recording');
        isRecording = false;
        currentKeys = [];
    });
}

// Update shortcuts list
function updateShortcutsList() {
    Object.keys(shortcuts).forEach(type => {
        const list = document.querySelector(`#${type}-section .shortcuts-list`);
        list.innerHTML = '';

        shortcuts[type].forEach(shortcut => {
            const item = document.createElement('div');
            item.className = 'shortcut-item';
            item.innerHTML = `
                <div class="shortcut-info">
                    <div class="shortcut-name">${shortcut.name}</div>
                    <div class="shortcut-description">${shortcut.description}</div>
                    <div class="shortcut-command">${shortcut.command}</div>
                </div>
                <div class="shortcut-actions">
                    ${shortcut.key ? `<span class="shortcut-key">${shortcut.key}</span>` : ''}
                    <button class="shortcut-action execute" title="Execute command">
                        <i class="fas fa-play"></i>
                    </button>
                    <button class="shortcut-action edit" title="Edit shortcut">
                        <i class="fas fa-edit"></i>
                    </button>
                    <button class="shortcut-action delete" title="Delete shortcut">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            `;

            // Add event listeners
            item.querySelector('.execute').addEventListener('click', () => {
                executeCommand(shortcut.command);
            });

            item.querySelector('.edit').addEventListener('click', () => {
                editShortcut(shortcut);
            });

            item.querySelector('.delete').addEventListener('click', () => {
                deleteShortcut(type, shortcut.id);
            });

            list.appendChild(item);
        });
    });
}

// Edit shortcut
function editShortcut(shortcut) {
    const modal = document.getElementById('add-shortcut-modal');
    const form = document.getElementById('shortcut-form');
    
    document.getElementById('shortcut-name').value = shortcut.name;
    document.getElementById('shortcut-command').value = shortcut.command;
    document.getElementById('shortcut-description').value = shortcut.description;
    document.getElementById('shortcut-key').value = shortcut.key || '';
    
    form.dataset.editId = shortcut.id;
    modal.classList.add('active');
}

// Delete shortcut
function deleteShortcut(type, id) {
    if (confirm('Are you sure you want to delete this shortcut?')) {
        shortcuts[type] = shortcuts[type].filter(s => s.id !== id);
        saveShortcuts();
        updateShortcutsList();
    }
}

// Handle keyboard shortcuts
document.addEventListener('keydown', (e) => {
    if (e.key.toLowerCase() === 's' && !isInputFocused()) {
        toggleShortcutsPanel();
    }
});

// Toggle shortcuts panel
function toggleShortcutsPanel() {
    const panel = document.getElementById('shortcuts-panel');
    panel.classList.toggle('active');
}

// Add language selector to the help menu
function initializeLanguageSelector() {
    const languageSelector = document.createElement('div');
    languageSelector.className = 'language-selector';
    languageSelector.innerHTML = `
        <select id="language-select">
            <option value="en">English</option>
            <option value="es">Español</option>
            <option value="fr">Français</option>
        </select>
    `;
    
    // Add the language selector to the help menu header
    const helpMenuHeader = document.querySelector('.help-header');
    helpMenuHeader.appendChild(languageSelector);
    
    // Set initial language
    const languageSelect = document.getElementById('language-select');
    languageSelect.value = currentLanguage;
    
    // Add event listener for language changes
    languageSelect.addEventListener('change', (e) => {
        const newLanguage = e.target.value;
        fetch(`https://${GetParentResourceName()}/changeLanguage`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                language: newLanguage
            })
        });
    });
}

// Initialize language selector when document is ready
document.addEventListener('DOMContentLoaded', () => {
    initializeShortcuts();
    initializeLanguageSelector();
});

// Add function to toggle side panels
function toggleSidePanel(panelId) {
    const panel = document.getElementById(panelId);
    if (panel) {
        // Close other open panels
        document.querySelectorAll('.side-panel.show').forEach(openPanel => {
            if (openPanel.id !== panelId) {
                openPanel.classList.remove('show');
            }
        });
        panel.classList.toggle('show');
    }
}

// Add event listeners to close side panels
document.querySelectorAll('.side-panel .close-panel').forEach(btn => {
    btn.addEventListener('click', (e) => {
        e.target.closest('.side-panel').classList.remove('show');
    });
});

// Close panels when clicking outside
document.addEventListener('click', (e) => {
    if (!e.target.closest('.side-panel') && !e.target.closest('.action-btn') && document.querySelector('.side-panel.show')) {
        document.querySelectorAll('.side-panel').forEach(panel => panel.classList.remove('show'));
    }
});

// Prevent clicks inside panels from closing them
document.querySelectorAll('.side-panel').forEach(panel => {
    panel.addEventListener('click', (e) => {
        e.stopPropagation();
    });
});

// Prevent clicks inside quick actions from closing panels
document.querySelector('.quick-actions').addEventListener('click', (e) => {
    e.stopPropagation();
});

// Prevent clicks inside search box from closing panels
document.querySelector('.search-box').addEventListener('click', (e) => {
    e.stopPropagation();
});

// Prevent clicks inside tabs from closing panels
document.querySelector('.help-tabs').addEventListener('click', (e) => {
    e.stopPropagation();
}); 