class Pin
  attr_reader :user, :image, :link, :description, :category
  
  ALL_PINS = []
  
  def initialize(user, image, link, description, category)
    @user = user
    @image = image
    @link = link
    @description = description
    @category = category
    ALL_PINS.push(self)
  end
  
  def pin
  end
  
  def send
  end
  
  def heart
  end
  
  def self.all
    return ALL_PINS
  end
end