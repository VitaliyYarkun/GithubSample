import RxCocoa

final class RouteDispatcher {
    static let shared = RouteDispatcher()
    let routeCommand = PublishRelay<RouteCommand>()
}
