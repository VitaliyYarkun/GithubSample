import Foundation

extension GitHub {
    struct ItemsResponse<Item: Decodable>: Decodable {
        private enum CodingKeys: String, CodingKey {
            case totalCount = "total_count"
            case incompleteResults = "incomplete_results"
            case items
        }
        
        let totalCount: Int
        let incompleteResults: Bool
        let items: [Item]
    }
}
