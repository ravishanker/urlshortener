require 'uri'

class Url < ActiveRecord::Base
  attr_accessible :url, :shortlink

  has_many :visitors

  #validates :url, format: { with: URI.regexp(['http', 'https']) }

  after_create :set_shortlink
  
  private
  def set_shortlink
  	update_attribute(:shortlink, self.id.to_s(36))
  end

end
