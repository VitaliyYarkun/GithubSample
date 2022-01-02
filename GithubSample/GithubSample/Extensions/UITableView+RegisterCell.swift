import UIKit

protocol ReusableView: AnyObject {
    static var identifiler: String { get }
    static var nib: UINib { get }
}

extension ReusableView {
    static var identifiler: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: identifiler, bundle: nil)
    }
}

typealias ReusableCell = UITableViewCell & ReusableView

extension UITableView: ExtensionCompatible {}

extension Extension where Base: UITableView {
    func register<T: ReusableCell>(_ type: T.Type) {
        base.register(T.nib, forCellReuseIdentifier: T.identifiler)
    }

    func dequeueReusableCell<T: ReusableCell>(for indexPath: IndexPath, configure: (T) -> ()) -> UITableViewCell {
        let cell = base.dequeueReusableCell(withIdentifier: T.identifiler, for: indexPath)
        if let cell = cell as? T {
            configure(cell)
        }
        return cell
    }
}
