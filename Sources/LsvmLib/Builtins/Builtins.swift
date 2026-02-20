public enum Builtins {
    public static func getBuiltins() -> Object.VMDict {
        let result = Object.newDict()
        var name = Object.newString("print")
        let printFunc = Object.newNativeFunction(name: name, function: Builtins.print)
        result.takeUnretainedValue()[name.to()] = printFunc.to()
        printFunc.release()
        return result
    }
}