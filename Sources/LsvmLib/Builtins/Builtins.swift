public enum Builtins {
    public static func getBuiltins() -> Object.VMDict {
        let result = Object.newDict()
        var name = Object.newString("print")
        result.takeUnretainedValue()[name.to()] = Object.newNativeFunction(
            name: name, function: Builtins.print
        ).to()
        return result
    }
}