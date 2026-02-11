extension Object {
  public final class DictObject: BaseObject {
    var data: [BaseObject: BaseObject] = [:]
    public override init(){
    }
    public subscript (key: BaseObject) -> BaseObject? {
      get {
        return data[key]
      }
      set {
        data[key] = newValue
      }
    }
  }
}