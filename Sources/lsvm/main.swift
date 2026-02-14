import LsvmLib

import enum LsvmLib.ByteCode

var interpreter: LsvmLib.Interpreter = LsvmLib.Interpreter()
var code: [UInt8] = [
  ByteCode.PUSH_SMALL_INT.rawValue, 0x01,
  ByteCode.DUP_TOP.rawValue,
  ByteCode.BINARY_OP.rawValue, ByteCode.BinaryOp.ADD.rawValue,
  ByteCode.CALL.rawValue,
  ByteCode.RETURN_NULL.rawValue
]
var co = LsvmLib.Object.CodeObject(
  name: LsvmLib.Object.StringObject("111"), fileName: LsvmLib.Object.StringObject("111"),
  argCount: 0, localCount: 0, stackSize: 2, code: code)

interpreter.run(code: co)