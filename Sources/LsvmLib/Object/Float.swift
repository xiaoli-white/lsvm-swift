extension Object {
    public typealias VMFloat = Unmanaged<FloatObject>
    public static func newFloat(value: Double) -> VMFloat {
        Unmanaged.passRetained(FloatObject(value: value))
    }
    public final class FloatObject: BaseObject {
        public let value: Double
        fileprivate init(value: Double) {
            self.value = value
            super.init()
            self.klass = FloatKlass.instance
        }
    }
    public final class FloatKlass: Klass, @unchecked Sendable {
        public static let instance = FloatKlass()
        private override init() {

        }
    }
}
