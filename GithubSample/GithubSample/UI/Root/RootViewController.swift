import RxCocoa
import RxSwift

final class RootViewController: UIViewController {
    private let currentNavigationController = UINavigationController()
    private lazy var viewModel = RootViewModel(viewTypes: { [weak nc = currentNavigationController] in
        nc?.viewControllers.map { $0.viewType } ?? []
    })
    private let disposeBag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(currentNavigationController)
        currentNavigationController.view.frame = view.bounds
        view.addSubview(currentNavigationController.view)
        currentNavigationController.didMove(toParent: self)

        viewModel.showRepositorySearch
            .bind(to: Binder(currentNavigationController) { nc, transition in
                switch transition {
                case .set:
                    nc.setViewControllers([RepositorySearchViewController()], animated: false)
                    
                case .popToRoot:
                    nc.popToRootViewController(animated: true)
                }
            })
            .disposed(by: disposeBag)

        viewModel.showRepositoryDetail
            .bind(to: Binder(currentNavigationController) { nc, transition in
                switch transition {
                case let .set(data):
                    let root = RepositorySearchViewController()
                    let vc = RepositoryDetailViewController(data)
                    nc.setViewControllers([root, vc], animated: false)
                    
                case let .push(data):
                    let vc = RepositoryDetailViewController(data)
                    nc.pushViewController(vc, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
}
