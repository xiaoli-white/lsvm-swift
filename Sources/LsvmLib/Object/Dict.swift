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
        deinit {
            for (key, value) in data {
                key.release()
                value.release()
            }
        }
        public func contains(key: VMObject) -> Bool {
            let result = data.keys.contains(key)
            key.release()
            return result
        }
        public func get(index: Int) -> VMObject? {
            return data.values[index].retain()
        }
        public func get(key: VMObject) -> VMObject? {
            let x = data[key]?.retain()
            key.release()
            return x
        }
        public func set(index: Int, value: VMObject) {
            var values = data.values
            let old = values[index]
            values[index] = value.retain()
            old.release()
        }
        public func set(key: VMObject, value: VMObject) {
            let old = data[key]
            if old == nil {
                let _ = key.retain()
            }
            data[key] = value.retain()
            old?.release()
            key.release()
        }
        public func removeBy(index: Int) {
            data.values[index].release()
            data.remove(at: index)
        }
        public func removeBy(key: VMObject) {
            data.removeValue(forKey: key)?.release()
            key.release()
        }
        public subscript(key: VMObject) -> VMObject? {
            get {
                let x = data[key]?.retain()
                key.release()
                return x
            }
            set(value) {
                let old = data[key]
                if old == nil {
                    let _ = key.retain()
                }
                data[key] = value?.retain()
                old?.release()
                key.release()
            }
        }
    }
}
