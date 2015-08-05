class User

  # so that we can do this
  # server_hash = {name: 'clay', email: 'my@email.com', id:100}
  # @user = User.new(server_hash)
  # @user.name
  # => clay
  # also lets us extend this PROPERTIES constant easily

  PROPERTIES = [:id, :name, :email]
  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize(attributes = {})
    attributes.each { |key,value|
      self.send("#{key}=",value) if PROPERTIES.member? key
    }
  end

  # instead of making API calls everytime we want to retrieve data we want to check if we have a local copy first (cache)
  # NSUserDefaults object exists as a persistent key-value store.
  # typically, we use the instance od NSUSerDefaults.standardUserDefaults as our objects
      # @defaults = NSUserDefaults.standUserDefaults
      # @defaults['one' = 1]
      # somewhere else next time we run the app
      # @defaults['one']
      # => 1
  # NSUserDefaults are saved as long as your app is installed!!
  # you can can call NSUserDefaults.resetStandardUserDefaults to purge all entries
  # BUT we can only store primitives (str, int, hashes), or raw data/bytes
  # since User object isn't a primitive we have to use the raw data method

  # this method is done through a process called 'archiving' using NSKeyedArchiver
  # this class takes an object and creates an instance of NSData that NSUserDefaults can save
  # which means that they are NSCoding compliant
  # NSCoding compliant = implements two methods which define how to serialize and deserialize themselves using a standard API

  # method 1: initWithCoder: loading an object
  # method 2: encodeWithCoder: saving an object
  # these two methods should be mirror images encode and decode with same keys

  # so,
       # defaults = NSUSerDefaults.standardUserDefaults
       # post = Post.new
       # post.message = 'hello'
       # post.id = 100
       # post_as_data = NSKeyedArchiver.archivedDataWithRootObject(post)
       # defaults['saved_post']= post_as_data
       # later when we want to load this post
       # post_as_data = defaults['saved_post']
       # post = NSKeyedArchiver.unarchiveObjectWithData(post_as_data      )


  def initWithCoder(decoder)
    self.init
    PROPERTIES.each {|prop|
      value = decoder.decodeObjectForKey(prop.to_s)
      self.send((prop.to_s + '=').to_s, value) if value
    }
    # this is an initializer so should return self
    self
  end

  def encodeWithCoder(encoder)
    PROPERTIES.each { |prop|
      encoder.encoderObject(self.send(prop), forKey: prop.to_s)
    }
  end

end