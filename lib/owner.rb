class Owner
	attr_accessor :name, :dog

	def initialize(name, dog)
		@name = name
		@dog = dog
	end

	def walk(dog)
		prepare_items_for(dog)
		dog.walking = true
	end

	def prepare_items_for(dog)
		dog.leash = true
		dog.plastic_bag = true
	end
end
