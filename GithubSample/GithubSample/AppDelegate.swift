import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? {
        get { return handler.window }
        set { fatalError("setter must not be called") }
    }

    private lazy var handler = AppDelegateHandler()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return handler.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        handler.applicationDidEnterBackground(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        handler.applicationDidBecomeActive(application)
    }
}

// MARK: - AppDelegateHandler

private final class AppDelegateHandler {
    private(set) lazy var window: UIWindow = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        return window
    }()

    private(set) lazy var rootViewController: UIViewController = RootViewController()

    init(rootViewController: UIViewController? = nil, environment: Environment = .shared) {
        if let rootViewController = rootViewController {
            self.rootViewController = rootViewController
        }
    }

    func application(_ application: ApplicationProtocol, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = window
        return true
    }

    func applicationDidEnterBackground(_ application: ApplicationProtocol) {}

    func applicationDidBecomeActive(_ application: ApplicationProtocol) {}
}

// MARK: - ApplicationProtocol

protocol ApplicationProtocol: AnyObject {}

extension UIApplication: ApplicationProtocol {}
