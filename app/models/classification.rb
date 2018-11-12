class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  # ::my_all
  #   returns all classifications (FAILED - 1)
  def self.my_all
    Classification.all
  end


  # longest
  #   returns the classifications for the longest boat (FAILED - 2)
  def self.longest
    Boat.longest.classifications
  end
end
