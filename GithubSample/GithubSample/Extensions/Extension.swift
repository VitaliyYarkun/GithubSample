protocol ExtensionCompatible {
    associatedtype ExtensionCompatibleType = Self
    var `extension`: Extension<ExtensionCompatibleType> { get }
}

extension ExtensionCompatible {
    var `extension`: Extension<Self> {
        return Extension(base: self)
    }
}

struct Extension<Base> {
    let base: Base
}
