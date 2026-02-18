public enum Object {
    public typealias VMObject = Unmanaged<BaseObject>
    public class BaseObject: Equatable, Hashable, CustomStringConvertible {
        public final var klass: Klass? = nil
        public final var dict: VMDict? = nil
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
        internal init() {
            if type(of: self) == VMObject.self {
                fatalError("VMObject cannot be instantiated")
            }
        }
        public final func getattr(_ name: VMObject) -> VMObject {
            klass!.getattr(Unmanaged.passUnretained(self), name)
        }
        public final func setattr(_ name: VMObject, _ value: VMObject) -> VMObject {
            klass!.setattr(Unmanaged.passUnretained(self), name, value)
        }
        public final func add(_ rhs: VMObject) -> VMObject {
            klass!.add(Unmanaged.passUnretained(self), rhs)
        }
        public final func sub(_ rhs: VMObject) -> VMObject {
            klass!.sub(Unmanaged.passUnretained(self), rhs)
        }
        public final func mul(_ rhs: VMObject) -> VMObject {
            klass!.mul(Unmanaged.passUnretained(self), rhs)
        }
        public final func div(_ rhs: VMObject) -> VMObject {
            klass!.div(Unmanaged.passUnretained(self), rhs)
        }
        public final func mod(_ rhs: VMObject) -> VMObject {
            klass!.mod(Unmanaged.passUnretained(self), rhs)
        }
        public final func pow(_ rhs: VMObject) -> VMObject {
            klass!.pow(Unmanaged.passUnretained(self), rhs)
        }
        public final func equal(_ rhs: VMObject) -> VMObject {
            klass!.equal(Unmanaged.passUnretained(self), rhs)
        }
        public final func notEqual(_ rhs: VMObject) -> VMObject {
            klass!.notEqual(Unmanaged.passUnretained(self), rhs)
        }
        public final func less(_ rhs: VMObject) -> VMObject {
            klass!.less(Unmanaged.passUnretained(self), rhs)
        }
        public final func lessEqual(_ rhs: VMObject) -> VMObject {
            klass!.lessEqual(Unmanaged.passUnretained(self), rhs)
        }
        public final func greater(_ rhs: VMObject) -> VMObject {
            klass!.greater(Unmanaged.passUnretained(self), rhs)
        }
        public final func greaterEqual(_ rhs: VMObject) -> VMObject {
            klass!.greaterEqual(Unmanaged.passUnretained(self), rhs)
        }
        public func and(_ rhs: VMObject) -> VMObject {
            klass!.and(Unmanaged.passUnretained(self), rhs)
        }
        public func or(_ rhs: VMObject) -> VMObject {
            klass!.or(Unmanaged.passUnretained(self), rhs)
        }
        public func xor(_ rhs: VMObject) -> VMObject {
            klass!.xor(Unmanaged.passUnretained(self), rhs)
        }
        public func not() -> VMObject {
            klass!.not(Unmanaged.passUnretained(self))
        }
        public var description: String {
            return "VMObject"
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
        public static func == (lhs: BaseObject, rhs: BaseObject) -> Bool {
            return lhs === rhs
        }
    }
}
