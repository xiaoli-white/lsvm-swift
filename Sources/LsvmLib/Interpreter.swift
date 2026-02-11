public final class Interpreter {
  private var currentFrame: Object.FrameObject? = nil
  public func run(code: Object.CodeObject) {
    let frame = Object.FrameObject(code: code)
    evalFrame(frame)
  }
  public func evalFrame(_ frame: Object.FrameObject) {
    currentFrame = frame
    var arg: UInt32 = 0
    while true {
      let op = ByteCode(rawValue: currentFrame!.code.code[currentFrame!.pc])!
      currentFrame!.pc += 1
      switch op {
      case .NOP:
        break
      case .EXTENDED_ARG:
        arg = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
        break
      case .LOAD_CONSTANT:
        arg = (arg << 8) | UInt32(currentFrame!.code.code[currentFrame!.pc])
        currentFrame!.pc += 1
        push(currentFrame!.code.constants[Int(arg)]!)
        break
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
        break
      default:
        break
      }
    }
  }
  public func push(_ x: Object.BaseObject) {
    currentFrame?.stack.pointee = x
    currentFrame?.stack = currentFrame?.stack.advanced(by: 1)
  }
  public func pop() -> Object.BaseObject {
    currentFrame?.stack = currentFrame?.stack.advanced(by: -1)
    return currentFrame?.stack.pointee ?? Object.NullObject.instance
  }
}
