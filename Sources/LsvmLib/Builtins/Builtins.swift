public enum Builtins {
  public static func getBuiltins() -> [String: @Sendable (Object.BaseObject...) -> Object.BaseObject ] {
    return [
      "print": Builtins.print,
    ]
  }
}