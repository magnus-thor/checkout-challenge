[![Coverage Status](https://coveralls.io/repos/github/magnus-thor/checkout-challenge/badge.svg?branch=master)](https://coveralls.io/github/magnus-thor/checkout-challenge?branch=master)

# Checkout challenge
--------
Checkout Challenge is about an on-line marketplace where you can control the inventory and discount.

## Getting Started
--------
Prerequisites
You'll need to install

* *Ruby*

## Usage
-------
Start up `irb` in command line  
load up the program `load './lib/checkout.rb'`  
Next you will need to create the Checkout.
` co = Checkout.new `  
To check the current inventory use `co.inventory`  
To add items to basket `co.scan(item_number)`  
To see current value `co.total`  
To see current basket `co.basket`  
If you want to change the inventory `co.inventory` the order is `{item_number=> ['item_name', value}`  
To change the promotional rules `co.promo` the order is `{item_number=> [amount_of_items, new_value]}`  
if you want to change the discount `co.promo['discount'] = [value_over, percentage]` the percentage goes from 1 down to 0.

-------

## Author
Magnús Þór Ársælsson
--------
