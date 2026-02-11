extension Object {
  public final class CodeObject: BaseObject {
    public var name: StringObject
    public var fileName: StringObject
    public var qualname: StringObject
    public var argCount: UInt64
    public var localCount: UInt64
    public var stackSize: UInt64
    public var code: [UInt8]
    public var names: ListObject = ListObject()
    public var constants: ListObject = ListObject()
    public var varnames: ListObject = ListObject()
    public init(
      name: StringObject, fileName: StringObject, qualname: StringObject? = nil, argCount: UInt64,
      localCount: UInt64, stackSize: UInt64,
      code: [UInt8]
    ) {
      self.name = name
      self.fileName = fileName
      self.argCount = argCount
      self.localCount = localCount
      self.stackSize = stackSize
      self.code = code
      if let qualname = qualname {
        self.qualname = qualname
      } else {
        self.qualname = name
      }
    }
  }
}
