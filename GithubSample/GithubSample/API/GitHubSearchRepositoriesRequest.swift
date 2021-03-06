extension GitHub {
    struct SearchRepositoriesRequest: GitHubRequest {
        typealias Response = ItemsResponse<Repository>

        let method: HttpMethod = .get
        let path = "/search/repositories"

        var queryParameters: [String : String]? {
            var params: [String: String] = ["q": query]
            if let page = page {
                params["page"] = "\(page)"
            }
            if let perPage = perPage {
                params["per_page"] = "\(perPage)"
            }
            if let sort = sort {
                params["sort"] = sort.rawValue
            }
            if let order = order {
                params["order"] = order.rawValue
            }
            return params
        }

        let query: String
        let sort: Sort?
        let order: Order?
        let page: Int?
        let perPage: Int?
    }
}

extension GitHub.SearchRepositoriesRequest {
    enum Sort: String {
        case stars
        case forks
        case updated
    }

    enum Order: String {
        case asc
        case desc
    }
}
