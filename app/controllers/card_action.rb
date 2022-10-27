class CardAction

    attr_accessor :title
    attr_accessor :link
    attr_accessor :image
    attr_accessor :description

    def initialize(title, link, image, description)
      @title = title
      @link = link
      @image = image
      @description = description
    end
  
    def to_partial_path
      'action'
    end
  
  end