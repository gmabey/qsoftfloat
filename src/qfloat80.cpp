/****************************************************************************
**
** Copyright (C) 2017 by Southwest Research Institute (R)
**
****************************************************************************/

#include "softfloat.h"
#include <qfloat80.h>
#include <string.h>

QT_BEGIN_NAMESPACE

#if QFLOAT_CLASS

qfloat80::qfloat80(double f) Q_DECL_NOTHROW
{
    float64_t g;
    memcpy(&g, &f, sizeof(double));
    ext80 = f64_to_extF80(g);
}

qfloat80::qfloat80(qint32 i) Q_DECL_NOTHROW
{
    ext80 = i32_to_extF80(i);
}

qfloat80::qfloat80(quint32 i) Q_DECL_NOTHROW
{
    ext80 = ui32_to_extF80(i);
}

qfloat80::qfloat80(qint64 i) Q_DECL_NOTHROW
{
    ext80 = i64_to_extF80(i);
}

qfloat80::qfloat80(quint64 i) Q_DECL_NOTHROW
{
    ext80 = ui64_to_extF80(i);
}

qfloat80::qfloat80(qfloat128 f) Q_DECL_NOTHROW
{
    ext80 = f128_to_extF80(f.f128);
}

qfloat80::operator double() const Q_DECL_NOTHROW
{
    float64_t f = extF80_to_f64(ext80);
    double d;
    memcpy(&d, &f, sizeof(double));
    return d;
}

qfloat80::operator qint32() const Q_DECL_NOTHROW
{
    return extF80_to_i32_r_minMag(ext80, false); // 2nd arg is `exact'
}

qfloat80::operator quint32() const Q_DECL_NOTHROW
{
    return extF80_to_ui32_r_minMag(ext80, false); // 2nd arg is `exact'
}

qfloat80::operator qint64() const Q_DECL_NOTHROW
{
    return extF80_to_i64_r_minMag(ext80, false); // 2nd arg is `exact'
}

qfloat80::operator quint64() const Q_DECL_NOTHROW
{
    return extF80_to_ui64_r_minMag(ext80, false); // 2nd arg is `exact'
}

#define QF80_MAKE_ARITH_OP(OP, ABREV) \
    qfloat80 operator OP(qfloat80 a, qfloat80 b) Q_DECL_NOTHROW \
    { qfloat80 r; r.ext80 = extF80_##ABREV(a.ext80, b.ext80); return r; }

QF80_MAKE_ARITH_OP(+, add)
QF80_MAKE_ARITH_OP(-, sub)
QF80_MAKE_ARITH_OP(*, mul)
QF80_MAKE_ARITH_OP(/, div)

bool operator<(qfloat80 a, qfloat80 b) Q_DECL_NOTHROW
{
    return extF80_lt(a.ext80, b.ext80);
}

bool operator<=(qfloat80 a, qfloat80 b) Q_DECL_NOTHROW
{
    return extF80_le(a.ext80, b.ext80);
}

bool operator==(qfloat80 a, qfloat80 b) Q_DECL_NOTHROW
{
    return extF80_eq(a.ext80, b.ext80);
}

#endif  // QFLOAT_CLASS

QT_END_NAMESPACE
