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
