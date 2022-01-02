import Foundation

protocol UserDefaultsType: AnyObject {
    func value(forKey key: String) -> Any?
    func set(_ value: Any?, forKey key: String)
    func removeObject(forKey key: String)
}

extension UserDefaults: UserDefaultsType {}

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let userDefaults: UserDefaultsType

    init(userDefaults: UserDefaultsType = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    subscript<T: OptionalType>(key: Key<T>) -> T {
        get {
            return (userDefaults.value(forKey: key.rawValue) as? T) ?? key.defaultValue
        }
        set {
            if let value = newValue.value {
                userDefaults.set(value, forKey: key.rawValue)
            } else {
                userDefaults.removeObject(forKey: key.rawValue)
            }
        }
    }

    subscript<T>(key: Key<T>) -> T {
        get {
            return (userDefaults.value(forKey: key.rawValue) as? T) ?? key.defaultValue
        }
        set {
            userDefaults.removeObject(forKey: key.rawValue)
        }
    }
}

extension UserDefaultsManager {
    final class Key<T>: UserDefaultsKeys {
        fileprivate let rawValue: String
        fileprivate let defaultValue: T

        init(key: String, defaultValue: T) {
            self.rawValue = key
            self.defaultValue = defaultValue
            super.init()
        }
    }
}

class UserDefaultsKeys {
    fileprivate init() {}
}

extension UserDefaultsKeys {
    static let deviceID = UserDefaultsManager.Key<String?>(key: "device-id", defaultValue: nil)
}
