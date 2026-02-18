extension Object {
    public typealias VMFrame = Unmanaged<FrameObject>
    public static func newFrame(code: VMCode, builtins: VMDict, parent: VMFrame? = nil) -> VMFrame {
        Unmanaged.passRetained(FrameObject(code: code, builtins: builtins, parent: parent))
    }
    public final class FrameObject: BaseObject {
        public var code: VMCode
        public var parent: VMFrame?
        public var pc: Int = 0
        public var stackBase: UnsafeMutablePointer<VMObject>!
        public var stack: UnsafeMutablePointer<VMObject>!
        public var globals: VMDict = newDict()
        public var locals: VMDict = newDict()
        public var builtins: VMDict
        fileprivate init(code: VMCode, builtins: VMDict, parent: VMFrame?) {
            self.code = code
            self.builtins = builtins
            self.parent = parent
            self.stackBase = UnsafeMutablePointer<VMObject>.allocate(
                capacity: Int(code.takeUnretainedValue().stackSize))
            self.stackBase.initialize(
                repeating: NullObject.instance.to(),
                count: Int(code.takeUnretainedValue().stackSize))

            self.stack = self.stackBase
        }
        deinit {
            self.stackBase.deallocate()
        }
    }
}
