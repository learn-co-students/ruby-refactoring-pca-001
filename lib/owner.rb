class Owner
  attr_accessor :dog
  attr_reader :name
  @all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  class << self
    attr_accessor :all
  end

  def walk
    prepare_items
    dog.walking = true
  end

  def vet_checkup
    prepare_items
    dog.vet = true
  end

  def prepare_items
    dog.leash = true
    dog.plastic_bag = true
  end

  def self.find_by_name(name)
    all.find { |owner| owner.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || new(name)
  end
end
