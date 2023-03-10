# Topics for Discussion

## Quality in our app
Some areas of the app are so complex, that it seems to me like bad design. 
I want to know if I'm just too green to get it, or if it is a reflection of some bad pattern.

Example: Adding rows/columns to the database
- What is the quality of the code in our app?
- [TDD Harms Architecture](http://blog.cleancoder.com/uncle-bob/2017/03/03/TDD-Harms-Architecture.html) by Uncle Bob.
- What are some of the concerning things about its architecture?
- What are some patterns that you want me to shut my eyes over?


## How to Think About Testing for Hackerrank
I'm not sure how to get started building tests when I do something like Hackerrank.
- Should I start with really simple methods and test each method as I go?
- Let's look at kangaroo.rb
- Dependency Injection? How to write unit tests when they all depend on each other?

## Set up Ruby 2.0
99 Bottles of OOP uses Ruby 2.0. Walk me through setting up a separate version on my machine.

## Metz Talk
I don't understand what she means by dependency injection
- Injection and injecting dependencies. [here](https://youtu.be/v-2yFMzxqwU?list=PLqal2KPbpmUwQurG_ixyT9pAHcesUjvJ5&t=2223).
- "Injecting dependencies" as opposed to what? What's the non-example?
- Are there areas in our app where we do or do not do this?
- "TDD and DRY are training wheels to get to true SOLID design principles"
- What are "interfaces?" @ about the 45:00 mark
- @ 44:12 "There's a tension between having incredibly straightforward procedural code and well-factored abstractions. Well-factored abstractions are what's easy to use."

## TDD
I'm committing to solve Hackerrank problems using a TDD approach. I'll need some advice.
 - I have some red flags about it.
   - Won't it lead to procedural coding?
   - Won't it limit global thinking when brainstorming solutions?
 - How do I set up instance variables for use in the tests?

## Git Learning
 - Don't make a ticket pullable until all commits are in a single 

## Random Topics
Extraneous topics to cover whenever we have time.
 - Rails engine. What is it and why.
 - Loggly
 - Apophenia
 - AuthX vs Auth0
 - Nokogiri
 - New Relic
 - Task Engine
 - TaskAPI
 - Segment
 - self
 - method_name! safe/unsafe "!" = semantic "this method is able to raise an error." Can be dangreous
 - define_singleton_method

## Learned
These are things from this list that I've resolved on my own. Double check with Luke to make sure I have a good understanding.
### Singleton Class
 - [Read about it here](https://medium.com/@leo_hetsch/demystifying-singleton-classes-in-ruby-caf3fa4c9d91)
 - Allows you to assign new methods to different instances of objects.
 - Singleton can assign methods to an instantiated object, then another method to a different instantiated object.
 - class << self creates class methods rather than instance methods. These class methods can be called without needing to instantiate an object first. 
### Accessors & Private
 - You can get around an attr accessor by using public methods which change the properties within them. It's important to set methods to private so that isn't exposed.