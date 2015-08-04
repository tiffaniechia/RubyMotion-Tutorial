class TapController < UIViewController

  def viewDidLoad
    super

    self.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = 'Taps'

    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)

    self.view.addSubview @label

    self.title = "Tap (#{self.navigationController.viewControllers.count})"

    @right_button = UIBarButtonItem.alloc.initWithTitle('Push', style: UIBarButtonItemStyleBordered, target: self, action: 'push')

    # navigation controller uses navigation item to change buttons and other options of the top blue bar
    self.navigationItem.rightBarButtonItem = @right_button
  end

  def push
    @new_controller = TapController.alloc.initWithNibName(nil, bundle: nil)
    # navigation controller uses pushviewcontroller:animated and popviewcontrolleranimated to control the stack
    # by default the navigationcontroller will also show a back button which handles the popping of the current controller for s
    # normally we call popviewcontrolleranimated
    self.navigationController.pushViewController(@new_controller, animated: true)
  end

  # bundle because we want it to create the tabbaritem as soon as the controller exists regardless of whether or not its view exits
  # so if you put it in viewdidload then it might not get created whent he app launches
  # initwithtitle:image:tag: if you want to supply a custom image and a title.
  # image as to be 30x30 black and transparent icon
  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTabBarSystemItem(UITabBarSystemItemFavorites, tag: 1)
    self
  end

end
