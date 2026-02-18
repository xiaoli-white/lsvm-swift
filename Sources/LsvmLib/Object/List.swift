extension Object {
    public typealias VMList = Unmanaged<ListObject>
    public static func newList(capacity: Int = 0) -> VMList {
        Unmanaged.passRetained(ListObject(capacity: capacity))
    }
    public static func newList(_ data: [VMObject]) -> VMList {
        Unmanaged.passRetained(ListObject(data))
    }
    public final class ListObject: BaseObject {
        private var data: [VMObject] = []
        public var size: Int {
            data.count
        }
        public var capacity: Int {
            data.capacity
        }
        fileprivate init(capacity: Int) {
            data = [VMObject](repeating: NullObject.instance.to(), count: capacity)
        }
        fileprivate init(_ data: [VMObject]) {
            self.data = data
        }
        public func append(_ x: VMObject) {
            data.append(x)
        }
        public func insert(_ x: VMObject, at index: Int) {
            data.insert(x, at: index)
        }
        public func get(_ index: Int) -> VMObject? {
            return data[index]
        }
        public func set(_ index: Int, _ value: VMObject) {
            data[index] = value
        }
        public func pop() -> VMObject? {
            return data.popLast()
        }
        public func remove(at index: Int) -> VMObject? {
            return data.remove(at: index)
        }
        public func remove(obj: VMObject) {
            let index = indexOf(obj)
            if index >= 0 {
                data.remove(at: index)
            }
        }
        public func top() -> VMObject? {
            return data.last
        }
        public func indexOf(_ obj: VMObject) -> Int {
            return data.firstIndex(of: obj) ?? -1
        }
        public func clear() {
            data.removeAll()
        }
        public subscript(index: VMInteger) -> VMObject? {
            get {
                return data[Int(index.takeUnretainedValue().value)]
            }
            set(newValue) {
                data[Int(index.takeUnretainedValue().value)] = newValue ?? NullObject.instance.to()
            }
        }
    }
}
