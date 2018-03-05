# Network Vis [![Build Status](https://travis-ci.org/rmit-programming-club/network-vis.svg?branch=master)](https://travis-ci.org/rmit-programming-club/network-vis) [![Code Climate](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/gpa.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis) [![Test Coverage](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/coverage.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis/coverage) [![Issue Count](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/issue_count.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis)

-----

`description coming soon`

-----

## Features Under Development

* Visualise connectivity between organisation members based on coding activity. Emphasise most active members [under dev]
* Visualise overall organisation activity by activity it the organisation's repositories [under dev]
* Visualise overall organisation activity by aggregating the organisation's member's activity
* Visualise a member's immediate network (who they code with), who much they're coding, and what they code
* Visualise who's following who within the network

## Installing

`git clone` the repo and then do `bundle install`. Post any issues you have in Slack or on the Facebook group.

## Running the App

#### Authorizing with Github Client

In order to use Github's API in this project you need to provide your Github authentication details. You do this by setting two environment variables: `GITHUB_USERNAME` and `GITHUB_PASSWORD`. *If you use 2-Factor Authentication* you will need to use a Github Access Token instead of your password. Otherwise, it's just your password.

#### Starting the Local Server

Run `GITHUB_USERNAME=<USERNAME> GITHUB_PASSWORD=<PASSWORD OR ACCESS_TOKEN> bundle exec rails server` to get authentication working. If you don't want to have to keep supplying these details save them to a `.bash_profile` file or something.
