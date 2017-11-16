/****************************************************************************
**
** Copyright (C) 2017 by Southwest Research Institute (R)
**
****************************************************************************/

#include "softfloat.h"
#include <qfloat128.h>
#include <string.h>

QT_BEGIN_NAMESPACE

#if QFLOAT_CLASS

qfloat128::qfloat128(double f) Q_DECL_NOTHROW
{
    float64_t g;
    memcpy(&g, &f, sizeof(double));
    f128 = f64_to_f128(g);
}

qfloat128::qfloat128(qint32 i) Q_DECL_NOTHROW
{
    f128 = i32_to_f128(i);
}

qfloat128::qfloat128(quint32 i) Q_DECL_NOTHROW
{
    f128 = ui32_to_f128(i);
}

qfloat128::qfloat128(qint64 i) Q_DECL_NOTHROW
{
    f128 = i64_to_f128(i);
}

qfloat128::qfloat128(quint64 i) Q_DECL_NOTHROW
{
    f128 = ui64_to_f128(i);
}

qfloat128::qfloat128(qfloat80 f) Q_DECL_NOTHROW
{
    f128 = extF80_to_f128(f.ext80);
}

qfloat128::operator double() const Q_DECL_NOTHROW
{
    float64_t f = f128_to_f64(f128);
    double d;
    memcpy(&d, &f, sizeof(double));
    return d;
}

qfloat128::operator qint32() const Q_DECL_NOTHROW
{
    return f128_to_i32_r_minMag(f128, false); // 2nd arg is `exact'
}

qfloat128::operator quint32() const Q_DECL_NOTHROW
{
    return f128_to_ui32_r_minMag(f128, false); // 2nd arg is `exact'
}

qfloat128::operator qint64() const Q_DECL_NOTHROW
{
    return f128_to_i64_r_minMag(f128, false); // 2nd arg is `exact'
}

qfloat128::operator quint64() const Q_DECL_NOTHROW
{
    return f128_to_ui64_r_minMag(f128, false); // 2nd arg is `exact'
}

#define QF128_MAKE_ARITH_OP(OP, ABREV) \
    qfloat128 operator OP(qfloat128 a, qfloat128 b) Q_DECL_NOTHROW \
    { qfloat128 r; r.f128 = f128_##ABREV(a.f128, b.f128); return r; }

QF128_MAKE_ARITH_OP(+, add)
QF128_MAKE_ARITH_OP(-, sub)
QF128_MAKE_ARITH_OP(*, mul)
QF128_MAKE_ARITH_OP(/, div)

bool operator<(qfloat128 a, qfloat128 b) Q_DECL_NOTHROW
{
    return f128_lt(a.f128, b.f128);
}

bool operator<=(qfloat128 a, qfloat128 b) Q_DECL_NOTHROW
{
    return f128_le(a.f128, b.f128);
}

bool operator==(qfloat128 a, qfloat128 b) Q_DECL_NOTHROW
{
    return f128_eq(a.f128, b.f128);
}

#endif  // QFLOAT_CLASS

QT_END_NAMESPACE
