import LsvmLib

import enum LsvmLib.ByteCode

@main
struct lsvm {
    static func main() {
        let code: [UInt8] = [
            ByteCode.PUSH_SMALL_INT.rawValue, 0x01,
            ByteCode.DUP_TOP.rawValue,
            ByteCode.BINARY_OP.rawValue, ByteCode.BinaryOp.ADD.rawValue,
            ByteCode.LOAD_CONSTANT.rawValue, 0x00,
            ByteCode.MAKE_FUNCTION.rawValue,
            ByteCode.SWAP.rawValue,
            ByteCode.CALL.rawValue, 0x01,
            ByteCode.POP_TOP.rawValue,
            ByteCode.RETURN_NULL.rawValue,
        ]
        let f: [UInt8] = [
            ByteCode.LOAD_LOCAL.rawValue, 0x00,
            ByteCode.RETURN_VALUE.rawValue,
        ]
        let co = LsvmLib.Object.newCode(
            name: LsvmLib.Object.newString("111"), fileName: LsvmLib.Object.newString("111"),
            argCount: 0, localCount: 0, stackSize: 2, code: code)
        let fCodeObject = LsvmLib.Object.newCode(
            name: LsvmLib.Object.newString("f"), fileName: LsvmLib.Object.newString("111"),
            argCount: 0, localCount: 1, stackSize: 1, code: f)
        co.takeUnretainedValue().constants.takeUnretainedValue().append(fCodeObject.to())
        fCodeObject.release()
        let x = LsvmLib.Object.newString("x")
        fCodeObject.takeUnretainedValue().varnames.takeUnretainedValue().append(x.to())
        x.release()
        LsvmLib.Interpreter.instance.run(code: co).release()
    }
}
