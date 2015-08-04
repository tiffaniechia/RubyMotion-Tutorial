class AppDelegate

  # ios sdk uses uinavigationcontroller and uitabbarcontroller for continaing child view ontrollers
  # uinavigationcontroller and uitabbarcontroller are uiviewcontroller subclasses which actually manager other uiviewcontrollers
  # they have a view just like regular controllers to which children controller's views are added as subviews

  def application(application, didFinishLaunchingWithOptions: launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    nav_controller = UINavigationController.alloc.initWithRootViewController(controller)

    other_controller = UIViewController.alloc.initWithNibName(nil, bundle: nil)
    other_controller.title = 'other'
    other_controller.view.backgroundColor = UIColor.purpleColor

    # unlike other containers uitabbarcontrollers are only supposed to act as the rootviewcontroller of the window
    # which means you shouldnt push a tab bat controller inside a navigation controller
    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    # uses viewcontrollers to control its children
    tab_controller.viewControllers = [nav_controller, other_controller]

    @window.rootViewController = tab_controller

    true
  end

end
