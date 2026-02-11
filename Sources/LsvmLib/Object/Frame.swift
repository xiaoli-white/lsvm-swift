extension Object {
  public final class FrameObject: BaseObject {
    private var code: ByteCodeObject
    private var parent: FrameObject?
    public init(code: ByteCodeObject, parent: FrameObject?) {
      self.code = code
      self.parent = parent
    }
  }
}
