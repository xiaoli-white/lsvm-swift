extension Object {
    public typealias VMBoolean = Unmanaged<BooleanObject>
    public final class BooleanObject: BaseObject, @unchecked Sendable {
        public static let TRUE = Unmanaged.passRetained(BooleanObject(value: true))
        public static let FALSE = Unmanaged.passRetained(BooleanObject(value: false))
        public let value: Bool
        private init(value: Bool) {
            self.value = value
            super.init()
            self.klass = BooleanKlass.instance
        }
    }
    public final class BooleanKlass: Klass, @unchecked Sendable {
        public static let instance = BooleanKlass()
        private override init() {

        }
    }
}
