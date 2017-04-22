# Network Vis [![Build Status](https://travis-ci.org/rmit-programming-club/network-vis.svg?branch=master)](https://travis-ci.org/rmit-programming-club/network-vis) [![Code Climate](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/gpa.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis) [![Test Coverage](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/coverage.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis/coverage) [![Issue Count](https://codeclimate.com/github/rmit-programming-club/network-vis/badges/issue_count.svg)](https://codeclimate.com/github/rmit-programming-club/network-vis)

-----

`description coming soon`

-----




# Code review check List

## General

Does the code work?
Does it perform its intended function, the logic is correct etc. Is all the code easily understood?
Does it conform to coding conventions?
Is there any redundant or duplicate code?
Is the code as modular as possible?
Can any global variables be replaced?
Is there any commented out code?
Do loops have a set length and correct termination conditions?
Can any logging or debugging code be removed?

## Security

Are all data inputs checked (for the correct type, length, format, and range) and encoded?
Where third-party utilities are used, are returning errors being caught?
Are output values checked and encoded?
Are invalid parameter values handled?

## Documentation

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
