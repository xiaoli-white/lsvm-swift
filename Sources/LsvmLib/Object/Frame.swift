extension Object {
  public final class FrameObject: BaseObject {
    public var code: CodeObject
    public var parent: FrameObject?
    public var pc: Int = 0
    public var stackBase: UnsafeMutablePointer<BaseObject>!
    public var stack: UnsafeMutablePointer<BaseObject>!
    public var globals: DictObject = DictObject()
    public var locals: DictObject = DictObject()
    public var builtins: DictObject
    public init(code: CodeObject, builtins: DictObject, parent: FrameObject? = nil) {
      self.code = code
      self.builtins = builtins
      self.parent = parent
      self.stackBase = UnsafeMutablePointer<BaseObject>.allocate(capacity: Int(code.stackSize))
      self.stackBase.initialize(repeating: NullObject.instance, count: Int(code.stackSize))
      self.stack = self.stackBase
    }
    deinit {
      self.stackBase.deallocate()
    }
  }
}
