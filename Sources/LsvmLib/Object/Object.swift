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
    public final func equal(_ rhs: BaseObject) -> BaseObject {
      klass!.equal(self, rhs)
    }
    public final func notEqual(_ rhs: BaseObject) -> BaseObject {
      klass!.notEqual(self, rhs)
    }
    public final func less(_ rhs: BaseObject) -> BaseObject {
      klass!.less(self, rhs)
    }
    public final func lessEqual(_ rhs: BaseObject) -> BaseObject {
      klass!.lessEqual(self, rhs)
    }
    public final func greater(_ rhs: BaseObject) -> BaseObject {
      klass!.greater(self, rhs)
    }
    public final func greaterEqual(_ rhs: BaseObject) -> BaseObject {
      klass!.greaterEqual(self, rhs)
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
