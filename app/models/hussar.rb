class Hussar < ActiveRecord::Base
  has_many :horses

  def href
    "/api/v1/#{self.name}/#{id}"
  end
end
