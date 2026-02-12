extension Object {
  public final class IntegerObject: BaseObject {
    public var value: Int64
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
  }
}
