class UserController < UIViewController
  include BW::KVO

  # KVO (Key-Value Observing)
  # in rubymotion objects have the abilitiy to observe arbitrary properties of other objects
  # so if we are observing a user's name, when that user's name property changes we automatically get a callback with the new value
  # lets see this in play

  attr_accessor :user

  def viewDidLoad
    super

    self.title = 'User'
    @nameLabel = UILabel.alloc.initWithFrame([[0,0],[100,30]])
    @emailLabel = UILabel.alloc.initWithFrame [[0, @nameLabel.frame.size.height + 10], @nameLabel.frame.size]
    @idLabel = UILabel.alloc.initWithFrame [[0, @emailLabel.frame.origin.y + @emailLabel.frame.size.height + 10], @nameLabel.frame.size]

    self.view.backgroundColor = UIColor.whiteColor
    self.view.addSubview @nameLabel
    self.view.addSubview @emailLabel
    self.view.addSubview @idLabel

    self.user = User.new

    %w(name id email).each {|prop|
      instance_variable_get("@#{prop}Label").text = 'change me'

      # you can change this from the console
      # requires a bit of digging around
      # remember accessing the app is delegate = UIApplication.sharedApplication.delegate
      # but bubble wrap lets you do App.delegate
      # for our current implementation it is as such
      # with the bubble-wrap gem you can type user= App.window.rootViewController.childViewControllers[0].user
      # user.name = 'whoop'
      # and watch it change

      # if we reassign self.user this will stop working becauser we're specifically only observing whatever self.user happens to be at that point of time
      # so later if we do self.user = some_other_user these observations will stop


      observe(self.user, prop) do |old_value, new_value|
        instance_variable_get("@#{prop}Label").text = new_value
      end
    }
    true
  end
end