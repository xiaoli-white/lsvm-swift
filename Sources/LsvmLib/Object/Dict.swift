import Collections

extension Object {
    public final class DictObject: BaseObject {
        private var data: OrderedDictionary<BaseObject, BaseObject> = [:]
        public var size: Int {
            data.count
        }
        public override init() {
        }
        public init(data: OrderedDictionary<BaseObject, BaseObject>) {
            self.data = data
        }
        public func contains(key: BaseObject) -> Bool {
            data.keys.contains(key)
        }
        public func get(index: Int) -> BaseObject? {
            return data.values[index]
        }
        public func get(key: BaseObject) -> BaseObject? {
            data[key]
        }
        public func setBy(index: Int, value: BaseObject) {
            data.values[index] = value
        }
        public func setBy(key: BaseObject, value: BaseObject) {
            data[key] = value
        }
        public func removeBy(index: Int) {
            data.remove(at: index)
        }
        public func removeBy(key: BaseObject) {
            data.removeValue(forKey: key)
        }
        public subscript(key: BaseObject) -> BaseObject? {
            get {
                return data[key]
            }
            set {
                data[key] = newValue
            }
        }
    }
}
