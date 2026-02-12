extension Object {
  public final class BooleanObject: BaseObject, @unchecked Sendable {
    public static let TRUE = BooleanObject(value: true)
    public static let FALSE = BooleanObject(value: false)
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
