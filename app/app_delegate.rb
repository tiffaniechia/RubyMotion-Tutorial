class AppDelegate

  def application(application, didFinishLaunchingWithOptions: launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(controller)

    alphabet_controller = AlphabetController.alloc.initWithNibName(nil, bundle: nil)
    alphabet_controller.tabBarItem = UITabBarItem.alloc.initWithTitle('Alphabet', image: nil, tag: 2)

    animation_controller = AnimationController.alloc.initWithNibName(nil, bundle: nil)
    animation_controller.tabBarItem = UITabBarItem.alloc.initWithTitle('Animation', image: nil, tag: 3)

    user_controller = UserController.alloc.initWithNibName(nil, bundle: nil)
    user_controller.tabBarItem = UITabBarItem.alloc.initWithTitle('User', image: nil, tag: 4)

    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [user_controller, animation_controller, alphabet_controller, nav_controller]

    @window.rootViewController = tab_controller

    true
  end

end
