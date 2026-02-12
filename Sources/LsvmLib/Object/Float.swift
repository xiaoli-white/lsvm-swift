public extension Object {
  final class FloatObject: BaseObject {
    public var value: Double
    public init(value: Double) {
      self.value = value
      super.init()
      self.klass = FloatKlass.instance
    }
  }
  final class FloatKlass: Klass, @unchecked Sendable {
    public static let instance = FloatKlass()
    private override init() {

    }
  }
}
