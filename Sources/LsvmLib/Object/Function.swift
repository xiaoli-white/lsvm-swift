extension Object {
    public typealias VMFunction = Unmanaged<FunctionObject>
    public static func newFunction(
        code: VMCode, globals: VMDict, builtins: VMDict, qualname: VMString? = nil
    ) -> VMFunction {
        Unmanaged.passRetained(
            FunctionObject(code: code, globals: globals, builtins: builtins, qualname: qualname))
    }
    public final class FunctionObject: BaseObject {
        public let code: VMCode
        public let globals: VMDict
        public let builtins: VMDict
        public let name: VMString
        public let qualname: VMString
        fileprivate init(code: VMCode, globals: VMDict, builtins: VMDict, qualname: VMString?) {
            self.code = code
            self.globals = globals
            self.builtins = builtins
            self.name = code.takeUnretainedValue().name
            if let qualname = qualname {
                self.qualname = qualname
            } else {
                self.qualname = code.takeUnretainedValue().qualname
            }
            super.init()
            self.dict = newDict()
        }
    }
}
