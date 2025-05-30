local Translations = {
    error = {
        not_authorized = "Vous n'êtes pas autorisé à utiliser cette commande",
    },
    success = {
        help_menu_shown = "Menu d'aide affiché",
        help_menu_hidden = "Menu d'aide masqué",
    },
    info = {
        help_menu = "Menu d'Aide",
        press_f7 = "Appuyez sur F7 pour basculer le menu d'aide",
    },

    -- New Player Notification Messages
    notification = {
        first_time = "Bienvenue sur le serveur ! Affichage du menu d'aide pour commencer.",
        returning_player = "Bon retour ! Cela fait %d jours depuis votre dernière visite. Affichage du menu d'aide pour rafraîchir votre mémoire.",
        help_available = "N'oubliez pas, vous pouvez toujours accéder au menu d'aide en utilisant la commande /help ou en appuyant sur F7.",
        content_copied = "Contenu copié dans le presse-papiers",
        section_bookmarked = "Section marquée",
        section_unbookmarked = "Marque de section supprimée",
        command_executing = "Exécution de la commande : %s",
        theme_switched = "Passage au thème %s",
        shortcut_removed = "Supprimé des favoris",
    },

    -- Help Menu Content (Titles and items)
    help_content = {
        general = {
            title = "Commandes Générales",
            content = {
                "/help - Afficher ce menu d'aide",
                "/report - Signaler un joueur",
                "/ooc - Chat hors personnage"
            }
        },
        job = {
            police = {
                title = "Commandes de Police",
                content = {
                    "/duty - Basculer le statut de service",
                    "/cuff - Menotter un joueur",
                    "/uncuff - Enlever les menottes",
                    "/escort - Escorter un joueur"
                }
            },
            ambulance = {
                title = "Commandes EMS",
                content = {
                    "/duty - Basculer le statut de service",
                    "/heal - Soigner un joueur",
                    "/revive - Réanimer un joueur",
                    "/check - Vérifier l'état du joueur"
                }
            },
        },
        gang = {
            ballas = {
                title = "Informations sur le Gang Ballas",
                content = {
                    "Territoire : Strawberry",
                    "Commandes de Gang : /gang",
                    "Contrôle du Territoire : /turf"
                }
            },
        },
        newPlayer = {
            getting_started = {
                title = "Pour Commencer",
                content = {
                    "Bienvenue sur le serveur ! Nous sommes ravis de vous accueillir.",
                    "Ce guide vous aidera à démarrer avec les bases.",
                    "N'oubliez pas de lire les règles du serveur sur notre Discord.",
                    "N'hésitez pas à demander de l'aide au staff ou aux autres joueurs !"
                }
            },
            basic_controls = {
                title = "Contrôles de Base",
                content = {
                    "F1 - Ouvrir le téléphone",
                    "F2 - Ouvrir l'inventaire",
                    "F3 - Ouvrir le menu du personnage",
                    "F5 - Ouvrir le menu des jobs",
                    "F6 - Ouvrir le menu radio",
                    "F7 - Ouvrir le menu d'aide",
                    "TAB - Ouvrir le tableau des scores",
                    "ESC - Ouvrir le menu pause"
                }
            },
            essential_commands = {
                title = "Commandes Essentielles",
                content = {
                    "/help - Afficher ce menu d'aide",
                    "/report - Signaler un joueur ou un problème",
                    "/ooc - Chat hors personnage",
                    "/me - Action de roleplay",
                    "/do - Description de roleplay",
                    "/try - Tenter une action",
                    "/911 - Services d'urgence",
                    "/311 - Services non urgents"
                }
            },
            roleplay_guide = {
                title = "Guide du Roleplay",
                content = {
                    "Restez toujours en personnage (IC)",
                    "Utilisez /me pour les actions et /do pour les descriptions",
                    "Respectez le roleplay des autres joueurs",
                    "Suivez les règles et directives du serveur",
                    "Utilisez une grammaire et une orthographe correctes",
                    "Évitez le meta-gaming et le power-gaming",
                    "Signalez les infractions au staff"
                }
            },
            jobs_economy = {
                title = "Jobs et Économie",
                content = {
                    "Visitez le centre d'emploi pour trouver du travail",
                    "Commencez par des jobs basiques comme livreur ou éboueur",
                    "Économisez pour acheter des véhicules et des propriétés",
                    "Rejoignez une entreprise pour un meilleur salaire et des avantages",
                    "Consultez le tableau d'emploi pour les postes disponibles",
                    "Certains jobs nécessitent des licences spécifiques",
                    "Progressez dans les rangs des jobs"
                }
            },
            transportation = {
                title = "Transport",
                content = {
                    "Utilisez les transports en commun (bus/train)",
                    "Achetez des véhicules chez les concessionnaires",
                    "Louez des véhicules pour un usage à court terme",
                    "Utilisez les services de taxi (/taxi)",
                    "Achetez un véhicule personnel",
                    "Entretenez régulièrement vos véhicules",
                    "Respectez le code de la route et les limites de vitesse"
                }
            },
            housing = {
                title = "Logement",
                content = {
                    "Visitez les agents immobiliers pour les propriétés",
                    "Commencez par des appartements ou de petites maisons",
                    "Économisez pour de meilleures propriétés",
                    "Personnalisez votre maison avec des meubles",
                    "Rangez vos véhicules dans votre garage",
                    "Invitez des amis dans votre propriété",
                    "Payez votre loyer ou hypothèque à temps"
                }
            },
            emergency_services = {
                title = "Services d'Urgence",
                content = {
                    "/911 - Appeler les services d'urgence",
                    "/311 - Appeler les services non urgents",
                    "La police répond aux crimes et accidents",
                    "Les EMS peuvent soigner et réanimer les joueurs",
                    "Les pompiers gèrent les incendies et les sauvetages",
                    "Restez calme pendant les urgences",
                    "Suivez les instructions des services d'urgence"
                }
            },
            tips_tricks = {
                title = "Conseils et Astuces",
                content = {
                    "Rejoignez le Discord du serveur pour les mises à jour",
                    "Faites des amis et rejoignez un groupe",
                    "Apprenez la carte et les emplacements importants",
                    "Économisez pour les urgences",
                    "Gardez votre téléphone chargé",
                    "Utilisez le système GPS pour la navigation",
                    "Consultez le site web du serveur pour les guides"
                }
            },
            community = {
                title = "Communauté",
                content = {
                    "Rejoignez notre serveur Discord",
                    "Suivez-nous sur les réseaux sociaux",
                    "Participez aux événements communautaires",
                    "Rejoignez des groupes de roleplay et des organisations",
                    "Faites des amis et construisez des relations",
                    "Aidez les autres nouveaux joueurs",
                    "Signalez les bugs et suggérez des améliorations"
                }
            },
            server_rules = {
                title = "Règles et Directives du Serveur",
                content = {
                    "Respectez tous les joueurs et le staff.",
                    "Pas de triche, d'exploits ou de mods non autorisés.",
                    "Pas de harcèlement, de discours haineux ou de comportement toxique.",
                    "Valorisez la vie de votre personnage (no fail RP).",
                    "Suivez toutes les règles de roleplay et du serveur."
                }
            },
            voice_chat = {
                title = "Comment Utiliser le Chat Vocal",
                content = {
                    "Appuyez sur [N] pour parler (ou la touche vocale de votre serveur).",
                    "Ajustez votre portée vocale avec [Z] (chuchotement, normal, cri).",
                    "Utilisez un casque pour une meilleure qualité audio.",
                    "Ne parlez pas OOC (hors personnage) en vocal sauf si nécessaire."
                }
            },
            make_money = {
                title = "Comment Gagner de l'Argent",
                content = {
                    "Commencez par des jobs légaux : livreur, éboueur, taxi, pêche, mine, etc.",
                    "Cherchez des activités secondaires : recyclage, collecte ou petits boulots.",
                    "Économisez pour des licences qui débloquent de meilleurs jobs.",
                    "Évitez les activités illégales jusqu'à ce que vous compreniez les règles du serveur."
                }
            },
            get_vehicle = {
                title = "Comment Obtenir un Véhicule",
                content = {
                    "Visitez le concessionnaire pour acheter votre première voiture.",
                    "Utilisez les transports en commun ou les taxis si vous n'avez pas de voiture.",
                    "Louez des véhicules pour un usage à court terme.",
                    "Ne volez pas de véhicules—cela peut vous causer des problèmes avec la police et le staff."
                }
            },
            get_house = {
                title = "Comment Obtenir une Maison",
                content = {
                    "Visitez l'agence immobilière ou utilisez le menu /house.",
                    "Commencez par des appartements ou de petites maisons.",
                    "Économisez pour de meilleures propriétés",
                    "Personnalisez votre maison avec des meubles",
                    "Rangez vos véhicules dans votre garage",
                    "Invitez des amis dans votre propriété",
                    "Payez votre loyer ou hypothèque à temps"
                }
            },
            interact_players = {
                title = "Comment Interagir avec les Autres Joueurs",
                content = {
                    "Utilisez /me et /do pour les actions et descriptions de roleplay.",
                    "Soyez poli et restez en personnage.",
                    "Rejoignez des groupes, des gangs ou des organisations pour plus d'opportunités de roleplay."
                }
            },
            contact_staff = {
                title = "Comment Contacter le Staff",
                content = {
                    "Utilisez /report pour contacter le staff pour de l'aide ou signaler des problèmes.",
                    "Rejoignez le Discord pour le support et les annonces.",
                    "Ne spammez pas le staff avec des demandes inutiles."
                }
            },
            use_phone = {
                title = "Comment Utiliser le Téléphone",
                content = {
                    "Appuyez sur F1 pour ouvrir votre téléphone.",
                    "Utilisez le téléphone pour les messages, appels, GPS et applications de job.",
                    "Ajoutez des contacts importants (police, EMS, amis)."
                }
            },
            use_inventory = {
                title = "Comment Utiliser l'Inventaire",
                content = {
                    "Appuyez sur F2 pour ouvrir votre inventaire.",
                    "Glissez et déposez les objets pour les utiliser, les donner ou les jeter.",
                    "Gardez votre inventaire organisé et ne transportez pas d'objets illégaux."
                }
            },
            stay_safe = {
                title = "Comment Rester en Sécurité",
                content = {
                    "Ne partagez pas votre compte ou mot de passe.",
                    "Méfiez-vous des arnaques et du faux staff.",
                    "Signalez les comportements suspects au staff."
                }
            },
            join_events = {
                title = "Comment Participer aux Événements",
                content = {
                    "Soyez attentif aux annonces du serveur concernant les événements.",
                    "Participez aux courses, jobs ou rassemblements communautaires.",
                    "Gagnez des prix et rencontrez de nouveaux amis."
                }
            },
            useful_locations = {
                title = "Emplacements Utiles",
                content = {
                    "Centre d'Emploi : Obtenez un job ou changez de carrière.",
                    "Hôpital : Soignez-vous ou réapparaissez si vous êtes blessé.",
                    "Commissariat : Signalez des crimes ou demandez de l'aide.",
                    "Concessionnaire : Achetez ou vendez des véhicules.",
                    "Banque : Déposez ou retirez de l'argent."
                }
            },
            faq = {
                title = "FAQ (Questions Fréquemment Posées)",
                content = {
                    "Comment commencer ? Utilisez /help et lisez le guide du nouveau joueur.",
                    "Que faire si je suis coincé ou perdu ? Utilisez /report ou demandez sur Discord.",
                    "Comment se faire des amis ? Rejoignez des événements, des groupes ou parlez aux joueurs.",
                    "Où trouver les règles ? Sur Discord ou dans le menu /help.",
                    "Qui contacter pour de l'aide ? Utilisez /report ou contactez le staff sur Discord."
                }
            },
        }
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
}) 