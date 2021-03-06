; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+amx-tile -verify-machineinstrs | FileCheck %s

define void @test_amx(i8* %pointer, i8* %base, i64 %stride) {
; CHECK-LABEL: test_amx:
; CHECK:       # %bb.0:
  call void @llvm.x86.ldtilecfg(i8* %pointer)
; CHECK-NEXT:    ldtilecfg (%rdi)

  call void @llvm.x86.sttilecfg(i8* %pointer)
; CHECK-NEXT:    sttilecfg (%rdi)

  call void @llvm.x86.tilerelease()
; CHECK-NEXT:    tilerelease

  call void @llvm.x86.tilezero(i8 3)
; CHECK-NEXT:    tilezero %tmm3

  call void @llvm.x86.tileloadd64(i8 3, i8* %base, i64 %stride)
; CHECK-NEXT:    tileloadd (%rsi,%rdx), %tmm3

  call void @llvm.x86.tileloaddt164(i8 3, i8* %base, i64 %stride)
; CHECK-NEXT:    tileloaddt1 (%rsi,%rdx), %tmm3

  call void @llvm.x86.tilestored64(i8 3, i8* %base, i64 %stride)
; CHECK-NEXT:    tilestored %tmm3, (%rsi,%rdx)
  ret void
}

declare void @llvm.x86.tileloadd64(i8 %tile, i8* %base, i64 %stride)
declare void @llvm.x86.tileloaddt164(i8 %tile, i8* %base, i64 %stride)
declare void @llvm.x86.tilestored64(i8 %tile, i8* %base, i64 %stride)
declare void @llvm.x86.ldtilecfg(i8* %pointer)
declare void @llvm.x86.sttilecfg(i8* %pointer)
declare void @llvm.x86.tilerelease()
declare void @llvm.x86.tilezero(i8 %tile)
