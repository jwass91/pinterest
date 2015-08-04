class Pin
  attr_reader :user, :image, :link, :description, :category
  
  def initialize(user, image, link, description, category)
    @user = user
    @image = image
    @link = link
    @description = description
    @category = category
  end
  
  def pin
  end
  
  def send
  end
  
  def heart
  end
  
  
  
end