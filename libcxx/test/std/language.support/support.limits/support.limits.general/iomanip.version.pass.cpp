
//===----------------------------------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is dual licensed under the MIT and the University of Illinois Open
// Source Licenses. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// <iomanip> feature macros

/*  Constant                                    Value
    __cpp_lib_quoted_string_io                  201304L

*/

#include <iomanip>
#include <cassert>
#include "test_macros.h"

int main()
{
//  ensure that the macros that are supposed to be defined in <iomanip> are defined.

/*
#if !defined(__cpp_lib_fooby)
# error "__cpp_lib_fooby is not defined"
#elif __cpp_lib_fooby < 201606L
# error "__cpp_lib_fooby has an invalid value"
#endif
*/
}
