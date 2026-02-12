public enum Builtins {
  public static func getBuiltins() -> Object.DictObject {
    let result = Object.DictObject();
    var name = Object.StringObject("print")  
    result[name] = Object.NativeFunctionObject(name: name, function: Builtins.print)
    return result
  }
}