// RUN: %dragonegg -fstrict-enums -S -o - %s | FileCheck %s

enum A { alpha, beta } a;

int foo() {
  return a;
// CHECK: load i32* @a,{{.*}} !range !0
// CHECK: !0 = metadata !{i32 0, i32 2}
}
