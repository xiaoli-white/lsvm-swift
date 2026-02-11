extension Object {
  public final class FunctionObject: BaseObject {
    public var code: ByteCodeObject
    public var globals: DictObject
    public var builtins: DictObject
    public var name: StringObject
    public var qualname: StringObject
    public init(
      code: ByteCodeObject, globals: DictObject, builtins: DictObject, name: StringObject,
      qualname: StringObject
    ) {
      self.code = code
      self.globals = globals
      self.builtins = builtins
      self.name = name
      self.qualname = qualname
      super.init()
      self.dict = DictObject()
    }
  }
}
