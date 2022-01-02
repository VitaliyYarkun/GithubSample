import RxCocoa

final class RepositoryDispatcher {
    static let shared = RepositoryDispatcher()

    let repositoriesAndPagination = PublishRelay<([GitHub.Repository], GitHub.Pagination)>()
    let error = PublishRelay<Error>()
    let isFetching = PublishRelay<Bool>()
    let clearAll = PublishRelay<Void>()
}
