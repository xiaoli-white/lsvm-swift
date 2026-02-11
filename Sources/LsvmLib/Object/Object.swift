public enum Object {
  public class BaseObject: Equatable, Hashable {
    public var dict: DictObject? = nil
    public init() {
      if type(of: self) == BaseObject.self {
        fatalError("BaseObject cannot be instantiated")
      }
    }
    public static func == (lhs: BaseObject, rhs: BaseObject) -> Bool {
      return lhs === rhs
    }
    public func hash(into hasher: inout Hasher) {
      hasher.combine(ObjectIdentifier(self))
    }
  }
}
