import UIKit
import RxSwift

extension UIViewController: ExtensionCompatible {}

extension Extension where Base: UIViewController {
    var viewDidAppear: Observable<Bool> {
        return base.rx.methodInvoked(#selector(UIViewController.viewDidAppear(_:)))
            .flatMap { ($0.first as? Bool).map(Observable.just) ?? .empty()  }
    }
}
