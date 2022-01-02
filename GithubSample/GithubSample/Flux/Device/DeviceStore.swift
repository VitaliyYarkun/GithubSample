import RxCocoa
import RxSwift

final class DeviceStore {
    static let shared = DeviceStore()

    let deviceID: ReadOnlyRelay<String>

    init(dispatcher: DeviceDispatcher = .shared,
         userDefaultsManager: UserDefaultsManager = .shared) {

        let deviceID: String
        if let id = userDefaultsManager[.deviceID] {
            deviceID = id
        } else {
            deviceID = UUID().uuidString
            userDefaultsManager[.deviceID] = deviceID
        }
        let _deviceID = BehaviorRelay<String>(value: deviceID)
        self.deviceID = ReadOnlyRelay(_deviceID)
    }
}
