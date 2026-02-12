extension Object {
  public final class IntegerObject: BaseObject {
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
  public final class IntegerKlass: Klass, @unchecked Sendable {
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
    public override func equal(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject)
      -> Object.BaseObject
    {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return x.value == y.value ? BooleanObject.TRUE : BooleanObject.FALSE
    }
    public override func notEqual(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject)
      -> Object.BaseObject
    {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return x.value != y.value ? BooleanObject.TRUE : BooleanObject.FALSE
    }
    public override func less(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject)
      -> Object.BaseObject
    {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return x.value < y.value ? BooleanObject.TRUE : BooleanObject.FALSE
    }
    public override func lessEqual(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject)
      -> Object.BaseObject
    {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return x.value <= y.value ? BooleanObject.TRUE : BooleanObject.FALSE
    }
    public override func greater(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject)
      -> Object.BaseObject
    {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return x.value > y.value ? BooleanObject.TRUE : BooleanObject.FALSE
    }
    public override func greaterEqual(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject)
      -> Object.BaseObject
    {
      let x = lhs as! IntegerObject
      let y = rhs as! IntegerObject
      return x.value >= y.value ? BooleanObject.TRUE : BooleanObject.FALSE
    }
  }
}
