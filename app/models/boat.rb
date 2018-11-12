class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    Boat.limit(5)
  end

  # ::dinghy
  #   returns boats shorter than 20 feet (FAILED - 1)
  def self.dinghy
    Boat.where("length < 20")
  end

  # ::ship
  #   returns boats 20 feet or longer (FAILED - 2)
  def self.ship
    Boat.where("length > 20")
  end

  # ::last_three_alphabetically
  #   returns last three boats in alphabetical order (FAILED - 3)
  def self.last_three_alphabetically
    Boat.all.order(name: :desc).limit(3)
  end


  # ::without_a_captain
  #   returns boats without a captain (FAILED - 4)
  def self.without_a_captain
    Boat.where(captain_id: nil)
  end


  # ::sailboats
  #   returns all boats that are sailboats (FAILED - 5)
  def self.sailboats
    Boat.includes(:classifications).where(classifications: {name: "Sailboat"})
  end


  # ::with_three_classifications
  #   returns boats with three classifications (FAILED - 6)
  def self.with_three_classifications
    Boat.joins(:classifications).group("boats.id").having("COUNT(*) = 3").select("boats")
  end

  def self.longest
    Boat.order("length DESC").first
  end

end
