public class Klass {
    public init() {

    }
    public func getattr(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["getattr"]!)
        let dict = lhs.takeUnretainedValue().dict?.takeUnretainedValue()
        if let f = dict?.get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else if let value = dict?.get(key: rhs) {
            return value
        } else {
            fatalError("")
        }
    }
    public func setattr(_ x: Object.VMObject, _ y: Object.VMObject, _ z: Object.VMObject)
        -> Object.VMObject
    {
        let funcName = Object.newString(x.takeUnretainedValue().operatorFuncNames["setattr"]!)
        let dict = x.takeUnretainedValue().dict?.takeUnretainedValue()
        if let f = dict?.get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([x, y, z]))
        } else {
            dict?[y] = z
            return z
        }
    }
    public func add(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["add"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func sub(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["sub"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func mul(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["mul"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func div(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["div"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func mod(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["mod"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func pow(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["pow"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func equal(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["equal"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func notEqual(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["notEqual"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func less(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["less"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func lessEqual(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["lessEqual"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func greater(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["greater"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func greaterEqual(_ lhs: Object.VMObject, _ rhs: Object.VMObject)
        -> Object.VMObject
    {
        let funcName = Object.newString(
            lhs.takeUnretainedValue().operatorFuncNames["greaterEqual"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func and(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["and"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func or(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["or"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func xor(_ lhs: Object.VMObject, _ rhs: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(lhs.takeUnretainedValue().operatorFuncNames["xor"]!)
        if let f = lhs.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func not(_ x: Object.VMObject) -> Object.VMObject {
        let funcName = Object.newString(x.takeUnretainedValue().operatorFuncNames["not"]!)
        if let f = x.takeUnretainedValue().dict?.takeUnretainedValue().get(key: funcName.to()) {
            return Interpreter.instance.callFunction(f, Object.newList([x]))
        } else {
            fatalError("")
        }
    }
}
