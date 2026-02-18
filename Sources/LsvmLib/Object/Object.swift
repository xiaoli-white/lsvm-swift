public enum Object {
    public class BaseObject: Equatable, Hashable, CustomStringConvertible {
        public final var klass: Klass? = nil
        public final var dict: DictObject? = nil
        public var operatorFuncNames: [String: String] = [
            "getattr": "__getattr__",
            "setattr": "__setattr__",
            "add": "__add__",
            "sub": "__sub__",
            "mul": "__mul__",
            "div": "__div__",
            "mod": "__mod__",
            "pow": "__pow__",
            "equal": "__eq__",
            "notEqual": "__ne__",
            "less": "__lt__",
            "greater": "__gt__",
            "lessEqual": "__le__",
            "greaterEqual": "__ge__",
            "and": "__and__",
            "or": "__or__",
            "xor": "__xor__",
            "not": "__not__",
        ]
        public init() {
            if type(of: self) == BaseObject.self {
                fatalError("BaseObject cannot be instantiated")
            }
        }
        public final func getattr(_ name: BaseObject) -> BaseObject {
            klass!.getattr(self, name)
        }
        public final func setattr(_ name: BaseObject, _ value: BaseObject) -> BaseObject {
            klass!.setattr(self, name, value)
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
        public func and(_ rhs: BaseObject) -> BaseObject {
            klass!.and(self, rhs)
        }
        public func or(_ rhs: BaseObject) -> BaseObject {
            klass!.or(self, rhs)
        }
        public func xor(_ rhs: BaseObject) -> BaseObject {
            klass!.xor(self, rhs)
        }
        public func not() -> BaseObject {
            klass!.not(self)
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
