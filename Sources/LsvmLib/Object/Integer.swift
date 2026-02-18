extension Object {
    public typealias VMInteger = Unmanaged<IntegerObject>
    public static func newInteger(value: Int64) -> VMInteger {
        Unmanaged.passRetained(IntegerObject(value: value))
    }
    public final class IntegerObject: BaseObject {
        public let value: Int64
        fileprivate init(value: Int64) {
            self.value = value
            super.init()
            self.klass = IntegerKlass.instance
        }
        public override var description: String {
            return "\(value)"
        }
    }
    public final class IntegerKlass: Klass, @unchecked Sendable {
        public static let instance = IntegerKlass()
        private override init() {
        }
        public override func add(_ lhs: VMObject, _ rhs: VMObject) -> VMObject {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return newInteger(value: x.value + y.value).to()
        }
        public override func sub(_ lhs: VMObject, _ rhs: VMObject) -> VMObject {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return newInteger(value: x.value - y.value).to()
        }
        public override func mul(_ lhs: VMObject, _ rhs: VMObject) -> VMObject {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return newInteger(value: x.value * y.value).to()
        }
        public override func div(_ lhs: VMObject, _ rhs: VMObject) -> VMObject {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return newInteger(value: x.value / y.value).to()
        }
        public override func mod(_ lhs: VMObject, _ rhs: VMObject) -> VMObject {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return newInteger(value: x.value % y.value).to()
        }
        public override func equal(_ lhs: Object.VMObject, _ rhs: Object.VMObject)
            -> Object.VMObject
        {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return (x.value == y.value ? BooleanObject.TRUE : BooleanObject.FALSE).to()
        }
        public override func notEqual(_ lhs: Object.VMObject, _ rhs: Object.VMObject)
            -> Object.VMObject
        {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return (x.value != y.value ? BooleanObject.TRUE : BooleanObject.FALSE).to()
        }
        public override func less(_ lhs: Object.VMObject, _ rhs: Object.VMObject)
            -> Object.VMObject
        {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return (x.value < y.value ? BooleanObject.TRUE : BooleanObject.FALSE).to()
        }
        public override func lessEqual(_ lhs: Object.VMObject, _ rhs: Object.VMObject)
            -> Object.VMObject
        {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return (x.value <= y.value ? BooleanObject.TRUE : BooleanObject.FALSE).to()
        }
        public override func greater(_ lhs: Object.VMObject, _ rhs: Object.VMObject)
            -> Object.VMObject
        {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return (x.value > y.value ? BooleanObject.TRUE : BooleanObject.FALSE).to()
        }
        public override func greaterEqual(_ lhs: Object.VMObject, _ rhs: Object.VMObject)
            -> Object.VMObject
        {
            let x = lhs.takeUnretainedValue() as! IntegerObject
            let y = rhs.takeUnretainedValue() as! IntegerObject
            return (x.value >= y.value ? BooleanObject.TRUE : BooleanObject.FALSE).to()
        }
    }
}
