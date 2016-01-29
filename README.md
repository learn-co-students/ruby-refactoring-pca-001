# Refactoring Ruby

## Objectives

1. Review basic design principles of object oriented Ruby. 
2. Be inspired by the idea of programming as storytelling. 
3. Use basic design principles to refactor some smelly code. 

## Introduction

In a previous unit, we read about some of the basic design principles of object oriented Ruby. And, throughout the previous several units, we've been guided by these principles as we construct classes and methods. This lesson will constitute a deeper look at some of those design principles as you attempt to implement them on your own refactoring adventure. 

### Why Refactor? 

Another title for this section might be: ***What's So Great About Clean Code?***

So, what is so great about clean code? Clean code means three things for your program: quality, clarity and maintainability. Clean code is code whose intention and behavior is immediately apparent to other developers. That means that it can be maintained by any number of people and will survive into the future, instead of dying when it's creator moves on to another project. Clean code survives into the future because it accommodates change and growth. Above all, though, clean code is a pleasure to write and a pleasure to work with. It is something that its author can take pride in and something that encourages other programmers to dive into and make even better. 

Beyond that, clean code tells a story. 

> Master programmers think of systems as stories to be told rather than programs to be written. They use the facilities of their chosen programming language to construct a much richer and more expressive language that can be used to tell that story...never forget that your real goal is to tell the story.
> 
>    ––[Uncle Bob](https://sites.google.com/site/unclebobconsultingllc/), co-creator of Agile Software Development from Extreme Programming



If all of these practical reasons don't convince you of the benefits of refactoring, think about it like this: 

Your program is a puzzle. It is your job as a programmer to fit all of the moving parts of your application together in the *best way possible*. Sure, there are rules and principles defining what is "best", regardless, however, your job is to strive to arrange those puzzle pieces in the most elegant, most logical structure possible. If you were building a house, would you be satisfied with a house that will fall down?

<span style="margin-left: 25%">
![](http://readme-pics.s3.amazonaws.com/imgres.jpg)
<span>

Or a weird house that doesn't make any sense that no one would want to move into? (except that guy, apparently)

<span style="margin-left: 25%">
![](http://readme-pics.s3.amazonaws.com/images.jpg)
</span>

Or, would you strive to build a sturdy, beautiful structure, like this one that maybe a queen lives in:

![](http://readme-pics.s3.amazonaws.com/5445382446_17ec52426e_o.jpg)

That being said, our priority is always to *make it work*. That's the sentiment behind the **"make it work, make it right, make it fast"** credo. First, write code that solves the problem, that works the way you want it to, no matter how poorly organized or designed it might be. Then, re-design it! Make it right. Finally, make your code more efficient. Never hold back from writing code because you're not sure how to make it perfect. We're beginners! Our code is probably really gross, and that's okay. The more we practice, the more we are exposed to these design principles and the more we work with and learn from others, the better quality code we will produce. 

## Instructions

- Read why refactoring is important in the README below!
- Review the `lib/dog.rb` file.
- Refactor the commented logic in the `lib/dog.rb` file, and make the Learn tests pass!
- Ensure that the `:run` method is called on the Owner class in `config/environment.rb`.


### When Should You Refactor?

In the past, we discussed three of the basic principles of object oriented design: 

* Separation of Concerns
* Single Responsibility Princple
* DRY

The move we discuss them and the more we practice implementing them, you'll start to notice "code smells"––code that violates these (and other principles). 

Here are a few things to look out for:

* Methods that carry out for more than one task
* Methods that rely on more than one or two helper methods
* Methods that are very long
* Methods that take in too many arguments
* Methods that carry out jobs that are beyond the scope of the class. 

## Instructions

Follow along with the guidelines below to help you get the tests passing. We'll be identifying code smells together and you'll be carrying out the appropriate refactors. 

### Code Smell 1: Separation of Concerns
Open up `lib/dog.rb` and checkout the `walk(owner)` and `vet_checkup(owner)`. Notice that these two methods have a dependency on an "owner" argument. Think about the desired behavior of these methods. Are going for a walk and being taken to the vet a *dog's* responsibility? Unless we're dealing with a very exceptional dog or a very negligent owner, I don't think so. This is a code smell. These two methods are carrying out actions that are *not* the responsibility of the class to which they belong. They are the responsibility of a dog's owner. So, let's make an `Owner` class and refactor the above-mentioned two methods into instance methods of the `Owner` class. 

* First, define an `initialize` method for the `Owner` class. An `Owner` instance should instantiate with a name. Owner also needs an `attr_accessor` for name. 
* Look at the initialize method of the `Dog` class. Looks like  `Dog` instances expect to initialize with a string that is the owner's name. We know, however, that dogs and owners need to be associated with one another. When a dog get instantiated, therefore, it should take that owner's name and use it to: 
  * make a new instance of the  `Owner` class
  * Set that owner's `.dog=` property to the dog that is being instantiated. 
  * That means that `Owner` needs an `attr_accessor` for `dog`! 
* Run the test suite to make sure you are passing the tests regarding instantiating dogs and owners. 
* Now, go ahead and comment out the `vet_checkup` and `walk` methods from the `Dog` class. Copy and paste them into the `Owner` class. Refactor them so that they can be called on an `Owner`. Take away their arguments (they don't need to take in an owner as an argument if they are being called on an instance of the `Owner` class). Change the `owner` references inside the methods to `self`. 

### Code Smell 2: Single Responsibility Principle and DRY

Now that we have an `Owner` class that produces owner objects that walk dogs and take them to the vet, let's take a closer look at those methods: 

```ruby
# lib/owner.rb

 def walk
    self.dog.leash = true
    self.dog.plastic_bag = true
    self.dog.walking = true
  end

  def vet_checkup 
    self.dog.leash = true
    self.dog.plastic_bag = true
    self.dog.vet_checkup = true
  end
```

Notice that both methods utilize the following two lines: 

```ruby
self.dog.leash = true
self.dog.plastic_bag = true
```

First of all, this violates our DRY (Don't Repeat Yourself) principle. Second of all, it violate our separation of concerns principle: putting on a leash and grabbing a plastic bag are slightly beyond the scope of `walk` and `vet_checkup`. The `walk` method should *only handle walking* and the `vet_checkup` method should *only handle getting to the vet. Let's refactor! We shouldabstract out the preparation logic (which includes obtaining the leash, getting the plastic bag, and attaching the dog to a leash) into another method. 

* Build a method, `prepare_items`. that sets a dog's `.leash` and `.plastic_bag` attributes to `true`. 

Abstracting away the repetition helps tremendously when you need to make changes to the abstracted logic. Instead of having to make that change in many different methods, you only need to change it in one place.


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

#### Before you go!

Run the test suite and make sure that all tests are passing! If you're not seeing all green, use the test output to help you debug. 
 

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/ruby-refactoring' title='Refactoring Ruby'>Refactoring Ruby</a> on Learn.co and start learning to code for free.</p>
