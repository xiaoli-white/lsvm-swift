extension Object {
  public final class NativeFunctionObject: BaseObject {
    public var name: StringObject
    public var function: @Sendable (BaseObject...) -> BaseObject
    public init(name: StringObject, function: @Sendable @escaping (BaseObject...) -> BaseObject) {
      self.name = name
      self.function = function
    }
  }
}