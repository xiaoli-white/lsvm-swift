extension Object {
    public typealias VMString = Unmanaged<StringObject>
    public static func newString(_ value: String) -> VMString {
        Unmanaged.passRetained(StringObject(value))
    }
    public final class StringObject: BaseObject {
        public let value: String
        fileprivate init(_ value: String) {
            self.value = value
        }
    }
}
