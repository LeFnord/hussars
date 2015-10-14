class Horse < ActiveRecord::Base
  belongs_to :hussar

  def href
    "/api/v1/#{self.name}/#{id}"
  end
end
