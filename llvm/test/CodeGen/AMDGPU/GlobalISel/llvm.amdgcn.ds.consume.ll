; XUN: llc -global-isel -march=amdgcn -mcpu=tahiti -verify-machineinstrs < %S/../llvm.amdgcn.ds.append.ll | FileCheck -check-prefixes=GCN,SI,NOTGFX9 %S/../llvm.amdgcn.ds.append.ll
; RUN: llc -global-isel -march=amdgcn -mcpu=bonaire -mattr=+flat-for-global -verify-machineinstrs < %S/../llvm.amdgcn.ds.append.ll | FileCheck -check-prefixes=GCN,CIPLUS,NOTGFX9 %S/../llvm.amdgcn.ds.append.ll
; RUN: llc -global-isel -march=amdgcn -mcpu=tonga -mattr=+flat-for-global -verify-machineinstrs < %S/../llvm.amdgcn.ds.append.ll | FileCheck -check-prefixes=GCN,CIPLUS,NOTGFX9 %S/../llvm.amdgcn.ds.append.ll
; RUN: llc -global-isel -march=amdgcn -mcpu=gfx900 -verify-machineinstrs < %S/../llvm.amdgcn.ds.append.ll | FileCheck -check-prefixes=GCN,CIPLUS,GFX9 %S/../llvm.amdgcn.ds.append.ll
