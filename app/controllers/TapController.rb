class TapController < UIViewController
  # runs after self.view is loaded
  def viewDidLoad

    # must call super in uiviewcontroller
    super

    self.view.backgroundColor = UIColor.whiteColor

    # rectzero because we don't know the exact starting size
    @label = UILabel.alloc.initWithFrame(CGRectZero)
    @label.text = 'Taps'

    # size to fit and center to center the controller's view
    @label.sizeToFit
    @label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2)

    self.view.addSubview @label
  end
end
