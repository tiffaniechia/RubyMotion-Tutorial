class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    # window will take the given uiviewcontroller and adjust its view's size to fit the window
    # better way of setting up your window as opposed to window.addsubview errwhere

    # initwithnibname. to load controller from NIB file (created using xcode interface builder to visually construct view)
    # but no xcode so we can safely pass nil
    # it is also the 'designated initializer ' of uiciewcontrollers.
    # hence whenever you want to create a controller you must call this method at some point
    @window.rootViewController = TapController.alloc.initWithNibName(nil, bundle: nil)

    true
  end
end
