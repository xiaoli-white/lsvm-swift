import SwiftUtils

public final class Interpreter: @unchecked Sendable {
    public static let instance = Interpreter()
    private var currentFrame: Object.VMFrame? = nil
    private var currentFrameValue: Object.FrameObject? = nil
    private var currentCode: Object.CodeObject? = nil
    private init() {

    }
    public func run(code: Object.VMCode) {
        let frame = Object.newFrame(code: code, builtins: Builtins.getBuiltins())
        evalFrame(frame)
    }
    public func evalFrame(_ frame: Object.VMFrame) {
        currentFrame = frame
        currentFrameValue = frame.takeUnretainedValue()
        currentCode = currentFrameValue!.code.takeUnretainedValue()
        var arg: UInt32 = 0
        loop: while true {
            let op = ByteCode(rawValue: currentCode!.code[currentFrameValue!.pc])!
            currentFrameValue!.pc += 1
            switch op {
            case .NOP:
                break
            case .EXTENDED_ARG:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
            case .LOAD_CONSTANT:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                push(
                    currentCode!.constants.takeUnretainedValue()[
                        Object.newInteger(value: Int64(arg))]!)
            case .PUSH_SMALL_INT:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                push(Object.newInteger(value: Int64(arg)).to())
            case .MAKE_FUNCTION:
                let codeObject: Object.VMCode = pop().to()
                let function = Object.newFunction(
                    code: codeObject, globals: currentFrameValue!.globals,
                    builtins: Builtins.getBuiltins())
                push(function.to())
            case .SET_OBJECT_ATTRIBUTE:
                let kind = ByteCode.ObjectAttributeKind(
                    rawValue: currentCode!.code[currentFrameValue!.pc])!
                currentFrameValue!.pc += 1
                switch kind {
                case .MAGIC_METHOD:
                    let key = pop()
                    let value = pop()
                    let o = pop()
                    let name = key.takeUnretainedValue() as! Object.StringObject
                    let v = value.takeUnretainedValue() as! Object.StringObject
                    o.takeUnretainedValue().operatorFuncNames[name.value] = v.value
                }
            case .BINARY_OP:
                let op = ByteCode.BinaryOp(
                    rawValue: currentCode!.code[currentFrameValue!.pc])!
                currentFrameValue!.pc += 1
                let right = pop()
                let left = top()
                let l = left.takeUnretainedValue()
                switch op {
                case .ADD:
                    setTop(l.add(right))
                case .SUB:
                    setTop(l.sub(right))
                case .MUL:
                    setTop(l.mul(right))
                case .DIV:
                    setTop(l.div(right))
                case .MOD:
                    setTop(l.mod(right))
                case .POW:
                    setTop(l.pow(right))
                case .AND:
                    setTop(l.and(right))
                case .OR:
                    setTop(l.or(right))
                case .XOR:
                    setTop(l.xor(right))
                }
            case .COMPARE_OP:
                let op = ByteCode.CompareOp(
                    rawValue: currentCode!.code[currentFrameValue!.pc])!
                currentFrameValue!.pc += 1
                let right = pop()
                let left = top()
                let l = left.takeUnretainedValue()
                switch op {
                case .EQUAL:
                    setTop(l.equal(right))
                case .NOT_EQUAL:
                    setTop(l.notEqual(right))
                case .LESS:
                    setTop(l.less(right))
                case .LESS_EQUAL:
                    setTop(l.lessEqual(right))
                case .GREATER:
                    setTop(l.greater(right))
                case .GREATER_EQUAL:
                    setTop(l.greaterEqual(right))
                }
            case .POP_TOP:
                let _ = pop()
            case .DUP_TOP:
                push(top())
            case .CALL:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let args = Object.newList()
                let l = args.takeUnretainedValue()
                for _ in 0..<Int(arg) {
                    l.append(pop())
                }
                let f = pop()
                push(callFunction(f, args))
            case .RETURN_VALUE:
                let value = pop()
                if currentFrameValue!.parent == nil {
                    break loop
                }
                currentFrame = currentFrameValue!.parent
                push(value)
            case .RETURN_CONSTANT:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                if currentFrameValue!.parent == nil {
                    break loop
                }
                let constant = currentCode!.constants.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg))]!
                currentFrame = currentFrameValue!.parent
                push(constant)
            case .RETURN_NULL:
                if currentFrameValue!.parent == nil {
                    break loop
                }
                currentFrame = currentFrameValue!.parent
                push(Object.NullObject.instance.to())
            case .JUMP_IF_TRUE:
                let target =
                    (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let t = pop()
                if (t.takeUnretainedValue() as! Object.BooleanObject).value {
                    currentFrameValue!.pc = Int(target)
                }
            case .JUMP_IF_FALSE:
                let target =
                    (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let t = pop()
                if !(t.takeUnretainedValue() as! Object.BooleanObject).value {
                    currentFrameValue!.pc = Int(target)
                }
            case .JUMP_ABSOLUTE:
                let target =
                    (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc = Int(target)
            case .JUMP_FORWARD:
                let offset =
                    (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += Int(offset) + 1
            case .JUMP_BACKWARD:
                let offset =
                    (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                currentFrameValue!.pc -= Int(offset)
            case .LOAD_NAME:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let name =
                    currentCode!.names.takeUnretainedValue()[Object.newInteger(value: Int64(arg))]!
                var value = currentFrameValue!.locals.takeUnretainedValue()[name]
                if value == nil {
                    value = currentFrameValue!.globals.takeUnretainedValue()[name]
                }
                if value == nil {
                    value = currentFrameValue!.builtins.takeUnretainedValue()[name]
                }
                push(value!)
            case .STORE_NAME:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let name = currentCode!.names.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg))]!
                let value = pop()
                let locals = currentFrameValue!.locals.takeUnretainedValue()
                if locals.contains(key: name) {
                    locals[name] = value
                } else {
                    currentFrameValue!.globals.takeUnretainedValue()[name] = value
                }
            case .LOAD_LOCAL:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let name = currentCode!.varnames.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg))]!
                push(currentFrameValue!.locals.takeUnretainedValue()[name]!)
            case .STORE_LOCAL:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let name = currentCode!.varnames.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg))]!
                let value = pop()
                currentFrameValue!.locals.takeUnretainedValue()[name] = value
            case .LOAD_GLOBAL:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let name = currentCode!.names.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg)).to()]!
                push(currentFrameValue!.globals.takeUnretainedValue()[name]!)
            case .STORE_GLOBAL:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let name = currentCode!.names.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg))]!
                let value = pop()
                currentFrameValue!.globals.takeUnretainedValue()[name] = value
            case .LOAD_ATTR:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let obj = pop()
                let name = currentCode!.names.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg))]!
                push(obj.takeUnretainedValue().getattr(name))
            case .STORE_ATTR:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let obj = pop()
                let value = pop()
                let name = currentCode!.names.takeUnretainedValue()[
                    Object.newInteger(value: Int64(arg))]!
                let _ = obj.takeUnretainedValue().setattr(name, value)
            case .BUILD_LIST:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let list = Object.newList()
                let l = list.takeUnretainedValue()
                for _ in 0..<Int(arg) {
                    l.append(pop())
                }
                push(list.to())
            case .BUILD_DICT:
                arg = (arg << 8) | UInt32(currentCode!.code[currentFrameValue!.pc])
                currentFrameValue!.pc += 1
                let dict = Object.newDict()
                let d = dict.takeUnretainedValue()
                for _ in 0..<Int(arg) {
                    let key = pop()
                    let value = pop()
                    d[key] = value
                }
                push(dict.to())
            default:
                break
            }
            if op != .EXTENDED_ARG {
                arg = 0
            }
        }
        currentFrame = nil
    }
    public func callFunction(_ f: Object.VMObject, _ args: Object.VMList) -> Object.VMObject {
        if let funcObject = f.takeUnretainedValue() as? Object.FunctionObject {
            let frame = Object.newFrame(
                code: funcObject.code, builtins: currentFrameValue!.builtins,
                parent: currentFrame)
            currentFrame = frame
            return Object.NullObject.instance.to()
        } else if let nativeFuncObject = f.takeUnretainedValue() as? Object.NativeFunctionObject {
            return nativeFuncObject.function(args)
        } else {
            fatalError("")
        }
    }
    public func stackSize() -> UInt64 {
        return currentCode!.stackSize
    }
    public func stackDepth() -> UInt64 {
        let stackAddr = UInt64(bitPattern: Int64(UInt(bitPattern: currentFrameValue!.stack)))
        let baseAddr = UInt64(bitPattern: Int64(UInt(bitPattern: currentFrameValue!.stackBase)))
        return UInt64(
            (stackAddr - baseAddr)
                / UInt64(MemoryLayout<UnsafeMutablePointer<Object.VMObject>>.size))
    }
    public func isStackEmpty() -> Bool {
        return currentFrameValue!.stack == currentFrameValue!.stackBase
    }
    public func top() -> Object.VMObject {
        return currentFrameValue!.stack[-1]
    }
    public func second() -> Object.VMObject {
        currentFrameValue!.stack[-2]
    }
    public func setTop(_ x: Object.VMObject) {
        currentFrameValue!.stack[-1] = x
    }
    public func setSecond(_ x: Object.VMObject) {
        currentFrameValue!.stack[-2] = x
    }
    public func push(_ x: Object.VMObject) {
        currentFrameValue!.stack.pointee = x
        currentFrameValue!.stack = currentFrameValue!.stack.advanced(by: 1)
    }
    public func pop() -> Object.VMObject {
        return currentFrameValue!.stack.pointee
    }
}
