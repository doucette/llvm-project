// RUN: not llvm-mc -triple=aarch64 -show-encoding -mattr=+sve  2>&1 < %s| FileCheck %s


// ------------------------------------------------------------------------- //
// Invalid predicate

fmad z0.h, p8/m, z1.h, z2.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid restricted predicate register, expected p0..p7 (without element suffix)
// CHECK-NEXT: fmad z0.h, p8/m, z1.h, z2.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:


// ------------------------------------------------------------------------- //
// Invalid element width

fmad z0.s, p7/m, z1.h, z2.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid element width
// CHECK-NEXT: fmad z0.s, p7/m, z1.h, z2.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

fmad z0.b, p7/m, z1.b, z2.b
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid element width
// CHECK-NEXT: fmad z0.b, p7/m, z1.b, z2.b
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:


// ------------------------------------------------------------------------- //
// Element index is not allowed

fmad z0.h, p7/m, z1.h, z2.h[0]
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid operand
// CHECK-NEXT: fmad z0.h, p7/m, z1.h, z2.h[0]
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:
