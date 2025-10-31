import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Prevent screen from sleeping
        UIApplication.shared.isIdleTimerDisabled = true
        
        // Setup window
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Keep app active in background
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Begin background task to keep app alive
        var backgroundTask: UIBackgroundTaskIdentifier = .invalid
        backgroundTask = application.beginBackgroundTask {
            application.endBackgroundTask(backgroundTask)
            backgroundTask = .invalid
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called when app returns to foreground
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused
    }
}
