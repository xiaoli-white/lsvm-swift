extension Object {
  public typealias VMNull = Unmanaged<NullObject>
  public final class NullObject: BaseObject, @unchecked Sendable {
    public static let instance: VMNull = Unmanaged.passRetained(NullObject())
    private override init() {
    }
  }
}
