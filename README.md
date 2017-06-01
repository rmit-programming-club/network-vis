# Network Vis [![Build Status](https://travis-ci.org/rmit-programming-club/network-vis.svg?branch=master)](https://travis-ci.org/rmit-programming-club/network-vis) [![Code Climate](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/gpa.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis) [![Test Coverage](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/coverage.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis/coverage) [![Issue Count](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/issue_count.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis)

-----

`description coming soon`

-----

## Installing 

`git clone` the repo and then do `bundle install`. Post any issues you have in Slack or on the Facebook group.

## Running the App

#### Authorizing with Github Client 

In order to use Github's API in this project you need to provide your Github authentication details. You do this by setting two environment variables: `GITHUB_USERNAME` and `GITHUB_PASSWORD`. *If you use 2-Factor Authentication* you will need to use a Github Access Token instead of your password. Otherwise, it's just your password.

#### Starting the Local Server

Run `GITHUB_USERNAME=<USERNAME> GITHUB_PASSWORD=<PASSWORD OR ACCESS_TOKEN> bundle exec rails server` to get authentication working. If you don't want to have to keep supplying these details save them to a `.bash_profile` file or something.


## Testing

We are using `rspec-rails` for testing our web app. Run `bundle exec rspec` to run all the tests. (Note: you will have to have already run `bundle install` to install the testing Gem).


## Code review check List


### General

Does the code work?
Does it perform its intended function, the logic is correct etc. Is all the code easily understood?
Does it conform to coding conventions?
Is there any redundant or duplicate code?
Is the code as modular as possible?
Can any global variables be replaced?
Is there any commented out code?
Do loops have a set length and correct termination conditions?
Can any logging or debugging code be removed?

### Security

Are all data inputs checked (for the correct type, length, format, and range) and encoded?
Where third-party utilities are used, are returning errors being caught?
Are output values checked and encoded?
Are invalid parameter values handled?

### Documentation

Do comments exist and describe the intent of the code?
Are all functions commented?
Is any unusual behavior or edge-case handling described?
Is the use and function of third-party libraries documented?
Are data structures and units of measurement explained?
Is there any incomplete code? If so, should it be removed or flagged with a suitable marker like ‘TODO’?

## Testing

Is the code testable? i.e. don’t add too many or hide dependencies, unable to initialize objects, test frameworks can use methods etc.
Do tests exist and are they comprehensive?
Do unit tests actually test that the code is performing the intended functionality? Are arrays checked for ‘out-of-bound’ errors?
