## 1.Feature Branching Strategy (Task Branching)
### Pros:
* Allows developers to work independently
* More stable codebase
* Segmented work for easier easier working
* Instead of tackling a whole entire project, people can work on bits one by one
* Teams work in branches which are easier for coding

### Cons:
* Branches that have exited for a long branch can be very hard to merge
* People who dont merge often can encounter many issues
* Debugging can be difficult
* Viewing main branch problems

## 2.Feature Flag Branching Strategy for Continuous Delivery
The Feuture Flag branching strategy is essentially organizes the branches separated from the 
trunk branch (the master branch)by 
### Pros:
### Cons:

## 3.Release Branching Strategy
### Overview: 
This branching strategy involves creating a branch for every new release that a team decides to pursue.
### Pros:
* This type of strategy would benefit teams thart would need to continuously release new versions and patches to their existing product
* It can handle the customization of the version for each customer
* And it can handle having multiple versions being used at the same time
### Cons:
* Working with multiple branches at the same time can make it difficult to maintain
* a lot of changes and contributors can make the codebase clogged and prone to conflicts
* Having multiple versions would also mean having changes being maintained by the team for each version 
* a higher amount of workload to manage
* bugfixes have to be propagated, merged, and tested with a clearly outlined process to maintain all the release versions

https://www.perforce.com/blog/vcs/best-branching-strategies-high-velocity-development
