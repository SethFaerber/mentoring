# Weekly Learning
This documents the main things I learned this week.
- "Confidence" means that I moved into a deeper understanding and consistent implementation in an area.
- "Awareness" means I have an understanding of this topic, but am not fully practiced in it.


## Current Week: April 24 - 28
- Design Patterns
  - Confidently use and explain Strategy Pattern: [Two examples I wrote here](https://github.com/SethFaerber/mentoring/blob/main/design-patterns/strategy_pattern.rb).
- Styling
  - Confidently use new RDS Components (Link, Grid, etc.)
- Data
  - Confidently include and use helpers where needed `BabyStepsHelper` for example.
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
