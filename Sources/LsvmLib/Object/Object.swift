public enum Object {
  public class BaseObject: Equatable, Hashable, CustomStringConvertible {
    public final var klass: Klass? = nil
    public final var dict: DictObject? = nil
    public init() {
      if type(of: self) == BaseObject.self {
        fatalError("BaseObject cannot be instantiated")
      }
    }
    public final func add(_ rhs: BaseObject) -> BaseObject {
      klass!.add(self, rhs)
    }
    public final func sub(_ rhs: BaseObject) -> BaseObject {
      klass!.sub(self, rhs)
    }
    public final func mul(_ rhs: BaseObject) -> BaseObject {
      klass!.mul(self, rhs)
    }
    public final func div(_ rhs: BaseObject) -> BaseObject {
      klass!.div(self, rhs)
    }
    public final func mod(_ rhs: BaseObject) -> BaseObject {
      klass!.mod(self, rhs)
    }
    public final func pow(_ rhs: BaseObject) -> BaseObject {
      klass!.pow(self, rhs)
    }
    public var description: String {
      return "BaseObject"
    }
    public func hash(into hasher: inout Hasher) {
      hasher.combine(ObjectIdentifier(self))
    }
    public static func == (lhs: BaseObject, rhs: BaseObject) -> Bool {
      return lhs === rhs
    }
  }
}
