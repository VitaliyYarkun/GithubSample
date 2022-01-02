final class DeviceActionCreator {
    static let shared = DeviceActionCreator()

    init(dispatcher: DeviceDispatcher = .shared) {}
}
