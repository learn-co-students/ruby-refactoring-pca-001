class Dog
  attr_reader :name, :breed, :owner_name
  attr_accessor :leash, :plastic_bag, :walking, :vet, :owner

  def initialize(name, breed, owner_name)
    @name = name
    @breed = breed
    @owner = Owner.new
    @owner.name = owner_name
    @owner.dog = self
    @leash = false
    @plastic_bag = false
    @walking = false
    @vet_checkup = false
  end

  def bark
    "Woof!"
  end
end
