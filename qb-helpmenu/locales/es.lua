local Translations = {
    error = {
        not_authorized = "No estás autorizado a usar este comando",
    },
    success = {
        help_menu_shown = "Menú de ayuda mostrado",
        help_menu_hidden = "Menú de ayuda oculto",
    },
    info = {
        help_menu = "Menú de Ayuda",
        press_f7 = "Presiona F7 para alternar el menú de ayuda",
    },

    -- New Player Notification Messages
    notification = {
        first_time = "¡Bienvenido al servidor! Mostrándote el menú de ayuda para comenzar.",
        returning_player = "¡Bienvenido de nuevo! Han pasado %d días desde tu última visita. Mostrándote el menú de ayuda para refrescar tu memoria.",
        help_available = "Recuerda, siempre puedes acceder al menú de ayuda usando el comando /help o presionando F7.",
        content_copied = "Contenido copiado al portapapeles",
        section_bookmarked = "Sección marcada",
        section_unbookmarked = "Sección desmarcada",
        command_executing = "Ejecutando comando: %s",
        theme_switched = "Cambiado a tema %s",
        shortcut_removed = "Eliminado de favoritos",
    },

    -- Help Menu Content (Titles and items)
    help_content = {
        general = {
            title = "Comandos Generales",
            content = {
                "/help - Mostrar este menú de ayuda",
                "/report - Reportar a un jugador",
                "/ooc - Chat fuera de personaje"
            }
        },
        job = {
            police = {
                title = "Comandos de Policía",
                content = {
                    "/duty - Alternar estado de servicio",
                    "/cuff - Esposar a un jugador",
                    "/uncuff - Quitar esposas",
                    "/escort - Escoltar a un jugador"
                }
            },
            ambulance = {
                title = "Comandos de EMS",
                content = {
                    "/duty - Alternar estado de servicio",
                    "/heal - Curar a un jugador",
                    "/revive - Revivir a un jugador",
                    "/check - Verificar estado del jugador"
                }
            },
        },
        gang = {
            ballas = {
                title = "Información de Pandilla Ballas",
                content = {
                    "Territorio: Strawberry",
                    "Comandos de Pandilla: /gang",
                    "Control de Territorio: /turf"
                }
            },
        },
        newPlayer = {
            getting_started = {
                title = "Comenzando",
                content = {
                    "¡Bienvenido al servidor! Nos alegra tenerte aquí.",
                    "Esta guía te ayudará a comenzar con lo básico.",
                    "Recuerda leer las reglas del servidor en nuestro Discord.",
                    "¡No dudes en pedir ayuda al personal u otros jugadores!"
                }
            },
            basic_controls = {
                title = "Controles Básicos",
                content = {
                    "F1 - Abrir teléfono",
                    "F2 - Abrir inventario",
                    "F3 - Abrir menú de personaje",
                    "F5 - Abrir menú de trabajo",
                    "F6 - Abrir menú de radio",
                    "F7 - Abrir menú de ayuda",
                    "TAB - Abrir tabla de puntuación",
                    "ESC - Abrir menú de pausa"
                }
            },
            essential_commands = {
                title = "Comandos Esenciales",
                content = {
                    "/help - Mostrar este menú de ayuda",
                    "/report - Reportar a un jugador o problema",
                    "/ooc - Chat fuera de personaje",
                    "/me - Acción de rol",
                    "/do - Descripción de rol",
                    "/try - Intentar una acción",
                    "/911 - Servicios de emergencia",
                    "/311 - Servicios no urgentes"
                }
            },
            roleplay_guide = {
                title = "Guía de Rol",
                content = {
                    "Siempre mantente en personaje (IC)",
                    "Usa /me para acciones y /do para descripciones",
                    "Respeta el rol de otros jugadores",
                    "Sigue las reglas y pautas del servidor",
                    "Usa gramática y ortografía adecuadas",
                    "Evita el meta-gaming y power-gaming",
                    "Reporta a los infractores al personal"
                }
            },
            jobs_economy = {
                title = "Trabajos y Economía",
                content = {
                    "Visita el centro de empleo para encontrar trabajo",
                    "Comienza con trabajos básicos como repartidor o basurero",
                    "Ahorra dinero para comprar vehículos y propiedades",
                    "Únete a una empresa para mejor pago y beneficios",
                    "Revisa el tablón de trabajos para posiciones disponibles",
                    "Algunos trabajos requieren licencias específicas",
                    "Asciende a través de los rangos del trabajo"
                }
            },
            transportation = {
                title = "Transporte",
                content = {
                    "Usa transporte público (autobús/tren)",
                    "Compra vehículos en concesionarios",
                    "Renta vehículos para uso a corto plazo",
                    "Usa servicios de taxi (/taxi)",
                    "Compra un vehículo personal",
                    "Mantén tus vehículos regularmente",
                    "Sigue las leyes de tráfico y límites de velocidad"
                }
            },
            housing = {
                title = "Vivienda",
                content = {
                    "Visita agentes inmobiliarios para propiedades",
                    "Comienza con apartamentos o casas pequeñas",
                    "Ahorra dinero para mejores propiedades",
                    "Personaliza tu hogar con muebles",
                    "Guarda vehículos en tu garaje",
                    "Invita amigos a tu propiedad",
                    "Paga renta o hipoteca a tiempo"
                }
            },
            emergency_services = {
                title = "Servicios de Emergencia",
                content = {
                    "/911 - Llamar a servicios de emergencia",
                    "/311 - Llamar a servicios no urgentes",
                    "La policía responde a crímenes y accidentes",
                    "EMS puede curar y revivir jugadores",
                    "Bomberos manejan incendios y rescates",
                    "Mantén la calma durante emergencias",
                    "Sigue las instrucciones de los servicios de emergencia"
                }
            },
            tips_tricks = {
                title = "Consejos y Trucos",
                content = {
                    "Únete al Discord del servidor para actualizaciones",
                    "Haz amigos y únete a un grupo",
                    "Aprende el mapa y ubicaciones importantes",
                    "Ahorra dinero para emergencias",
                    "Mantén tu teléfono cargado",
                    "Usa el sistema GPS para navegación",
                    "Revisa el sitio web del servidor para guías"
                }
            },
            community = {
                title = "Comunidad",
                content = {
                    "Únete a nuestro servidor Discord",
                    "Síguenos en redes sociales",
                    "Participa en eventos comunitarios",
                    "Únete a grupos de rol y organizaciones",
                    "Haz amigos y construye relaciones",
                    "Ayuda a otros jugadores nuevos",
                    "Reporta errores y sugiere mejoras"
                }
            },
            server_rules = {
                title = "Reglas y Pautas del Servidor",
                content = {
                    "Respeta a todos los jugadores y el personal.",
                    "No hagas trampa, exploits o mods no autorizados.",
                    "No acoses, discurso de odio o comportamiento tóxico.",
                    "Valora la vida de tu personaje (no fall RP).",
                    "Sigue todas las reglas de rol y del servidor."
                }
            },
            voice_chat = {
                title = "Cómo Usar el Chat de Voz",
                content = {
                    "Presiona [N] para hablar (o la tecla de voz de tu servidor).",
                    "Ajusta tu rango de voz con [Z] (susurro, normal, gritar).",
                    "Usa auriculares para mejor calidad de audio.",
                    "No hables OOC (fuera de personaje) en voz a menos que sea necesario."
                }
            },
            make_money = {
                title = "Cómo Ganar Dinero",
                content = {
                    "Comienza con trabajos legales: repartidor, basurero, taxi, pesca, minería, etc.",
                    "Busca trabajos secundarios: reciclaje, recolección o trabajos ocasionales.",
                    "Ahorra para licencias que desbloqueen mejores trabajos.",
                    "Evita actividades ilegales hasta que entiendas las reglas del servidor."
                }
            },
            get_vehicle = {
                title = "Cómo Obtener un Vehículo",
                content = {
                    "Visita el concesionario para comprar tu primer auto.",
                    "Usa transporte público o taxis si no tienes auto.",
                    "Renta vehículos para uso a corto plazo.",
                    "No robes vehículos—esto puede meterte en problemas con la policía y el personal."
                }
            },
            get_house = {
                title = "Cómo Obtener una Casa",
                content = {
                    "Visita la oficina inmobiliaria o usa el menú /house.",
                    "Comienza con apartamentos o casas pequeñas.",
                    "Ahorra dinero para mejores propiedades",
                    "Personaliza tu hogar con muebles",
                    "Guarda vehículos en tu garaje",
                    "Invita amigos a tu propiedad",
                    "Paga renta o hipoteca a tiempo"
                }
            },
            interact_players = {
                title = "Cómo Interactuar con Otros Jugadores",
                content = {
                    "Usa /me y /do para acciones y descripciones de rol.",
                    "Sé educado y mantente en personaje.",
                    "Únete a grupos, pandillas u organizaciones para más oportunidades de rol."
                }
            },
            contact_staff = {
                title = "Cómo Contactar al Personal",
                content = {
                    "Usa /report para contactar al personal para ayuda o reportar problemas.",
                    "Únete al Discord para soporte y anuncios.",
                    "No spamees al personal con solicitudes innecesarias."
                }
            },
            use_phone = {
                title = "Cómo Usar el Teléfono",
                content = {
                    "Presiona F1 para abrir tu teléfono.",
                    "Usa el teléfono para mensajes, llamadas, GPS y aplicaciones de trabajo.",
                    "Añade contactos importantes (policía, EMS, amigos)."
                }
            },
            use_inventory = {
                title = "Cómo Usar el Inventario",
                content = {
                    "Presiona F2 para abrir tu inventario.",
                    "Arrastra y suelta objetos para usarlos, darlos o soltarlos.",
                    "Mantén tu inventario organizado y no cargues objetos ilegales."
                }
            },
            stay_safe = {
                title = "Cómo Mantenerse Seguro",
                content = {
                    "No compartas tu cuenta o contraseña.",
                    "Ten cuidado con estafas y personal falso.",
                    "Reporta comportamiento sospechoso al personal."
                }
            },
            join_events = {
                title = "Cómo Unirse a Eventos",
                content = {
                    "Esté atento a los anuncios del servidor sobre eventos.",
                    "Participa en carreras, trabajos o reuniones comunitarias.",
                    "Gana premios y conoce nuevos amigos."
                }
            },
            useful_locations = {
                title = "Ubicaciones Útiles",
                content = {
                    "Centro de Empleo: Obtén un trabajo o cambia de carrera.",
                    "Hospital: Cúrate o reaparece si estás herido.",
                    "Comisaría: Reporta crímenes o busca ayuda.",
                    "Concesionario: Compra o vende vehículos.",
                    "Banco: Deposita o retira dinero."
                }
            },
            faq = {
                title = "Preguntas Frecuentes",
                content = {
                    "¿Cómo empiezo? Usa /help y lee la guía de jugador nuevo.",
                    "¿Qué hago si estoy atascado o perdido? Usa /report o pregunta en Discord.",
                    "¿Cómo hago amigos? Únete a eventos, grupos o habla con jugadores.",
                    "¿Dónde encuentro las reglas? En Discord o el menú /help.",
                    "¿A quién contacto para ayuda? Usa /report o contacta al personal en Discord."
                }
            },
        }
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
}) 