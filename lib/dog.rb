class Dog
  attr_accessor :leash, :plastic_bag, :walking, :vet
  attr_reader :name, :breed, :owner

  def initialize(name, breed, owner_name)
    @name = name
    @breed = breed
    self.owner = owner_name
    @leash = false
    @plastic_bag = false
    @walking = false
    @vet_checkup = false
  end

  def owner=(owner)
    @owner = Owner.find_or_create_by_name owner
    @owner.dog = self
  end

  def bark
    "Woof!"
  end
end
