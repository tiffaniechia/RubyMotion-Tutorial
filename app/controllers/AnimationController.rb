class AnimationController < UIViewController
  def viewDidLoad
    super
    self.title = 'Animation'

    @points = [[0, 0], [50, 0], [0, 50], [50, 50]]
    @current_index = 0

    # syntax for frame
    # this nested array structure is shorthand for the CGRectMake
    # first subarray represents origin
    # second sub array represents size of structure
    @view = UIView.alloc.initWithFrame [@points[@current_index], [100, 100]]
    @view.backgroundColor = UIColor.blueColor

    self.view.addSubview @view

    animate_to_next_point

    true
  end

  def animate_to_next_point
    @current_index += 1
    @current_index = @current_index % @points.count


    # lambda are small functions assigned to variables or passed as arguments
    # my_lambda = lambda {p 'hello!'}
    # my_lambda.call will execute
    # it can also take arguments
    # my_lambda = lambda {|name| p "hello #{name}!"}
    # my_lambda.call('clay')
    # => hello clay!


    # animatewithduration:animations:complemtion function is the flux-capacitor of animations - it's what makes them possible
    # duration: sets how long the animations will last in seconds, you can do floats like 1.85 (psa: quick animations should be .3 seconds)
    # animations: any changes here in your lambda will animate smoothly! (note: some properties arent animatable but common things like frame, bounds, alpha will work fine)
                  # so here @view.frame will have the next origin in our set of @points
                  # the default animation curve in iod is UIViewAnimationOptionCurveEaseInOut (speeds up and slows down in between each point)
    # delay: takes a value in secons which will offset the start of our animations block
                  # dont use this argument if you want it to just loop smoothly
    # options: Animations are guided by animation curves. takes a bit-mask of integers, which are all prefixed with UIViewAnimationOption
                  # the use case for this is if you want to combine multiple animation options at the same time
                  # example: a linear animation curve and automative animation looping
                           # options: (UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat)
    # completions: is called after your animations finish.
                  # you MUST accept an argument in this lambda, it will be a boolean value which tells you if the animations really did finish
                  # animations usually fail because they were cancelled by other animations (only happens when you explicitly coerce it)
    UIView.animateWithDuration(2,
                               delay: 1,
                               options: UIViewAnimationOptionCurveLinear,
                               animations: lambda {
                                 @view.frame = [@points[@current_index], [100, 100]]
                               },
                               completion: lambda { |finished|
                                 self.animate_to_next_point
                               }
    )
  end


end