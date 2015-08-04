class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    alert = UIAlertView.new
    alert.message = 'Hello World!'
    alert.show

    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'Hello'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
