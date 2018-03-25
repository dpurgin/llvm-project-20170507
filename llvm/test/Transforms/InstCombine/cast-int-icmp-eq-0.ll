; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

; This is https://bugs.llvm.org/show_bug.cgi?id=36682

; In *all* of these, sitofp and bitcast should be instcombine'd out.
; "sle 0" is canonicalized to "slt 1",  so we don't test "sle 0" case.
; "sge 0" is canonicalized to "sgt -1", so we don't test "sge 0" case.
; "sge 1" is canonicalized to "sgt 0",  so we don't test "sge 1" case.
; "sle -1" is canonicalized to "slt 0", so we don't test "sle -1" case.

define i1 @i32_cast_cmp_eq_int_0_sitofp_float(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_eq_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp eq i32 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_ne_int_0_sitofp_float(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_ne_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp ne i32 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_slt_int_0_sitofp_float(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_slt_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp slt i32 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_sgt_int_0_sitofp_float(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_sgt_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp sgt i32 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_slt_int_1_sitofp_float(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_slt_int_1_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp slt i32 %b, 1
  ret i1 %cmp
}

define i1 @i32_cast_cmp_sgt_int_m1_sitofp_float(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_sgt_int_m1_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp sgt i32 %b, -1
  ret i1 %cmp
}

define i1 @i32_cast_cmp_eq_int_0_sitofp_double(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_eq_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp eq i64 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_ne_int_0_sitofp_double(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_ne_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp ne i64 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_slt_int_0_sitofp_double(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_slt_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp slt i64 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_sgt_int_0_sitofp_double(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_sgt_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp sgt i64 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_slt_int_1_sitofp_double(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_slt_int_1_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp slt i64 %b, 1
  ret i1 %cmp
}

define i1 @i32_cast_cmp_sgt_int_m1_sitofp_double(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_sgt_int_m1_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp sgt i64 %b, -1
  ret i1 %cmp
}

define i1 @i32_cast_cmp_eq_int_0_sitofp_half(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_eq_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp eq i16 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_ne_int_0_sitofp_half(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_ne_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp ne i16 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_slt_int_0_sitofp_half(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_slt_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp slt i16 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_sgt_int_0_sitofp_half(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_sgt_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp sgt i16 %b, 0
  ret i1 %cmp
}

define i1 @i32_cast_cmp_slt_int_1_sitofp_half(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_slt_int_1_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp slt i16 %b, 1
  ret i1 %cmp
}

define i1 @i32_cast_cmp_sgt_int_m1_sitofp_half(i32 %i) {
; CHECK-LABEL: @i32_cast_cmp_sgt_int_m1_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i32 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp sgt i16 %b, -1
  ret i1 %cmp
}

define i1 @i64_cast_cmp_eq_int_0_sitofp_float(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_eq_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp eq i32 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_ne_int_0_sitofp_float(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_ne_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp ne i32 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_slt_int_0_sitofp_float(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_slt_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp slt i32 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_sgt_int_0_sitofp_float(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_sgt_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp sgt i32 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_slt_int_1_sitofp_float(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_slt_int_1_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i64 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp slt i32 %b, 1
  ret i1 %cmp
}

define i1 @i64_cast_cmp_sgt_int_m1_sitofp_float(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_sgt_int_m1_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i64 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp sgt i32 %b, -1
  ret i1 %cmp
}

define i1 @i64_cast_cmp_eq_int_0_sitofp_double(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_eq_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp eq i64 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_ne_int_0_sitofp_double(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_ne_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp ne i64 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_slt_int_0_sitofp_double(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_slt_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp slt i64 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_sgt_int_0_sitofp_double(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_sgt_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp sgt i64 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_slt_int_1_sitofp_double(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_slt_int_1_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i64 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp slt i64 %b, 1
  ret i1 %cmp
}

define i1 @i64_cast_cmp_sgt_int_m1_sitofp_double(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_sgt_int_m1_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i64 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp sgt i64 %b, -1
  ret i1 %cmp
}

define i1 @i64_cast_cmp_eq_int_0_sitofp_half(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_eq_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp eq i16 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_ne_int_0_sitofp_half(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_ne_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp ne i16 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_slt_int_0_sitofp_half(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_slt_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp slt i16 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_sgt_int_0_sitofp_half(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_sgt_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i64 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp sgt i16 %b, 0
  ret i1 %cmp
}

define i1 @i64_cast_cmp_slt_int_1_sitofp_half(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_slt_int_1_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i64 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp slt i16 %b, 1
  ret i1 %cmp
}

define i1 @i64_cast_cmp_sgt_int_m1_sitofp_half(i64 %i) {
; CHECK-LABEL: @i64_cast_cmp_sgt_int_m1_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i64 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i64 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp sgt i16 %b, -1
  ret i1 %cmp
}

define i1 @i16_cast_cmp_eq_int_0_sitofp_float(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_eq_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp eq i32 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_ne_int_0_sitofp_float(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_ne_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp ne i32 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_slt_int_0_sitofp_float(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_slt_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp slt i32 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_sgt_int_0_sitofp_float(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_sgt_int_0_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp sgt i32 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_slt_int_1_sitofp_float(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_slt_int_1_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i16 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp slt i32 %b, 1
  ret i1 %cmp
}

define i1 @i16_cast_cmp_sgt_int_m1_sitofp_float(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_sgt_int_m1_sitofp_float(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i16 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to float
  %b = bitcast float %f to i32
  %cmp = icmp sgt i32 %b, -1
  ret i1 %cmp
}

define i1 @i16_cast_cmp_eq_int_0_sitofp_double(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_eq_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp eq i64 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_ne_int_0_sitofp_double(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_ne_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp ne i64 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_slt_int_0_sitofp_double(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_slt_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp slt i64 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_sgt_int_0_sitofp_double(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_sgt_int_0_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp sgt i64 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_slt_int_1_sitofp_double(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_slt_int_1_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i16 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp slt i64 %b, 1
  ret i1 %cmp
}

define i1 @i16_cast_cmp_sgt_int_m1_sitofp_double(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_sgt_int_m1_sitofp_double(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i16 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to double
  %b = bitcast double %f to i64
  %cmp = icmp sgt i64 %b, -1
  ret i1 %cmp
}

define i1 @i16_cast_cmp_eq_int_0_sitofp_half(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_eq_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp eq i16 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_ne_int_0_sitofp_half(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_ne_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp ne i16 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_slt_int_0_sitofp_half(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_slt_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp slt i16 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_sgt_int_0_sitofp_half(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_sgt_int_0_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i16 [[I:%.*]], 0
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp sgt i16 %b, 0
  ret i1 %cmp
}

define i1 @i16_cast_cmp_slt_int_1_sitofp_half(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_slt_int_1_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i16 [[I:%.*]], 1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp slt i16 %b, 1
  ret i1 %cmp
}

define i1 @i16_cast_cmp_sgt_int_m1_sitofp_half(i16 %i) {
; CHECK-LABEL: @i16_cast_cmp_sgt_int_m1_sitofp_half(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i16 [[I:%.*]], -1
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %f = sitofp i16 %i to half
  %b = bitcast half %f to i16
  %cmp = icmp sgt i16 %b, -1
  ret i1 %cmp
}

; Verify that vector types and vector constants including undef elements are transformed too.

define <3 x i1> @i32_cast_cmp_ne_int_0_sitofp_double_vec(<3 x i32> %i) {
; CHECK-LABEL: @i32_cast_cmp_ne_int_0_sitofp_double_vec(
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne <3 x i32> [[I:%.*]], zeroinitializer
; CHECK-NEXT:    ret <3 x i1> [[CMP]]
;
  %f = sitofp <3 x i32> %i to  <3 x double>
  %b = bitcast <3 x double> %f to <3 x i64>
  %cmp = icmp ne <3 x i64> %b, <i64 0, i64 0, i64 0>
  ret <3 x i1> %cmp
}

; FIXME: Vector zero constant with undef is not matched.

define <3 x i1> @i32_cast_cmp_eq_int_0_sitofp_float_vec_undef(<3 x i32> %i) {
; CHECK-LABEL: @i32_cast_cmp_eq_int_0_sitofp_float_vec_undef(
; CHECK-NEXT:    [[F:%.*]] = sitofp <3 x i32> [[I:%.*]] to <3 x float>
; CHECK-NEXT:    [[B:%.*]] = bitcast <3 x float> [[F]] to <3 x i32>
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq <3 x i32> [[B]], <i32 0, i32 undef, i32 0>
; CHECK-NEXT:    ret <3 x i1> [[CMP]]
;
  %f = sitofp <3 x i32> %i to  <3 x float>
  %b = bitcast <3 x float> %f to <3 x i32>
  %cmp = icmp eq <3 x i32> %b, <i32 0, i32 undef, i32 0>
  ret <3 x i1> %cmp
}

define <3 x i1> @i64_cast_cmp_slt_int_1_sitofp_half_vec_undef(<3 x i64> %i) {
; CHECK-LABEL: @i64_cast_cmp_slt_int_1_sitofp_half_vec_undef(
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt <3 x i64> [[I:%.*]], <i64 1, i64 1, i64 1>
; CHECK-NEXT:    ret <3 x i1> [[CMP]]
;
  %f = sitofp <3 x i64> %i to  <3 x half>
  %b = bitcast <3 x half> %f to <3 x i16>
  %cmp = icmp slt <3 x i16> %b, <i16 1, i16 undef, i16 1>
  ret <3 x i1> %cmp
}

define <3 x i1> @i16_cast_cmp_sgt_int_m1_sitofp_float_vec_undef(<3 x i16> %i) {
; CHECK-LABEL: @i16_cast_cmp_sgt_int_m1_sitofp_float_vec_undef(
; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt <3 x i16> [[I:%.*]], <i16 -1, i16 -1, i16 -1>
; CHECK-NEXT:    ret <3 x i1> [[CMP]]
;
  %f = sitofp <3 x i16> %i to  <3 x float>
  %b = bitcast <3 x float> %f to <3 x i32>
  %cmp = icmp sgt <3 x i32> %b, <i32 -1, i32 undef, i32 -1>
  ret <3 x i1> %cmp
}

