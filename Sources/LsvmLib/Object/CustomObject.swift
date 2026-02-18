extension Object {
    public final class CustomObject: BaseObject {
        public override init() {
            super.init()
            self.klass = CustomObjectKlass()
            self.dict = newDict()
        }
    }
    public final class CustomObjectKlass: Klass, @unchecked Sendable {
    }
}
