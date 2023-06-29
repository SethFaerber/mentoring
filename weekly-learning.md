# Weekly Learning
This documents the main things I learned this week.
- "Confidence" means that I moved into a deeper understanding and consistent implementation in an area.
- "Awareness" means I have an understanding of this topic, but am not fully practiced in it.


## Current Week: June 26 - 30

*Accelerated Learning Methods*
1. Working Ramsey my pace (solo, pair as needed) 
2. Make a problem to work on (personal project, patterns)
3. Hackerrank
4. Teach / Present

*Slower Pace*
5. Reflecting
6. Shadow (watch)
7. Researching
- Priorities
  - Seth best serves the team by learning code.
  - Sniper metaphor from Eli (Don't leave the rooftop)
- Language
  - C# constructor is a method named after the class
  - Generic type parameters `class Inventory<T>` allows your class to receive a variety
  of objects of any kind. The type is specified at (compile time???).
  - `List<T>` is a generic class which is a collection of elements of various types.
  It offers handy methods like `Add`, `Remove`, `Sort` and also implements some interfaces
  like `IEnumerable<T>`, `ICollection<T>`, and `IList<T>`.
  - Pascal case for method and class names. Camel for parameters and variables.
- Process
  - Tech Design EVERY PROBLEM before sitting down to code.
  - Diagram
- Pattern
  - [Lots of Learning Here](https://github.com/lampo/ramsey-plus-budget-app/pull/2479/files)
    - More than I can recall...and it's not zen right now.
    - 

## June 5 - 9
- Team
  - We need to spend more time together doing:
    - Decomp
    - Talking about state management in Xamarin
- Data
  - Access local storage and reset it: https://github.com/lampo/ramsey-plus-learn-app/pull/2078/files
- Environment
  - Download new Xcode version (cuz emulator was messed up)
  - Point IDE to Xcode and point Xcode to a correct version of its own app.
- Xamarin
  - Recognize and distinguish View and ViewModel code and articulate the purpose for each. Articulate a code-behind.

## May 30 - June 2
- Maui
  - Front end library stuff
  - Data Binding in XAML can two-way (view<->model) or one way (view<-model), but Maui can detect this so it doesn't need to be manually set.
  - Network calls.
  - Platform APIs (battery, notifications, keyboard)
  - Navigation using the Shell
  - `ResourceDictionary` and `SetterProperty` make styling standard across the app.
  - `OnPlatform` can assign custom styles based on the platform it is implemented on.
- A bunch of other minutiae that that I didn't capture (especially about setting up a machine and an IDE).

## May 22 - 26
- Dev environment
  - It's important to document dev env setup.
- Design Patterns
  - Confidently evaluate the implementation of a Decorator pattern.
  - Confidently whiteboard a Decorator pattern.
  - Confidently refactor a decorator pattern.

## May 15 - 19

- Design Patterns
  - Confidently explain 
- Languages
  - Awareness of some of C#'s distinguishing characteristics
    - Strongly typed language
    - OOP
    - .Net is a framework which can compile many different languages (including and primarily C#) for use on a variety of platforms such as Windows, Linux, and MacOS)
    - overflow as an issue
    - variables can be set inside a function and passed back up through the argument and used outside a the function
```
static void ReturnVariable(int parameter, out int variable)
{
  variable = parameter + 100
}

static void Call()
{
  int variable;
  ReturnVariable(900, variable)
  Console.Write("variable is now {0}", variable)
}

Call() => variable is now 1,000
```
  Even though `ReturnVarialbe` is `void` (meaning it returns nothing),
  the variable can be set within itself and is passed back out.


## May 8 - 12
- Testing
  - Confidently find existing stubs and apply them as needed. _Hello_ `stub_debt_snowball`.
  - Confidently explain that stubs allow us to fake a response from an external API. 
  - Confidently use and explain what Capybara allows us to do (simulate a user interacting with a rendered component)
  - Confidently get annoyed with Capybara not providing a way to see why a `.has_text` test failed 😆
    - Throwing in a `binding.pry` helps.
  - Confidently interact with features hidden behind flags and 1:1 Coaching.
    - Enable/disable proper flag
    - `app/models/product_variant/base.rb`
      ```
      def can_access_one_on_one_coaching?
        # !!Current.coaching_organization.max_bookings.nonzero?
        true
      end
      ```
- Design Patterns
  - Awareness of how a decorator adds functionality to an object by wrapping it to dynamically add methods.
  - Confidently know why our Baby Steps need to have a decorator build them! It helps to smooth out the nasties in our monkey patch.
- Refactoring
  - Confidently identify the need for a refactor of our `BabyStepGoalDecorator` and propose a feasible solution.

## May 1 - 5
- Data
  - Awareness of how to sus-out the data I need using existing features.
  - Awareness that sometimes objects contain methods that aren't easy to find. 
  - Factory to build our BabyStep classes out into their own thing.
- Testing
  - Confidently articulate Arrange, Act, Assert
  - Awareness of how and why to stub data for network calls.
  - Awareness of different [RSpec expectations](https://github.com/rspec/rspec-expectations) 
- OOP
  - Awareness that Ruby's seemingly "typed" language is actually a facade. Exampe, `String` type is actually just a class that can be modified like any other.
  - Awareness that this means, our Ruby apps are essentially programming languages in themselves.
- Patterns
  - Monkey Patch. We bring an SDK/gem in, but redefine some of its methods in our app. Sharp knives...generally a bad idea. Best idea is to patch the SDK and bump the version so all the world can share.


## April 24 - 28
- Design Patterns
  - Confidently use and explain Strategy Pattern: [Two examples I wrote here](https://github.com/SethFaerber/mentoring/blob/main/design-patterns/strategy_pattern.rb).
  - Confidently use and explain Singleton Pattern: [Two examples I wrote here](https://github.com/SethFaerber/mentoring/blob/main/design-patterns/singleton_pattern.rb).
  - Awareness of `super` keyword: [Example I wrote here](https://github.com/SethFaerber/mentoring/blob/main/design-patterns/super.rb).
- Styling
  - Confidently use new RDS Components (Link, Grid, etc.)
- Data
  - Confidently include and use helpers where needed `BabyStepsHelper` for example.
  - Awareness of using named parameters, and doing API calls in the instantiation.
    - `<%= render(Dashboard::BabyStepProgressCardComponent.new(baby_step: Api::BabyStep.current, goal: "76")) %>`
  - `object&.method` just in case the method returns `nil`.
  - Awareness of `delegate` concept
  - Awareness of `RequestStore` gem
- Git
  - Awareness of the concept of `checkout` to revert files I don't want changed in my PRs such as `db/schema.rb`.

## April 17 - 21
- Git
  - Awareness of dealing with merge conflicts
  - Awareness of `git` best practices
    - Create Draft PR right away
      - Gives visibility to your changes
    - Rebase early and often to avoid merge conflicts
      - `git fetch` to grab remote changes
      - `git rebase origin/master` to set my local branch at the head.
    - Squash commits into a single PR
      - `git rebase -i HEAD~number_of_commits_plus_one` `-i` opens IDE to edit commits. `f` to squash a commit into another. `r` ???
      - `git rebase --continue` if needed
      - `git push --force` to force the newly squshed local commit to overwrite the remote.
- Migrations
  - Confidently create release flag and accompanying `features.yml` (which automatically sets up flags for new devs)
- Testing
  - Awareness of mocking Api calls in tests.
- Design Patterns
  - Confidently articulate the purpose and use cases for Factory Pattern
  - Awareness of how to build a factory pattern
  - Awareness of factory patterns in S$ app
- Oddity
  - `.presence` returns an object or `nil`.
  - Assignment operator `=` can be used in an `if` conditional to assign or else evaluate falsy.
  - Combine these two
    - `if (object = other_object.presence) { object }` returns the newly assigned object or else evaluates falsy.

## April 10 - 14
- Styling
  - Confidently use RDS Design Tokens for Styling
  - Confidently add a new `.scss` file and IMPORT IT 😅
- Data
  - Confidently add dynamic data to YML text.
  - Confidently find user data I'm looking for like `User.current_user.created_at`
- Git
  - Confidently know that merge conflicts suck 😮‍💨
  - Awareness of git workflow with multiple people working on similar files simultaneously.

## April 3 - 7
- Active Record
  - Confidently use Rails Console to interact with Active Record.
  - Confidently write Active Record queries to create and associate records.
  - Confidently seed database.
  - Awareness of `has_and_belongs_to_many` association ( like students to teachers)
  - Awareness of writing migrations to assocaite models with each other.
  - Awareness of rolling back a migration when a mistake is made `rails db:rollback`
- RDS
  - Confidently install RDS gems.
  - Awareness of using installed RDS Components in our app.
  - Awareness: Hunted down and joined RDS Teams channel and reached out to Grant for assistance.
- Documentation
  - Confidently add to documentation in other repos (RDS docs PR: https://github.com/lampo/ramsey-design-system-documentation/pull/480)
  - Awareness of how to find docs in various repos.

## May 27 - 31

- Version Control:
  - Confidently clone, branch, checkout, commit, and merge in other repos.
  - Awareness of git cherry-pick and how it could have helped me with a broken branch.
- Dependencies
  - Confidently find and follow documentation on migrating dependencies.
  - Confidently yarn remove/add @version
  - Confidently test as I go... yarn test/build/start
  - Confidently determine if a dependency is a "dependency" or a "devDependency"
  - Awareness of debugging problems
    - Reading error logs
    - Finding solutions online and implementing them
    - Reverting versions
- PRs
  - Confidently make small PRs (learned this the hard way).
  - Awareness of commenting head-tilts
  - Awareness of responding to comments in a helpful way
  - Merging
- Pipeline
  - Awareness of some the tools the pipeline uses to check the code (linters)
  - Awareness that we use our own inhouse linters (@ramseyinhouse)...and they are out of date ;)
