win32 {
    INCLUDEPATH += $$PWD/include $$PWD/SoftFloat-3c/source/include
    DEFINES += SOFTFLOAT_FAST_INT64 QSOFTFLOAT_LIB
    LIBS += -L$$PWD -lqsoftfloat
}
