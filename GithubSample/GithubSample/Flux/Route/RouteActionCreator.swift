final class RouteActionCreator {
    static let shared = RouteActionCreator()
    private let dispatcher: RouteDispatcher

    init(dispatcher: RouteDispatcher = .shared) {
        self.dispatcher = dispatcher
    }

    func setRouteCommand(_ command: RouteCommand) {
        dispatcher.routeCommand.accept(command)
    }
}
