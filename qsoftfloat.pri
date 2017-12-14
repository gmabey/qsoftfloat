win32 {
    INCLUDEPATH += $$PWD/include $$PWD/SoftFloat-3c/source/include
    DEFINES += QSOFTFLOAT_LIB
    include(qsoftfloatdefines.pri)
    debug {
    	LIBS += -L$$PWD/debug -lqsoftfloat
    } else {
    	LIBS += -L$$PWD/release -lqsoftfloat
    }
}
