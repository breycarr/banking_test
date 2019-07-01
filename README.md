# Bank Tech Test [![Build Status](https://travis-ci.org/breycarr/banking_test.svg?branch=master)](https://travis-ci.org/breycarr/banking_test) [![Maintainability](https://api.codeclimate.com/v1/badges/0fcb4911c3149834fef9/maintainability)](https://codeclimate.com/github/breycarr/banking_test/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/0fcb4911c3149834fef9/test_coverage)](https://codeclimate.com/github/breycarr/banking_test/test_coverage)
> A basic account management IRB app

This is an IRB based account class, designed to allow a single user to deposit and withdraw money from their account and view a formatted statement.

The project specifications and the user stories that were generated from them can be found on this project's [wiki](https://github.com/breycarr/banking_test/wiki)

## Installation

Clone this repository
```
$ git clone git@github.com:breycarr/banking_test.git
```
Then run bundle to get the appropriate gems and ruby version
```
$ bundle install
```
Navigate to the root folder for the respository, and open the accounts in iRB
```
$ irb -r ./lib/account.rb
```

## Usage examples
### Creating an account
The user can then initiate their account by creating a new variable
```
> account_name = Account.new
```
`account_name` can be any name (eg. `my_account`, `account_1`)
All accounts are initiated with a balance of 0 and 0 transactions.

The balance can be shown with the balance method
```
> account_name.balance
=> 0
```
### Deposits and Withdrawls
New funds can be added with the deposit method. The method requires 1 argument, with an additional optional argument for the date.
```
> subject.deposit(1000, "10/01/2012")
 => [["10/01/2012", 1000, nil, 1000]]
 ```
 If a date is not specified, the current date will be used
 ```
 > subject.deposit(2000)
 => [["01/07/2019", 2000, nil, 2000]]
 ```

 Funds can be withdrawn with the withdraw method, which used the arguments described for deposit above
```
> subject.withdraw(500, "14/01/2012")
=> [["14/01/2012", nil, 500, -500]]
```
### Statements
A formatted statement of all deposits and withdrawals can be seen using the statement method.
```
> subject.deposit(1000, "10/01/2012")
> subject.deposit(2000, "13/01/2012")
> subject.withdraw(500, "14/01/2012")
> subject.statement
=> "date || credit || debit || balance\n14/01/2012 ||  || 500 || 2500\n13/01/2012 || 2000 ||  || 3000\n10/01/2012 || 1000 ||  || 1000\n"
```

To show the formatted text, use the puts method ahead of calling the statement method
```
> puts subject.statement
date || credit || debit || balance
14/01/2012 ||  || 500 || 2500
13/01/2012 || 2000 ||  || 3000
10/01/2012 || 1000 ||  || 1000
 => nil
 ```
### Development, Testing and Code Quality
This is a passing build. All unit tests for this class can be found in the spec file.
The tests have 100% coverage, as tested by SimpleCov.
Tests can be run, and coverage is shown by calling `rspec` in the terminal.

The code quality was confirmed to match the Ruby style guide by the Scaffolint extension for RuboCop. This can be shown by calling `rubocop` in the terminal.
