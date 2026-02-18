import Collections
import SwiftUtils

extension Object {
    public typealias VMDict = Unmanaged<DictObject>
    public static func newDict() -> VMDict {
        Unmanaged.passRetained(DictObject())
    }
    public static func newDict(data: OrderedDictionary<VMObject, VMObject>) -> VMDict {
        Unmanaged.passRetained(DictObject(data: data))
    }
    public final class DictObject: BaseObject {
        private var data: OrderedDictionary<VMObject, VMObject> = [:]
        public var size: Int {
            data.count
        }
        fileprivate override init() {
        }
        fileprivate init(data: OrderedDictionary<VMObject, VMObject>) {
            self.data = data
        }
        public func contains(key: VMObject) -> Bool {
            data.keys.contains(key)
        }
        public func get(index: Int) -> VMObject? {
            return data.values[index]
        }
        public func get(key: VMObject) -> VMObject? {
            data[key]
        }
        public func set(index: Int, value: VMObject) {
            data.values[index] = value
        }
        public func set(key: VMObject, value: VMObject) {
            data[key] = value
        }
        public func removeBy(index: Int) {
            data.remove(at: index)
        }
        public func removeBy(key: VMObject) {
            data.removeValue(forKey: key)
        }
        public subscript(key: VMObject) -> VMObject? {
            get {
                return data[key]
            }
            set {
                data[key] = newValue
            }
        }
    }
}
