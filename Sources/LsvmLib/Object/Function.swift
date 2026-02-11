extension Object {
  public final class FunctionObject: BaseObject {
    public var code: CodeObject
    public var globals: DictObject
    public var builtins: DictObject
    public var name: StringObject
    public var qualname: StringObject
    public init(
      code: CodeObject, globals: DictObject, builtins: DictObject,qualname: StringObject? = nil
    ) {
      self.code = code
      self.globals = globals
      self.builtins = builtins
      self.name = code.name
      if let qualname = qualname {
        self.qualname = qualname
      } else {
        self.qualname = code.qualname
      }
      super.init()
      self.dict = DictObject()
    }
  }
}
