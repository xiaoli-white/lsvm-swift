public class Klass {
    public init() {

    }
    public func getattr(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["getattr"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else if let value = lhs.dict?.get(key: rhs) {
            return value
        } else {
            fatalError("")
        }
    }
    public func setattr(_ x: Object.BaseObject, _ y: Object.BaseObject, _ z: Object.BaseObject)
        -> Object.BaseObject
    {
        let funcName = Object.StringObject(x.operatorFuncNames["setattr"]!)
        if let f = x.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([x, y, z]))
        } else {
            x.dict?[y] = z
            return z
        }
    }
    public func add(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["add"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func sub(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["sub"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func mul(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["mul"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func div(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["div"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func mod(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["mod"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func pow(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["pow"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func equal(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["equal"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func notEqual(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["notEqual"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func less(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["less"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func lessEqual(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["lessEqual"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func greater(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["greater"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func greaterEqual(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject)
        -> Object.BaseObject
    {
        let funcName = Object.StringObject(lhs.operatorFuncNames["greaterEqual"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func and(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["and"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func or(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["or"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func xor(_ lhs: Object.BaseObject, _ rhs: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(lhs.operatorFuncNames["xor"]!)
        if let f = lhs.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([lhs, rhs]))
        } else {
            fatalError("")
        }
    }
    public func not(_ x: Object.BaseObject) -> Object.BaseObject {
        let funcName = Object.StringObject(x.operatorFuncNames["not"]!)
        if let f = x.dict?.get(key: funcName) {
            return Interpreter.instance.callFunction(f, Object.ListObject([x]))
        } else {
            fatalError("")
        }
    }
}
