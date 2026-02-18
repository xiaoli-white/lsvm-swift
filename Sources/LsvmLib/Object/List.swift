extension Object {
    public final class ListObject: BaseObject {
        public var data: [BaseObject] = []
        public var size: Int {
            data.count
        }
        public var capacity: Int {
            data.capacity
        }
        public init(capacity: Int = 0) {
            data = [BaseObject](repeating: NullObject.instance, count: capacity)
        }
        public init(_ data: [BaseObject]) {
            self.data = data
        }
        public func append(_ x: BaseObject) {
            data.append(x)
        }
        public func insert(_ x: BaseObject, at index: Int) {
            data.insert(x, at: index)
        }
        public func get(_ index: Int) -> BaseObject? {
            return data[index]
        }
        public func set(_ index: Int, object: BaseObject) {
            data[index] = object
        }
        public func pop() -> BaseObject? {
            return data.popLast()
        }
        public func remove(at index: Int) -> BaseObject? {
            return data.remove(at: index)
        }
        public func remove(obj: BaseObject) {
            let index = indexOf(obj)
            if index >= 0 {
                data.remove(at: index)
            }
        }
        public func top() -> BaseObject? {
            return data.last
        }
        public func indexOf(_ obj: BaseObject) -> Int {
            return data.firstIndex(of: obj) ?? -1
        }
        public func clear() {
            data.removeAll()
        }
        public subscript(index: IntegerObject) -> BaseObject? {
            get {
                return data[Int(index.value)]
            }
            set(newValue) {
                data[Int(index.value)] = newValue ?? NullObject.instance
            }
        }
    }
}
