INCLUDEPATH += $$PWD/include $$PWD/SoftFloat-3c/source/include
DEFINES += QSOFTFLOAT_LIB
include(qsoftfloatdefines.pri)
win32 {
    debug {
        QSF_LIBDIR = $$PWD/debug
    } else {
        QSF_LIBDIR = $$PWD/release
    }
} else {
    QSF_LIBDIR = $$PWD
}
LIBS += -L$$QSF_LIBDIR -lqsoftfloat
