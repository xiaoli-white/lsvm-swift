extension Object {
    public typealias VMCode = Unmanaged<CodeObject>
    public static func newCode(
        name: VMString, fileName: VMString, qualname: VMString? = nil, argCount: UInt64,
        localCount: UInt64, stackSize: UInt64, code: [UInt8]
    ) -> VMCode {
        Unmanaged.passRetained(
            CodeObject(
                name: name, fileName: fileName, qualname: qualname, argCount: argCount,
                localCount: localCount, stackSize: stackSize, code: code))
    }
    public final class CodeObject: BaseObject {
        public let name: VMString
        public let fileName: VMString
        public let qualname: VMString
        public let argCount: UInt64
        public let localCount: UInt64
        public let stackSize: UInt64
        public let code: [UInt8]
        public var names: VMList = newList()
        public var constants: VMList = newList()
        public var varnames: VMList = newList()
        fileprivate init(
            name: VMString, fileName: VMString, qualname: VMString? = nil, argCount: UInt64,
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
                self.qualname = name.retain()
            }
        }
        deinit {
            name.release()
            fileName.release()
            qualname.release()
            names.release()
            constants.release()
            varnames.release()
        }
    }
}
