unix {
    SFDIR = SoftFloat-3c/source
    INCLUDEPATH += $$PWD $$PWD/$$SFDIR/include
    DEFINES += SOFTFLOAT_FAST_INT64
    DEFINES += QSOFTFLOAT_LIB
    LIBS += -L$$PWD -lqsoftfloat
}
