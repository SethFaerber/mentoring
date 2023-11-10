# Weekly Learning
This documents the main things I learned this week.
- "Confidence" means that I moved into a deeper understanding and consistent implementation in an area.
- "Awareness" means I have an understanding of this topic, but am not fully practiced in it.

## Current Week: November 6 - 10
- Xamarin
  - Custom Controls
    - Built two custom controls. One more complex than the other.
    - XAML supplies a value to `Animal` like `Animal="Frog"`, and they get a card with the name and animal image.

![img_2.png](img_2.png)
![img_3.png](img_3.png)
```csharp
namespace xammy
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AnimalControl
    {
        public static readonly BindableProperty AnimalProperty = BindableProperty.Create(
            nameof(Animal),
            typeof(string),
            typeof(AnimalControl),
            string.Empty
        );
        
        public static readonly BindableProperty AnimalUriProperty = BindableProperty.Create(
            nameof(AnimalUri),
            typeof(string),
            typeof(AnimalControl),
            string.Empty
        );
        
        public string Animal
        {
            get
            {
                switch ((string)this.GetValue(AnimalProperty))
                {
                    case "Frog":
                    {
                        this.SetValue(AnimalUriProperty,
                            "https://i.etsystatic.com/isla/910f97/34229353/isla_fullxfull.34229353_lywq3bgq.jpg?version=0");
                    }
                        break;
                    case "Cat":
                    {
                        this.SetValue(AnimalUriProperty,
                            "https://www.dailypaws.com/thmb/nwNtJnMRSJ33nbdzrdsRwSJHMfU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/anime-cat-names-1204854078-2000-d34f509ae54943d8b78cfb4bf9ba0678.jpg");
                    }
                        break;
                    default:
                    {
                        return null;
                    }
                        break;
                }
                return (string)this.GetValue(AnimalProperty);
            }
            set
            {
                this.SetValue(AnimalProperty, value);
            }
        }

        public string AnimalUri
        {
            get => (string)this.GetValue(AnimalUriProperty);
            set => this.SetValue(AnimalUriProperty, value);
        }
        
        public AnimalControl()
        {
            InitializeComponent();
        }
    }
}
```
  - This is NOT the ideal solution because `AnimalUri` is publicly exposed. There are ways around this supplied by Xamarin,
but I didn't get them working.

- MVVM
  - The video player does not need a model. A model exists as a store or state holder for whatever uses it.
  The video player does not need this because whatever Model (AdvertisingVideo, TutorialVideo, VideoModality)
  is associated with the video player already has its own model. The video player just needs to read and populate
  a couple things from those models, then set its own properties like Uri to play the video).
  - `BindableProperty` allows you to create your own properties. ~~It's very "library-ish."~~ ACTUALLY, the pattern
  is firmly set in creating a custom control in Xamarin. Even `Button` elements have `BindableProperty` properties.
  - `base` allows you to call a method or access a property from a base class.
- Build
  - Local build was bugged in xammarin. I had to delete the `bin` and `obj` folders in the project directory. These
  folders can hold onto old build data which can cause problems.
- Progress Bar
```csharp
protected override void OnPropertyChanged(string propertyName = null)
    {
      if (
        propertyName == TotalProgressProperty.PropertyName
        || propertyName == CurrentProgressProperty.PropertyName
      )
      {
        base.OnPropertyChanged(nameof(this.Progress));
      }

      base.OnPropertyChanged(propertyName);
    }

    public double Progress =>
      this.TotalProgress == 0 ? 0d : (double)this.CurrentProgress / this.TotalProgress;
```
- CSharp
  - Casting: `(int)someDouble` will cast a double to an int. Type coercion is different because it happens automatically like in JavaScript
    ("32" * 2 = 64).
  ```csharp
      public bool IsProgressVisible
    {
      get => (bool)this.GetValue(IsProgressVisibleProperty);
      set => this.SetValue(IsProgressVisibleProperty, value);
    } 
  ```
    - Here, `(bool)` is cast because the property may actually be `null`.

### October 30 - November 3
- Thinking
  - Bloom's Higher Order Thinking
    - Synthesize - Solved a need I had by writing a terminal script. "Synthesizing" (Bloom's) serval concepts and tools into something new and effective!
    - Evaluate - Quickly identified the major challenges of pulling a chunk of code out of our app. "Evaluate" on Bloom's.
    - Understand - Got to "tour" pipeline optimization, extracting a video player to make a sharable package, debugging java tests. "Understand" on Bloom's.
  - Types of Questions I asked myself this week
    - "There hast to be a better way to do this. What tools do I have that might solve this? How can I combine those tools in novel ways to solve this."
    - "This code has a purpose. Where is it doing something that is extraneous to its purpose? How can I separate those concerns to create an optimally portable product.
    What is the tradeoff for refactoring this? Does the refactor introduce more complexity than it solves? Who has better 
    insight into this complexity problem and can speak to it."
- Command Line
  - grep and pipe
    - `grep` searches for a string in a file. `grep "string" .` searches recursively in the current directory.
    - `|` pipes the output of one command into the input of another. `grep "string" . | grep "another string"` 
    - use case: `git branch | grep "string"` to find a branch with a particular string in it.
  - Came up with a cool cd/search alias thingy. Below is the code for zshrc file
```
function cdfind() {
    local results
    results=($(ls -d *$1* 2>/dev/null))

    if [ ${#results[@]} -eq 0 ]; then
        echo "No matching directories found."
    elif [ ${#results[@]} -eq 1 ]; then
        cd "${results}"
    else
        PS3="Select a directory: "
        select dir in "${results[@]}"; do
            if [ -n "$dir" ]; then
                cd "$dir"
                break
            else
                echo "Invalid selection."
            fi
        done
    fi
}

alias cdfind='cdfind'
```
Result:
![img_1.png](img_1.png)

- Pipelines
  - No need to lint in QA since that's done in our PR pipeline.
  - Android typically packages with APK, but we are using AAB which is a newer format. Faster and adds features like Quick Install.
  - Our QA pipeline takes about 40 mins to build which means QA has to wait around for something to test. Optimizing this is important.
  One approach is to build a stripped down essentials-only version for QA, the when it's approved roll it up to a pre-prod build.
  - Mobile apps require a full application build to deploy. This is different from web apps which can be deployed in pieces.
- Testing
  - You don't write tests for packages you're working with unless you want to see how they work to ensure everything goes the way you think it should.
  Then you should probably remove the tests.
- Big O Awareness: How efficient an algo is. It refers only to the biggest, most complex factor in the algo.
For example: 3x^2 + 5x + 3. Big O is O(n^2) because the x^2 is the biggest factor.
  - Bubble Sort
    - Compares pairs of neighboring entries and moves them down toward the right. Then iterates again, and again all the 
    way through until no more swaps can be made meaning the list is sorted.
  - Insertion Sort
    - Begins with an array of one entry which means it is sorted. Looks at the next item and compares it to the array 
    right-most first and inserts it into place.
  - Merge Sort
    - All items are pulled into arrays containing a single item, then they at stitched back together in order.
    This helps with the worst case scenario where the starting array is in half disorder to reverse order. JavaScript.sort
    uses merge sort under the hood.
  - Quick Sort
    - A pivot (final item) is chosen. Remaining items are split in the middle to two arrays.
  - Radix Sort
    - Sorts by the least significant digit first, then the next, and so on (ones place then tens and so on). Never compares
    any item to any other item.
  - Binary Search
    - For a sorted array, split down the middle. Check left and right then split again.

## October 16-20
- Debugging
  - Successfully finding the zone a bug might be by thinking about it.
- Cross-team collaboration
  - Connecting with Av shed light on problems I was dealing with.
- Strong vs. Dynamic type
  - I ran into some bugs this week that had to do with C#'s strong typing. I see how important it is for a language to require strong typing.
  However, I kept wondering if Ruby would have put me through worse pain or whether it would have been easier or harder to debug because of its dynamic nature.
  Jury is still out on this, but it really made me wonder. 🤔
- Work
  - Discovery on `created_at` date for users. I met with Av, and captured our best ways forward here: https://github.com/lampo/ramsey-plus-budget-app/issues/2826. We probably have to work with Jenny Lee on what she actually wants to show users and how committed we are to sorting that out.
  - Ceramics – Rebuild the BabyStepClient from scratch. Luke thought I could do this in 2 hours…and he was right much to my surprise! 😮  I got the core client together in 2 hours. I spent another 4 hours building a bare bones implementation and debugging my code…most of that 4 hours was watching my emulator reload. 😆
    - Branch here: https://github.com/lampo/ramsey-plus-budget-app/pull/2851
    - Tech Doc: https://github.com/lampo/ramsey-plus-budget-app/issues/2831

## October 9-13
- IDE things
  - Interactive rebasing opens a file which can be overwritten. It runs when saved and closed. Pick/drop/squash/rename.
  - I can get a commit back even after I've squashed it. Just `git reflog`, find the hash, and check it out. Came in very handy.
  - Using breakpoints in debugging can allow you to run code (didn't know that) as well as check the values of things.
  - In IDE, Git>Local History or Git>Git History are so valuable to see how a file has changed or evolved. Life saver.
- Shipping value
  - means a lot of different things in different contexts...
  - For FPU3.0, we want to ship a minimum viable product to the customer as soon as possible to prove value and get data.
    - Therefore, we just need a quickly built platform, slapped together without writing many tests, not refactoring code into a pristine design
    so that we can enable speed in tiny R&D wins. We don't expect our platform to be around for a very long time.  
    The consequence is that the larger the app gets and the more integrated our code becomes, things will start to go 
    wrong or become to unwieldy. That's an acceptable risk right now because we will not fully flesh out this code. Instead, 
    it is just enough to gain what we need for a more stable product.
  - In SmartDollar, we want to ship new finalized features as fast as possible in response to user feedback.
    - This means we want to take the time to make sure our platform is rock solid, so that we can build new features quickly.
    To make sure our platform is solid, there is always refactoring, tests, and documentation. We intend for our platform to
    be around for a very long time.

## October 2nd - 6th
- EveryDollar
  - Awareness of E$'s startup flow, how the singletons are initialized, and the order that clients are setup. Some cool patterns in there.
- OOP
  - In Ruby, attr_readers are about encapsulation. I didn't realize that its essentially wrapping the variable in a method.
  - Circular dependency is ugly. Not sure exactly how to fix it yet.
- Workflow
  - I really broke my rule and tried to quickly do something without understanding it first...trying to implement the client built
  without taking the time to figure out how the other clients are implemented. I should have taken the time to understand how they are 
  implemented, and then sit down with my mentor to discuss different approaches to get a quick win out of it.

## September 25-29
- C#
  - Constructor overloading: Set up multiple constructors for a class, each with different parameters. When you instantiate it, pick which parameters
  to pass, and it will instantiate with the correct constructor. A use-case for this is returning an object from a network call.
  The call might result in a successful response or an error. You can set up two constructors, for for success and one for error.
  - Partial Classes: Class definition is broken up into multiple files. Good for separating concerns.
- Confidence: Client Setup in EveryDollar ([GitHub design doc](https://github.com/lampo/ramsey-plus-budget-app/issues/2713))
  - [`dotnet-apiclient-base`](https://github.com/lampo/dotnet-apiclient-base/blob/master/README.md) is a library we use to shape up the HTTP requests and responses to/from APIs.
  - Client: `BabyStepClient` [Design Doc for this Feature](https://github.com/lampo/ramsey-plus-budget-app/issues/2737)
    - 🗣️ Builds the request using the `ApiClient` library. Creates at Task then implements `HttpRequestMessage` builder. Returns result using `result.ToResult()`.
    - ❓ Why does my intellisense not pick up `SendAsyc` and `ToResultAsync` from `ApiClient.Core`??? 
    **I hadn't defined the other partial for that class which inherits from `ApiClient`**
  - Interface: `IBabyStepClient`
    - 🗣️ Simply mandates that the Client is created with the HTTP request method which takes `CorrelationVector` and `CancellationToken` as parameters. 🖊️ The `UserFinalizeClient` takes in an Auth0Token and passes it the the URI ~which is what I need to do for UserProfileBasic.~ **Actually, I just need AXID, not auth token**
  - Shared: `BabyStepClient.shared` ???
    - 🗣️ This defines the other part of the `partial UserProfileBasicClient` class using the `ApiClient` helper methods. Seems like I need to use:
      - `BabyStepConfig` from my class
      - `IRetryPolicy` from `ApiClient` to attempt calls again if there are errors.
      - `IApiClientLogger` from `ApiClient`. Not sure what this does
      - `IUserAgentAttributesProvider` from `ApiClient`. Not sure what this does
      - `HttpMessageHandler` from `IDisposeable`.
      - `Func<string> jwtTokenProvider` not sure if this is needed, but it may be used to get through to a service that requires authorization.
  - Result: `UserProfileBasicResult`
    - 🗣️ Creates a Result object using constructor overloading which holds the success, status code, and data returned. ❓ Not sure how this is called or whether the resulting object is used as the primary data source.
  - Config: `BabyStepConfig`
    - 🗣️ A standardized configuration for setting hostname, port, default timeout properties.
- Learning Process
  - When churning, pick up a pen and write something or draw something. I think of it like checking the map of the problem.
    - Write down where you are, where you've been, and where you want to go.
    - Where you are: Write down what you know.
    - Where you've been: Write down what you've learned so far'.
    - Where you want to go: Write down the minimum requirements to get what you need or all questions you have about that place.

## September 18-22
- Removing Blockers
  - Given I am generically blocked...
    - Check low-level (typos, parameters, imports, logic)
    - Check mid-level (error logs, patterns, dependencies)
      - Look for info outside my IDE (docs, google, ChatGPT)
    - Reassess what I know and what questions I have (diagram, write, take a walk)
    - Explain the problem to a peer to get insight (not an answer) from a peer.
    - Learn what I need to learn to solve the problem.

## September 11-15
- Database
  - My db still needed the viewmodel as the go-between. In fact, I didn't really have to do much refactoring
  of the viewmodel at all. I just had to do a db call when newing up the Items object in the viewmodel.
  - The database may not be writing to disc which is why it looks like it loses data after rerunning the app after closing.
  - Found it! 

In the View:
```csharp
        private void AddItemToInventory(int selectedOptionIndex)
        {
            if (selectedOptionIndex > 0)
            {
                Item selectedItem = this.viewModel.Items.FirstOrDefault(item => item.Id == selectedOptionIndex);
                
                selectedItem.Status = Item.ItemStatus.Obtained;
                
                ItemsViewModel.UpdateItem(selectedItem);
            }
        }
```
In the ViewModel:
```csharp
        public async Task UpdateItem(Item item)
        {
            await Database.UpdateItem(item);
        }
```
In the `Database.cs` file:
```csharp
        public static async Task UpdateItem(Item item)
        {
            await InitializeDb();
            
            await dbConnection.UpdateAsync(item);
        }
```

## September 4-8
- Database
  - async will look for await and run them even if they are in an assignment statement.
    - `var id = await db.InsertAsync(briefcase);` the method will go to assign id, but runs into the `await`, so it runs the `await`, then comes back and finishes the assignment. So the 
  - Theres a real gap between my concept and the implementation in Xamarin. It's really convoluted compared to Javascript/React.
  - I'm also not able to take the basic implementation and turn it into something more complex yet.

## Aug 28 - Sept 1
- Database in XF app
  - Installing SQLite in project ~~SQLite.Net-PCL is compatible with Xamarin.iOS.~~ Nope. Needed `sqlite-net-pcl` instead.
  - Surprisingly, initializing the database on app load is smart. It will only initialize once, then ignore subsequent initializations (which would wipe the previous state of the database).
  - `Path.Combine` is a simple way to build a platform-agnostic path to the database.
  - `DependencyService.Get<ISQLite>()` is a way to build platform-specific paths to the database.
  - Dont install deprecated database packages. 😎
  - Not sure how to reference the database which is pretty perplexing.
- C#
  - Awareness: "interface" is like an archetype for a clas. It has "contracts" which are public methods and properties that must be implemented by any class which implements the interface.
  - Awareness: "contract" is a public method or property which must be implemented by any class which implements the interface. It's called a contract because it is a hard and fast rule which must be carried out for the class to be valid.
  - Confidence: Build a simple Interface.
- Xamarin.Forms
  - SafeArea is set on the page, not on a view... Component lifecycle makes this sticky.
  - Since SafeArea cannot be set on a view, I had the idea to read the dimensions of the SafeArea and pass it along to set the padding of the video to make it full screen.
  - With a CDN setup, we are serving our pages as HTML delivered from the database. Xamarin does not like to render images from URLs delivered by HTML. Need a workaround.
  

## August 21-25
- C#
  - Confidence: Creating a new page and wiring it up to a button click.
  - Confidence: Creating a new modal and wiring it up to a button click.
  - Confidence: Creating a new ViewModel and wiring it up to a page.
  - Confidence: Creating a new View and wiring it up to a ViewModel.
- Teamwork
  - Confidence: Break down problems in their essential and accidental complexity.
  - Awareness: Team cohesion and morale is just as important as the "What" concerns.
  - Awareness: Nailing down the language and terminology is incredibly important, but easy to overlook. I need to drive for clarity on language more.

## August 14-18
- Indexing Files 
  - You have to index files in the IDE if you drag/drop them into the folder manually.
- Xamarin
  - Confidence: Creating Click Events which lead to new pages and modals.
  - Confidence: turning on/off navigation bar and tab bar in the Shell.
  - Confidence: Connecting a ViewModel to a View with a BindingContext (supplied in the code behind).
  - Confidence: Various UI controls and their properties (Entry, Label, Button, Picker, Modal, etc.)

## August 7-11
- C
  - Learned how to build/compile in C. My key takeaways are in /c/c-learning.md
- Java
  - IntelliJ IDEA automatically sets up Maven.
  - Java reminds me of NodeJS.
- Postman
  - Sometimes you need an M2M token to access an endpoint. This is because the endpoint expects a machine like the BFF to access it
  rather than a user.
- every-dollar-mobile-bff
- ramsey-plus-smartmoney-api
  - an api which utilizes a database.
  - run a local database by running `docker-compose up` in the root directory. (Make sure Rancher is running first).
  - then run the api by hitting the debug button in IntelliJ.
  - In Postman
    - Generate a M2M (machine to machine) token.
    - Use that toke in the Authorization > Bearer Token field.
    - test the `/actuator/health` endpoint at `http://localhost:8080/ramsey-plus-smartmoney-api/actuator/health`
    - test the `/ready` endpoint at `http://localhost:8080/ramsey-plus-smartmoney-api/ready`

## July 31-August 4
- E$Mobile integration
  - E$Mobile does not use `<ControlTemplate>` which is really unfortunate. We use that in our testflight app everywhere.
  Essentially, it means we have to build custom `controls` instead of relying on Xamarin's built-in controls for everything.
  - E$Mobile's startup flow is UUUUUUUUGLY XD
    - It is a giant switch case statement with a bunch of `if` statements inside of it. It runs a page, the page
    sets itself complete at the end, then runs thru the switch statement again. And so on.
- Optimizely
  - You can only use a flag name once...so make it REALLY specific.
- Speak up!
  - Problems I see are mostly shared problems at this point.
- C#
  - Variable declarations in switch/case statements are scoped to the entire switch statement
    "magically" unless it is enclosed in a block.
```csharp
//Scoping to the entire switch statement

switch (someVariable)
{
    case 1:
        int x = 1;
        break;
    case 2:
        x = 2; // This looks up the declaration of x in case 1
        break;
}

// Narrowing the scope

switch (someVariable)
{
    case 1:
    {
    int x = 1;
    }
        break;
    case 2:
        x = 2; // This will break because x was scoped to case 1 only using a block
        break;
}
```

## July 24-28
- Over All Learning
  - Able to wire up a brand new View, Code Behind, and ViewModel in Xamarin.
  - Able to grasp 100% of View Layer in production code.
  - Able to grasp 85% of Code Behind in production code.
  - Able to conceptually grasp 90% of ViewModel in production code, and 50% of its detailed implementation (without diagrams).
    - *Recognizing that this ViewModel layer needs a diagram was a big win for me. I think it shows where I'm recognizing genuine complexity and identifying tools which can bring clarity*
- Xamarin
  - `AbsoluteLayout` was useful in centering an item between other elements without having to use a grid.
    ```xamarin
    <AbsoluteLayout VerticalOptions="FillAndExpand">
        <ffImageLoading:SvgCachedImage
            AbsoluteLayout.LayoutBounds="0.5, 0.5, 229, 229"
            AbsoluteLayout.LayoutFlags="PositionProportional"
            Source="resource://RamseyPlusApp.Resources.Images.bank-search.svg" />
    </AbsoluteLayout> 
    ```
  - `LayoutBountds` is "horizontalPositionPercentage, verticalPositionPercentage, horizontalSize, verticalSize"
- Ruby vs C#
  - Rails:
  ```ruby
  x = y = z = "howdy"
  
  puts x
  
  # => "howdy"
  ```
  - C#:
  ```csharp
  string x;
  string y;
  string z;
  
  x = y = z = "Howdy";
  
  Console.WriteLine(x);
  
  // => "howdy"
  ```
## July 17-21
- RamseyInHouse
  - I got a JavaScript project pulled down to improve and work on documentation next week.
  - I learned that Node Modules generally won't run on a local server without Webpack.
- Design
  - Don't make direct changes to your Model from the View layer!

## July 10-14
- C#
  - nullable returns from methods or variables is possible if the type declaration is
  appended with a question mark. This allows the return to be `null` whereas c sharp typically
  defaults to non-nullable types.
  ```csharp
  public string? UserName(name)
  {
  return name
  } 
  ```
  in this case, if the user never enters a name, the method will still return, but it will return `null`
instead of an error.
- Debugging
  - Steps to figure out where a bug came from (login failed)
  - Using breakpoints in IDE to pause code and step through it line by line to see where the error happens.
- 

## July 3-7
- Tech Design (two instances)
  - Helped determine the right path forward.

## June 26 - 30

- Full Stack
  - Seed Rails database with `has_and_belongs_to_many` association.
  - `<select>` to grab a particular item out of a database
  - render that item in a partial.

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
      - "vim" r character replace.
      - ![img.png](img.png)
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
