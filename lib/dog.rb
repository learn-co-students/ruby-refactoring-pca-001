class Dog
	attr_accessor :leash, :plastic_bag, :walking, :vet

	def initialize(name, breed, owner_name)
		@name = name
		@breed = breed
		@leash = false
		@plastic_bag = false
		@walking = false
		@vet = false
		@owner = Owner.new(owner_name, self)
	end

	def name
		@name
	end

	def bark
		"Woof!"
	end

	def breed
		@breed
	end

	def owner
		@owner
	end

	# Methods that are no longer needed, and have been abstracted out to owner class.

	def walking?(owner)
		owner.dog.walking
	end

	def vet_checkup?(owner)
		owner.dog.vet
	end

	def walk(owner)
		owner.dog.leash = true
		owner.dog.plastic_bag = true
		owner.dog.walking = true
	end

	def vet_checkup(owner)
		owner.dog.leash = true
		owner.dog.plastic_bag = true
		owner.dog.vet = true
	end
end
