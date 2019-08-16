var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "720",
                    "DialogWidth": "960"
                },
                "/Configuration": {
                    "PreloadWeight": "0"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///usr/share/wallpapers/Matchama-Dark/contents/images/1920x1080.jpg"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "0"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "720",
                            "DialogWidth": "960"
                        }
                    },
                    "plugin": "org.kde.plasma.pager"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "0"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "720",
                            "DialogWidth": "960"
                        },
                        "/General": {
                            "maxStripes": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.taskmanager"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "0"
                        }
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {

                    "config": {
                        "/": {
                            "PreloadWeight": "92"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "720",
                            "DialogWidth": "960"
                        },
                        "/General": {
                            "favoritesPortedToKAstats": "true",
                            "icon": "/usr/share/icons/start.svg",
                            "menuItems": "bookmark:t,application:t,leave:t,oftenUsed:f,used:f,computer:f",
                            "useExtraRunners": "false"
                        }
                    },
                    "plugin": ""
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "97"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "720",
                            "DialogWidth": "960"
                        },
                        "/General": {
                            "favoritesPortedToKAstats": "true",
                            "icon": "/usr/share/icons/start.svg",
                            "menuItems": "bookmark:t,application:t,leave:t,oftenUsed:f,computer:f,used:f",
                            "useExtraRunners": "false"
                        }
                    },
                    "plugin": "org.kde.plasma.kickoff"
                },
                {
                    "config": {
                        "/Applet": {
                            "mediaControllerLocation": "top",
                            "showVisualFeedback": "false"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.showdesktop"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "82",
                    "DialogWidth": "1920"
                },
                "/Configuration": {
                    "PreloadWeight": "0"
                }
            },
            "height": 1.6666666666666667,
            "hiding": "normal",
            "location": "bottom",
            "maximumLength": 80,
            "minimumLength": 80,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
