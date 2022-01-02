final class Environment {
    static let shared = Environment()

    let flux: Flux

    init(flux: Flux = .shared) {
        self.flux = flux
    }
}

extension Environment {
    final class Flux {
        static let shared = Flux()

        let routeActionCreator: RouteActionCreator
        let routeDispatcher: RouteDispatcher
        let routeStore: RouteStore

        let repositoryActionCreator: RepositoryActionCreator
        let repositoryDispatcher: RepositoryDispatcher
        let repositoryStore: RepositoryStore

        let deviceActionCreator: DeviceActionCreator
        let deviceDispatcher: DeviceDispatcher
        let deviceStore: DeviceStore

        init(routeActionCreator: RouteActionCreator = .shared,
             routeDispatcher: RouteDispatcher = .shared,
             routeStore: RouteStore = .shared,
             repositoryActionCreator: RepositoryActionCreator = .shared,
             repositoryDispatcher:  RepositoryDispatcher = .shared,
             repositoryStore: RepositoryStore = .shared,
             deviceActionCreator: DeviceActionCreator = .shared,
             deviceDispatcher: DeviceDispatcher = .shared,
             deviceStore: DeviceStore = .shared) {

            self.routeActionCreator = routeActionCreator
            self.routeDispatcher = routeDispatcher
            self.routeStore = routeStore
            self.repositoryActionCreator = repositoryActionCreator
            self.repositoryDispatcher = repositoryDispatcher
            self.repositoryStore = repositoryStore
            self.deviceActionCreator = deviceActionCreator
            self.deviceDispatcher = deviceDispatcher
            self.deviceStore = deviceStore
        }
    }
}
