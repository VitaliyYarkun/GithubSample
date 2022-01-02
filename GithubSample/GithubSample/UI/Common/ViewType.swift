import UIKit

enum ViewType {
    case repositorySearch
    case repositoryDetail
    case unknown
}

protocol ViewTypeRepresentable {
    var viewType: ViewType { get }
}

extension ViewTypeRepresentable {
    var viewType: ViewType {
        return .unknown
    }
}

extension UIViewController: ViewTypeRepresentable {}
