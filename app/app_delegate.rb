class AppDelegate

  def application(application, didFinishLaunchingWithOptions: launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(controller)
    alphabet_controller = AlphabetController.alloc.initWithNibName(nil, bundle: nil)
    animation_controller = AnimationController.alloc.initWithNibName(nil, bundle: nil)

    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [animation_controller, alphabet_controller, nav_controller]

    #why does the tabview always unable to load one of the tabs upfront????
    @window.rootViewController = tab_controller

    true
  end

end
