public final class Interpreter {
  private var currentFrame: Object.FrameObject? = nil
  public init() {

  }
  public func run(code: Object.CodeObject) {
    let frame = Object.FrameObject(code: code)
    evalFrame(frame)
  }
  public func evalFrame(_ frame: Object.FrameObject) {
    currentFrame = frame
    var arg: UInt32 = 0
    loop: while true {
      let op = ByteCode(rawValue: currentFrame!.code.code[currentFrame!.pc])!
      currentFrame!.pc += 1
      switch op {
      case .NOP:
        break
      case .EXTENDED_ARG:
        arg = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
      case .LOAD_CONSTANT:
        arg = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
        push(currentFrame!.code.constants[Object.IntegerObject(value: Int64(arg))]!)
      case .PUSH_SMALL_INT:
        arg = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
        push(Object.IntegerObject(value: Int64(arg)))
      case .MAKE_FUNCTION:
        let codeObject = pop() as! Object.CodeObject
        let builtins = Builtins.getBuiltins()
        let builtinsDict = Object.DictObject()
        for (key, value) in builtins {
          let s = Object.StringObject(key)
          builtinsDict[s] = Object.NativeFunctionObject(name: s, function: value)
        }
        let function = Object.FunctionObject(
          code: codeObject, globals: currentFrame!.globals, builtins: builtinsDict)
        push(function)
      case .BINARY_OP:
        let op = ByteCode.BinaryOp(rawValue: currentFrame!.code.code[currentFrame!.pc])!
        currentFrame!.pc += 1
        let right = pop()
        let left = top()
        switch op {
        case .ADD:
          setTop(left.add(right))
        case .SUB:
          setTop(left.sub(right))
        case .MUL:
          setTop(left.mul(right))
        case .DIV:
          setTop(left.div(right))
        case .MOD:
          setTop(left.mod(right))
        case .POW:
          setTop(left.pow(right))
        default:
          break
        }
      case .COMPARE_OP:
        let op = ByteCode.CompareOp(rawValue: currentFrame!.code.code[currentFrame!.pc])!
        currentFrame!.pc += 1
        let right = pop()
        let left = top()
        switch op {
        case .EQUAL:
          setTop(left.equal(right))
        case .NOT_EQUAL:
          setTop(left.notEqual(right))
        case .LESS:
          setTop(left.less(right))
        case .LESS_EQUAL:
          setTop(left.lessEqual(right))
        case .GREATER:
          setTop(left.greater(right))
        case .GREATER_EQUAL:
          setTop(left.greaterEqual(right))
        }
      case .POP_TOP:
        let _ = pop()
      case .DUP_TOP:
        push(top())
      case .CALL:
        print(pop())
      case .RETURN_VALUE:
        let value = pop()
        if currentFrame!.parent == nil {
          break loop
        }
        currentFrame = currentFrame!.parent
        push(value)
      case .RETURN_CONSTANT:
        arg = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
        if currentFrame!.parent == nil {
          break loop
        }
        let constant = currentFrame!.code.constants[Object.IntegerObject(value: Int64(arg))]!
        currentFrame = currentFrame!.parent
        push(constant)
      case .RETURN_NULL:
        if currentFrame!.parent == nil {
          break loop
        }
        currentFrame = currentFrame!.parent
        push(Object.NullObject.instance)
      case .JUMP_IF_TRUE:
        let target = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
        let t = pop() as! Object.BooleanObject
        if t.value {
          currentFrame!.pc = Int(target)
        }
      case .JUMP_IF_FALSE:
        let target = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
        let t = pop() as! Object.BooleanObject
        if !t.value {
          currentFrame!.pc = Int(target)
        }
      default:
        break
      }
      if op != .EXTENDED_ARG {
        arg = 0
      }
    }
    currentFrame = nil
  }
  public func stackSize() -> UInt64 {
    return currentFrame!.code.stackSize
  }
  public func stackDepth() -> UInt64 {
    let stackAddr = UInt64(bitPattern: Int64(UInt(bitPattern: currentFrame!.stack)))
    let baseAddr = UInt64(bitPattern: Int64(UInt(bitPattern: currentFrame!.stackBase)))
    return UInt64(
      (stackAddr - baseAddr) / UInt64(MemoryLayout<UnsafeMutablePointer<Object.BaseObject>>.size))
  }
  public func isStackEmpty() -> Bool {
    return currentFrame!.stack == currentFrame!.stackBase
  }
  public func top() -> Object.BaseObject {
    return currentFrame!.stack[-1]
  }
  public func second() -> Object.BaseObject {
    currentFrame!.stack[-2]
  }
  public func setTop(_ x: Object.BaseObject) {
    currentFrame!.stack[-1] = x
  }
  public func setSecond(_ x: Object.BaseObject) {
    currentFrame!.stack[-2] = x
  }
  public func push(_ x: Object.BaseObject) {
    currentFrame!.stack.pointee = x
    currentFrame!.stack = currentFrame!.stack.advanced(by: 1)
  }
  public func pop() -> Object.BaseObject {
    currentFrame!.stack = currentFrame!.stack.advanced(by: -1)
    return currentFrame!.stack.pointee
  }
}
