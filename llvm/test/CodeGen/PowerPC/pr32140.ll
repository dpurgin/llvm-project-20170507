; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=powerpc64le-linux-gnu -mcpu=pwr8 < %s | FileCheck %s
; RUN: llc -mtriple=powerpc64-linux-gnu -mcpu=pwr8 < %s | FileCheck %s

@as = common local_unnamed_addr global i16 0, align 2
@bs = common local_unnamed_addr global i16 0, align 2
@ai = common local_unnamed_addr global i32 0, align 4
@bi = common local_unnamed_addr global i32 0, align 4

define void @bswapStorei64Toi32() {
; CHECK-LABEL: bswapStorei64Toi32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addis 3, 2, ai@toc@ha
; CHECK-NEXT:    addis 4, 2, bi@toc@ha
; CHECK-NEXT:    lwa 3, ai@toc@l(3)
; CHECK-NEXT:    addi 4, 4, bi@toc@l
; CHECK-NEXT:    rldicl 3, 3, 32, 32
; CHECK-NEXT:    stwbrx 3, 0, 4
; CHECK-NEXT:    blr
entry:
  %0 = load i32, i32* @ai, align 4
  %conv.i = sext i32 %0 to i64
  %or26.i = tail call i64 @llvm.bswap.i64(i64 %conv.i)
  %conv = trunc i64 %or26.i to i32
  store i32 %conv, i32* @bi, align 4
  ret void
}

define void @bswapStorei32Toi16() {
; CHECK-LABEL: bswapStorei32Toi16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addis 3, 2, as@toc@ha
; CHECK-NEXT:    addis 4, 2, bs@toc@ha
; CHECK-NEXT:    lha 3, as@toc@l(3)
; CHECK-NEXT:    addi 4, 4, bs@toc@l
; CHECK-NEXT:    srwi 3, 3, 16
; CHECK-NEXT:    sthbrx 3, 0, 4
; CHECK-NEXT:    blr
entry:
  %0 = load i16, i16* @as, align 2
  %conv.i = sext i16 %0 to i32
  %or26.i = tail call i32 @llvm.bswap.i32(i32 %conv.i)
  %conv = trunc i32 %or26.i to i16
  store i16 %conv, i16* @bs, align 2
  ret void
}

define void @bswapStorei64Toi16() {
; CHECK-LABEL: bswapStorei64Toi16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    addis 3, 2, as@toc@ha
; CHECK-NEXT:    addis 4, 2, bs@toc@ha
; CHECK-NEXT:    lha 3, as@toc@l(3)
; CHECK-NEXT:    addi 4, 4, bs@toc@l
; CHECK-NEXT:    rldicl 3, 3, 16, 48
; CHECK-NEXT:    sthbrx 3, 0, 4
; CHECK-NEXT:    blr
entry:
  %0 = load i16, i16* @as, align 2
  %conv.i = sext i16 %0 to i64
  %or26.i = tail call i64 @llvm.bswap.i64(i64 %conv.i)
  %conv = trunc i64 %or26.i to i16
  store i16 %conv, i16* @bs, align 2
  ret void
}

declare i32 @llvm.bswap.i32(i32)
declare i64 @llvm.bswap.i64(i64)
