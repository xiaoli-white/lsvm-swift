extension Object {
  public final class NullObject: BaseObject, @unchecked Sendable {
    public static let instance = NullObject()
    private override init() {
    }
  }
}
