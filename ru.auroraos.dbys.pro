TARGET = ru.auroraos.dbys

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS +=

DISTFILES += \
    rpm/ru.auroraos.dbys.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.auroraos.dbys.ts \
    translations/ru.auroraos.dbys-ru.ts \
