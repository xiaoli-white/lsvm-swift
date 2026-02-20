import LsvmLib

import enum LsvmLib.ByteCode

var code: [UInt8]? = [
    ByteCode.PUSH_SMALL_INT.rawValue, 0x01,
    ByteCode.DUP_TOP.rawValue,
    ByteCode.BINARY_OP.rawValue, ByteCode.BinaryOp.ADD.rawValue,
    ByteCode.POP_TOP.rawValue,
    ByteCode.RETURN_NULL.rawValue,
]
var co = LsvmLib.Object.newCode(
    name: LsvmLib.Object.newString("111"), fileName: LsvmLib.Object.newString("111"),
    argCount: 0, localCount: 0, stackSize: 2, code: code!)

LsvmLib.Interpreter.instance.run(code: co).release()
