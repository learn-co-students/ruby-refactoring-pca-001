class Dog
	attr_accessor :leash, :plastic_bag, :walking, :vet_checkup

	def initialize(name, breed, owner_name)
		@name = name
		@breed = breed
		@leash = false
		@plastic_bag = false
		@walking = false
		@vet_checkup = false
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

	def walking?(owner)
		owner.dog.walking
	end

	def vet_checkup?(owner)
		owner.dog.vet_checkup
	end

	def walk(owner)
		owner.dog.leash = true
		owner.dog.plastic_bag = true
		owner.dog.walking = true
	end

	def vet_checkup(owner)
		owner.dog.leash = true
		owner.dog.plastic_bag = true
		owner.dog.vet_checkup = true
	end

	def return_home(owner)
		owner.dog.leash = false
		owner.dog.plastic_bag = false
		if owner.dog.walking
			owner.dog.walking = false
		else
			owner.dog.vet_checkup = false
		end
	end
end
