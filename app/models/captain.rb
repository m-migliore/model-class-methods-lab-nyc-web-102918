class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    Captain.includes(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  # ::sailors
  #   returns captains with sailboats (FAILED - 1)
  def self.sailors
    Captain.includes(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq
  end

  def self.motorboaters
    Captain.includes(boats: :classifications).where(classifications: {name: "Motorboat"}).uniq
  end

  # ::talented_seafarers
  #   returns captains of motorboats and sailboats (FAILED - 2)
  def self.talented_seafarers
    Captain.where(id: self.sailors.pluck(:id) & self.motorboaters.pluck(:id))
  end


  # ::non_sailors
  #   returns people who are not captains of sailboats (FAILED - 3)
  def self.non_sailors
    Captain.where.not(id: self.sailors.pluck(:id))
  end

end
