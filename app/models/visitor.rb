class Visitor < ActiveRecord::Base
  belongs_to :url
  attr_accessible :ip, :location
end
