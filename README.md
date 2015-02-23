---
  tags: todo, tdd, refactoring
  languages: ruby
  resources: 1
---

# Refactoring Ruby

## Instructions

- Read why refactoring is important in the README below!
- Review the `lib/dog.rb` file.
- Refactor the commented logic in the `lib/dog.rb` file, and make the RSpec tests pass!
- Ensure that the `:run` method is called on the Owner class in `config/environment.rb`.

## Why is Refactoring Important?

Our biggest priority when writing a method, an application, or any piece of software is simply to get it working. Once we have our code working, then our next priority is to improve and optimize our code that its behavior is well-intentioned and designed. Ultimately we refactor our code in order to improve its quality, clarity, and maintainability. 

## When Should You Refactor?

Let's think about refactoring in the context of the Dog class we have available in `./lib/dog.rb`. You'll notice that a lot of the methods, such as `walk(owner)`, `vet_checkup(owner)`, and `remove_leash(owner)`, have a dependency on an owner parameter. This should give us a clue that there should be an `Owner` class in which these methods are present. Logically, this is problematic because the `Dog` class should not have all of this responsibility of handling methods that should belong to an `Owner` class, so we need to decouple the logic of those three methods into a separate `Owner` class. 

## Refactoring Paradigms to keep in mind

There are 3 paradigms that we want to keep in mind as we are refactoring this code: Single Responsibility Principle, Separation of Concerns, and DRY.

### Single Responsibility Principle

Single responsibility, as Sandi Metz puts it, is when a class or method does the smallest possible thing. To further break this down, this means that each class or method accomplishes one primary action or result. This principle helps to keep your logic more flexible and intuitive.

### Separation of Concerns

Methods and, to some extent, classes should focus on doing one thing. This falls in line with the above concept. Build smaller methods, and use them in order to help out other methods that serve as some sort of functionality. Case in point, let's see the following example:

```ruby
def walk_dog(owner)
  owner.get_plastic_bag
  owner.attach_leash_to(owner.dog)
  owner.walk_outside
end
```

This looks like there is too much going on in the `walk_dog(owner)` method. The `walk_dog(owner)` method looks like it has 2 responsibilities here; preparing the dog for the walk, and actually taking the dog on the walk. We should perhaps abstract out the preparation logic (which includes obtaining the leash, getting the plastic bag, and attaching the dog to a leash) into another method. Now, let's look at the revised logic below:

```ruby
def prepare_for_walk(owner)
  owner.get_plastic_bag
  owner.attach_leash_to(owner.dog)
end

def walk_dog(owner)
  prepare_for_walk(owner)
  owner.walk_outside
end
```

The logic has now been refactored into their appropriate methods. 

### Don't Repeat Yourself (DRY)

This simply means that in order to avoid repetition, we need to further abstract out logic. If you have a few methods that accomplish something similar, consolidate the repetitive logic. Instead of repeating the same bit of code to meet your needs, have a method that accepts arguments and passes those arguments into the logic in order to account for variability. This helps tremendously if you need to make changes to that logic. Instead of having to make that change in many different methods, you only need to change it in one place.

## Resources
- [Extracting a Method into a Class](http://www.integralist.co.uk/posts/refactoring-techniques.html#16)
