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
        deinit {
            for x in data {
                x.release()
            }
        }
        public func append(_ x: VMObject) {
            data.append(x.retain())
        }
        public func insert(_ x: VMObject, at index: Int) {
            data.insert(x.retain(), at: index)
        }
        public func get(_ index: Int) -> VMObject? {
            return data[index].retain()
        }
        public func set(_ index: Int, _ value: VMObject) {
            let old = data[index]
            data[index] = value.retain()
            old.release()
        }
        public func pop() -> VMObject? {
            return data.popLast()
        }
        public func remove(at index: Int) -> VMObject? {
            return data.remove(at: index)
        }
        public func remove(obj: VMObject) -> VMObject? {
            let index = indexOf(obj)
            if index >= 0 {
                return data.remove(at: index)
            } else {
                return nil
            }
        }
        public func top() -> VMObject? {
            return data.last?.retain()
        }
        public func indexOf(_ obj: VMObject) -> Int {
            return data.firstIndex(of: obj) ?? -1
        }
        public func clear() {
            for x in data {
                x.release()
            }
            data.removeAll()
        }
        public func enumerated() -> EnumeratedSequence<[VMObject]> {
            return data.enumerated()
        }
        public func makeIterator() -> IndexingIterator<[VMObject]> {
            return data.makeIterator()
        }
        public subscript(index: VMInteger) -> VMObject? {
            get {
                return data[Int(index.takeRetainedValue().value)].retain()
            }
            set(newValue) {
                let i = Int(index.takeRetainedValue().value)
                let old = data[i]
                data[i] = newValue?.retain() ?? NullObject.instance.to()
                old.release()
            }
        }
    }
}
