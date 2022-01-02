import RxSwift

final class RouteStore {
    static let shared = RouteStore()
    let routeCommand: Observable<RouteCommand>

    init(dispatcher: RouteDispatcher = .shared) {
        self.routeCommand = dispatcher.routeCommand.asObservable()
    }
}

enum RouteCommand {
    enum RepositoryData {
        case id(String)
        case object(GitHub.Repository)
    }
    
    case repositorySearch
    case repositoryDetail(RepositoryData)
}
