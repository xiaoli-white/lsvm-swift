public extension Object {
  final class IntegerObject: BaseObject {
    public let value: Int64
    public init(value: Int64) {
      self.value = value
      super.init()
      self.klass = IntegerKlass.instance
    }
    public override var description: String {
      return "\(value)"
    }
  }
  final class IntegerKlass: Klass, @unchecked Sendable {
    public static let instance = IntegerKlass()
    private override init() {
    }
    public override func add(_ lhs: BaseObject, _ rhs: BaseObject) -> BaseObject {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return IntegerObject(value: x.value + y.value)
    }
    public override func sub(_ lhs: BaseObject, _ rhs: BaseObject) -> BaseObject {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return IntegerObject(value: x.value - y.value)
    }
    public override func mul(_ lhs: BaseObject, _ rhs: BaseObject) -> BaseObject {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return IntegerObject(value: x.value * y.value)
    }
    public override func div(_ lhs: BaseObject, _ rhs: BaseObject) -> BaseObject {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return IntegerObject(value: x.value / y.value)
    }
    public override func mod(_ lhs: BaseObject, _ rhs: BaseObject) -> BaseObject {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return IntegerObject(value: x.value % y.value)
    }
  }
}
