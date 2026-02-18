extension Object {
    public typealias VMNativeFunction = Unmanaged<NativeFunctionObject>
    public static func newNativeFunction(
        name: VMString, function: @Sendable @escaping (VMList) -> VMObject
    ) -> VMNativeFunction {
        Unmanaged.passRetained(NativeFunctionObject(name: name, function: function))
    }
    public final class NativeFunctionObject: BaseObject {
        public let name: VMString
        public let function: @Sendable (VMList) -> VMObject
        fileprivate init(name: VMString, function: @Sendable @escaping (VMList) -> VMObject) {
            self.name = name
            self.function = function
        }
    }
}
