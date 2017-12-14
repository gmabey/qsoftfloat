TEMPLATE = lib
CONFIG += staticlib

QT = core

SF = SoftFloat-3c
SF_BLD = $$SF/build
SF_SRC = $$SF/source

SPECIALIZE_TYPE = 8086-SSE

INCLUDEPATH = include qt_platform $$SF_SRC/$$SPECIALIZE_TYPE $$SF_SRC/include
include(qsoftfloatdefines.pri)

OBJECTS_DIR = .obj

VPATH = $$SF_SRC

SOURCES += src/qfloat80.cpp src/qfloat128.cpp

OBJS_PRIMITIVES = \
  s_eq128.c \
  s_le128.c \
  s_lt128.c \
  s_shortShiftLeft128.c \
  s_shortShiftRight128.c \
  s_shortShiftRightJam64.c \
  s_shortShiftRightJam64Extra.c \
  s_shortShiftRightJam128.c \
  s_shortShiftRightJam128Extra.c \
  s_shiftRightJam32.c \
  s_shiftRightJam64.c \
  s_shiftRightJam64Extra.c \
  s_shiftRightJam128.c \
  s_shiftRightJam128Extra.c \
  s_shiftRightJam256M.c \
  s_countLeadingZeros8.c \
  s_countLeadingZeros16.c \
  s_countLeadingZeros32.c \
  s_countLeadingZeros64.c \
  s_add128.c \
  s_add256M.c \
  s_sub128.c \
  s_sub256M.c \
  s_mul64ByShifted32To128.c \
  s_mul64To128.c \
  s_mul128By32.c \
  s_mul128To256M.c \
  s_approxRecip_1Ks.c \
  s_approxRecip32_1.c \
  s_approxRecipSqrt_1Ks.c \
  s_approxRecipSqrt32_1.c \

OBJS_SPECIALIZE = \
  $$SPECIALIZE_TYPE/softfloat_raiseFlags.c \
  $$SPECIALIZE_TYPE/s_f16UIToCommonNaN.c \
  $$SPECIALIZE_TYPE/s_commonNaNToF16UI.c \
  $$SPECIALIZE_TYPE/s_propagateNaNF16UI.c \
  $$SPECIALIZE_TYPE/s_f32UIToCommonNaN.c \
  $$SPECIALIZE_TYPE/s_commonNaNToF32UI.c \
  $$SPECIALIZE_TYPE/s_propagateNaNF32UI.c \
  $$SPECIALIZE_TYPE/s_f64UIToCommonNaN.c \
  $$SPECIALIZE_TYPE/s_commonNaNToF64UI.c \
  $$SPECIALIZE_TYPE/s_propagateNaNF64UI.c \
  $$SPECIALIZE_TYPE/extF80M_isSignalingNaN.c \
  $$SPECIALIZE_TYPE/s_extF80UIToCommonNaN.c \
  $$SPECIALIZE_TYPE/s_commonNaNToExtF80UI.c \
  $$SPECIALIZE_TYPE/s_propagateNaNExtF80UI.c \
  $$SPECIALIZE_TYPE/f128M_isSignalingNaN.c \
  $$SPECIALIZE_TYPE/s_f128UIToCommonNaN.c \
  $$SPECIALIZE_TYPE/s_commonNaNToF128UI.c \
  $$SPECIALIZE_TYPE/s_propagateNaNF128UI.c

OBJS_OTHERS = \
  s_roundToUI32.c \
  s_roundToUI64.c \
  s_roundToI32.c \
  s_roundToI64.c \
  s_normSubnormalF16Sig.c \
  s_roundPackToF16.c \
  s_normRoundPackToF16.c \
  s_addMagsF16.c \
  s_subMagsF16.c \
  s_mulAddF16.c \
  s_normSubnormalF32Sig.c \
  s_roundPackToF32.c \
  s_normRoundPackToF32.c \
  s_addMagsF32.c \
  s_subMagsF32.c \
  s_mulAddF32.c \
  s_normSubnormalF64Sig.c \
  s_roundPackToF64.c \
  s_normRoundPackToF64.c \
  s_addMagsF64.c \
  s_subMagsF64.c \
  s_mulAddF64.c \
  s_normSubnormalExtF80Sig.c \
  s_roundPackToExtF80.c \
  s_normRoundPackToExtF80.c \
  s_addMagsExtF80.c \
  s_subMagsExtF80.c \
  s_normSubnormalF128Sig.c \
  s_roundPackToF128.c \
  s_normRoundPackToF128.c \
  s_addMagsF128.c \
  s_subMagsF128.c \
  s_mulAddF128.c \
  softfloat_state.c \
  ui32_to_f16.c \
  ui32_to_f32.c \
  ui32_to_f64.c \
  ui32_to_extF80.c \
  ui32_to_extF80M.c \
  ui32_to_f128.c \
  ui32_to_f128M.c \
  ui64_to_f16.c \
  ui64_to_f32.c \
  ui64_to_f64.c \
  ui64_to_extF80.c \
  ui64_to_extF80M.c \
  ui64_to_f128.c \
  ui64_to_f128M.c \
  i32_to_f16.c \
  i32_to_f32.c \
  i32_to_f64.c \
  i32_to_extF80.c \
  i32_to_extF80M.c \
  i32_to_f128.c \
  i32_to_f128M.c \
  i64_to_f16.c \
  i64_to_f32.c \
  i64_to_f64.c \
  i64_to_extF80.c \
  i64_to_extF80M.c \
  i64_to_f128.c \
  i64_to_f128M.c \
  f16_to_ui32.c \
  f16_to_ui64.c \
  f16_to_i32.c \
  f16_to_i64.c \
  f16_to_ui32_r_minMag.c \
  f16_to_ui64_r_minMag.c \
  f16_to_i32_r_minMag.c \
  f16_to_i64_r_minMag.c \
  f16_to_f32.c \
  f16_to_f64.c \
  f16_to_extF80.c \
  f16_to_extF80M.c \
  f16_to_f128.c \
  f16_to_f128M.c \
  f16_roundToInt.c \
  f16_add.c \
  f16_sub.c \
  f16_mul.c \
  f16_mulAdd.c \
  f16_div.c \
  f16_rem.c \
  f16_sqrt.c \
  f16_eq.c \
  f16_le.c \
  f16_lt.c \
  f16_eq_signaling.c \
  f16_le_quiet.c \
  f16_lt_quiet.c \
  f16_isSignalingNaN.c \
  f32_to_ui32.c \
  f32_to_ui64.c \
  f32_to_i32.c \
  f32_to_i64.c \
  f32_to_ui32_r_minMag.c \
  f32_to_ui64_r_minMag.c \
  f32_to_i32_r_minMag.c \
  f32_to_i64_r_minMag.c \
  f32_to_f16.c \
  f32_to_f64.c \
  f32_to_extF80.c \
  f32_to_extF80M.c \
  f32_to_f128.c \
  f32_to_f128M.c \
  f32_roundToInt.c \
  f32_add.c \
  f32_sub.c \
  f32_mul.c \
  f32_mulAdd.c \
  f32_div.c \
  f32_rem.c \
  f32_sqrt.c \
  f32_eq.c \
  f32_le.c \
  f32_lt.c \
  f32_eq_signaling.c \
  f32_le_quiet.c \
  f32_lt_quiet.c \
  f32_isSignalingNaN.c \
  f64_to_ui32.c \
  f64_to_ui64.c \
  f64_to_i32.c \
  f64_to_i64.c \
  f64_to_ui32_r_minMag.c \
  f64_to_ui64_r_minMag.c \
  f64_to_i32_r_minMag.c \
  f64_to_i64_r_minMag.c \
  f64_to_f16.c \
  f64_to_f32.c \
  f64_to_extF80.c \
  f64_to_extF80M.c \
  f64_to_f128.c \
  f64_to_f128M.c \
  f64_roundToInt.c \
  f64_add.c \
  f64_sub.c \
  f64_mul.c \
  f64_mulAdd.c \
  f64_div.c \
  f64_rem.c \
  f64_sqrt.c \
  f64_eq.c \
  f64_le.c \
  f64_lt.c \
  f64_eq_signaling.c \
  f64_le_quiet.c \
  f64_lt_quiet.c \
  f64_isSignalingNaN.c \
  extF80_to_ui32.c \
  extF80_to_ui64.c \
  extF80_to_i32.c \
  extF80_to_i64.c \
  extF80_to_ui32_r_minMag.c \
  extF80_to_ui64_r_minMag.c \
  extF80_to_i32_r_minMag.c \
  extF80_to_i64_r_minMag.c \
  extF80_to_f16.c \
  extF80_to_f32.c \
  extF80_to_f64.c \
  extF80_to_f128.c \
  extF80_roundToInt.c \
  extF80_add.c \
  extF80_sub.c \
  extF80_mul.c \
  extF80_div.c \
  extF80_rem.c \
  extF80_sqrt.c \
  extF80_eq.c \
  extF80_le.c \
  extF80_lt.c \
  extF80_eq_signaling.c \
  extF80_le_quiet.c \
  extF80_lt_quiet.c \
  extF80_isSignalingNaN.c \
  extF80M_to_ui32.c \
  extF80M_to_ui64.c \
  extF80M_to_i32.c \
  extF80M_to_i64.c \
  extF80M_to_ui32_r_minMag.c \
  extF80M_to_ui64_r_minMag.c \
  extF80M_to_i32_r_minMag.c \
  extF80M_to_i64_r_minMag.c \
  extF80M_to_f16.c \
  extF80M_to_f32.c \
  extF80M_to_f64.c \
  extF80M_to_f128M.c \
  extF80M_roundToInt.c \
  extF80M_add.c \
  extF80M_sub.c \
  extF80M_mul.c \
  extF80M_div.c \
  extF80M_rem.c \
  extF80M_sqrt.c \
  extF80M_eq.c \
  extF80M_le.c \
  extF80M_lt.c \
  extF80M_eq_signaling.c \
  extF80M_le_quiet.c \
  extF80M_lt_quiet.c \
  f128_to_ui32.c \
  f128_to_ui64.c \
  f128_to_i32.c \
  f128_to_i64.c \
  f128_to_ui32_r_minMag.c \
  f128_to_ui64_r_minMag.c \
  f128_to_i32_r_minMag.c \
  f128_to_i64_r_minMag.c \
  f128_to_f16.c \
  f128_to_f32.c \
  f128_to_extF80.c \
  f128_to_f64.c \
  f128_roundToInt.c \
  f128_add.c \
  f128_sub.c \
  f128_mul.c \
  f128_mulAdd.c \
  f128_div.c \
  f128_rem.c \
  f128_sqrt.c \
  f128_eq.c \
  f128_le.c \
  f128_lt.c \
  f128_eq_signaling.c \
  f128_le_quiet.c \
  f128_lt_quiet.c \
  f128_isSignalingNaN.c \
  f128M_to_ui32.c \
  f128M_to_ui64.c \
  f128M_to_i32.c \
  f128M_to_i64.c \
  f128M_to_ui32_r_minMag.c \
  f128M_to_ui64_r_minMag.c \
  f128M_to_i32_r_minMag.c \
  f128M_to_i64_r_minMag.c \
  f128M_to_f16.c \
  f128M_to_f32.c \
  f128M_to_extF80M.c \
  f128M_to_f64.c \
  f128M_roundToInt.c \
  f128M_add.c \
  f128M_sub.c \
  f128M_mul.c \
  f128M_mulAdd.c \
  f128M_div.c \
  f128M_rem.c \
  f128M_sqrt.c \
  f128M_eq.c \
  f128M_le.c \
  f128M_lt.c \
  f128M_eq_signaling.c \
  f128M_le_quiet.c \
  f128M_lt_quiet.c

SOURCES += $$OBJS_PRIMITIVES $$OBJS_SPECIALIZE $$OBJS_OTHERS

win32 {
    target.path = $$PWD
    INSTALLS += target
}
