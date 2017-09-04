# Ruby Invoice
[![Build Status](https://travis-ci.org/SelenaSmall/ruby_invoice.png)](https://travis-ci.org/SelenaSmall/ruby_invoice)
[![Code Climate](https://codeclimate.com/github/SelenaSmall/ruby_invoice/badges/gpa.svg)](https://codeclimate.com/github/SelenaSmall/ruby_invoice)
[![Test Coverage](https://codeclimate.com/github/SelenaSmall/ruby_invoice/coverage.svg)](https://codeclimate.com/github/SelenaSmall/ruby_invoice/coverage)

Invoicing System written in Ruby.

## Installation

Environment: Built on Mac OSX 10.11.6 using Ruby -v 2.4.1

Make sure you have the correct version of ruby installed https://www.ruby-lang.org/en/documentation/installation/ 

1. Clone this Repo

> $ git clone https://github.com/selenasmall/ruby_invoice.git  

2. In root of the app run bundle install

> $ gem install bundler && bundle install


## Usage

Run the program from the app root

> $ ruby app.rb

Expected terminal output:

> Main menu: LIST available products, SHOP (add items to your order), VIEW basket, EXIT

__Main Menu__

Commands | Description
--- | ---
SHOP | Redirect to the shop menu where you can add products to your order
LIST | Output a list of all available products along with their pack sizes and prices
VIEW | Output an itemised invoice of all products that have been added to your order
EXIT | Gracefully exit the program

### Actions

***
__SHOP__

Expected terminal output:

```
Type BACK at any time to return to the main menu. 
Add qty and items to your order, example input: 3 watermelons
$ __
```

* __Shop Menu__

Commands | Description
--- | ---
X products | Order a specified quantity of a product, where ‘x’ represents the quantity and ‘product’ represents the name of the product.
BACK | Return to the main menu


* __Shop Order Responses__
	* __That is not a valid product__ Order will not be updated because the product is not valid
	* __Inconsistent quantity__ Order will not be updated because the quantity can not be made up with available packs for the specified product
	* __Product added__ Order will be updated with new product

***

__LIST__

Expected terminal output:

```
Products Available

Watermelons
	3 pack @ $6.99
	5 pack @ $8.99
---------------------

Pineapples
	2 pack @ $9.95
	5 pack @ $16.95
	8 pack @ $24.95
---------------------

Rockmelons
	3 pack @ $5.95
	5 pack @ $9.95
	9 pack @ $16.99
---------------------

$ __
```

***

__VIEW__

Expected terminal output:

```
Customer Invoice
qty	item					sub
-------------------------------------
-------------------------------------
TOTAL

$ __
```

***

__EXIT__

Expected terminal output:

```
Goodbye!
```

***


## Testing

Test by running rspec http://rspec.info/

> $ rake rspec

Expected terminal output:

```
... ..CUSTOMER INVOICE 
qty	item			sub
-------------------------------------
-------------------------------------
TOTAL 				0 

.Type BACK at any time to return to the main menu. 
Add qty and items to backet, example input: 3 watermelons 
.CUSTOMER INVOICE 
qty	item			sub
-------------------------------------
10 watermelons 			17.98
	2x 5 packs @ 8.99
-------------------------------------
TOTAL 				17.98 

... ... ... ...
Watermelons
3 pack @ 6.99
5 pack @ 8.99

Pineapples
2 pack @ 9.95
5 pack @ 16.95
8 pack @ 24.95

Rockmelons
3 pack @ 5.95
5 pack @ 9.95
9 pack @ 16.99

... ... ... ... ... ... ... .Type BACK at any time to return to the main menu. 
Add qty and items to backet, example input: 3 watermelons 
..That's not a valid input
...

Finished in 0.03877 seconds (files took 0.36899 seconds to load)
46 examples, 0 failures

Coverage report generated for RSpec to /Users/selenasmall/devroot/ruby-projects/ruby_invoice/coverage. 395 / 398 LOC (99.25%) covered.

```

***

## Specifications

### Description

A fresh food supplier sells product items to customers in packs. 
The bigger the pack, the cheaper the cost per item.

***

* __The supplier currently sells the following products__

```
Product            	Packs          
----------------------------------
Watermelons        	3 pack @ $6.99
                   	5 pack @ $8.99
                   
Pineapples         	2 pack @ $9.95
                   	5 pack @ $16.95
                   	8 pack @ $24.95
                   
Rockmelons         	3 pack @ $5.95
                  	5 pack @ $9.95
                   	9 pack @ $16.99
```

***

* __Your task is to build a system that can take a customer order…__

For example, something like:

10 Watermelons
14 Pineapples
13 Rockmelons

***

* __And generate an invoice for the order…__

For example, something like:

```
10 Watermelons         $17.98
   - 2 x 5 pack @ $8.99
14 Pineapples          $54.80
   - 1 x 8 pack @ $24.95
   - 3 x 2 pack @ $9.95
13 Rockmelons          $25.85
   - 2 x 5 pack @ $9.95
   - 1 x 3 pack @ $5.95
-----------------------------
TOTAL                  $98.63
```

***

* __Note__ that the system has determined the optimal packs to fill the order.
You can assume that bigger packs will always have a cheaper cost per unit price.

***

### Constraints

The system must be able to determine the optimal packs to fill the order.

Example Input and Output: 

***
__1. Add items and view invoice__
```
> Main menu: LIST available products, SHOP (add items to your order), VIEW basket, EXIT
```

> $_ SHOP

```
Type BACK at any time to return to the main menu. 
Add qty and items to your order, example input: 3 watermelons
```
 
> $_ 10 watermelons
>
> $_ 14 pineapples
>
> $_ 13 rockmelons
> 
> $_ BACK

```
Main menu: LIST available products, SHOP (add items to your order), VIEW basket, EXIT
```

> $_ VIEW

```
Customer Invoice
Items rounded up to nearest available qty
qty	item			sub
-------------------------------------
10 watermelons 			17.98
	2x 5 packs @ 8.99
13 rockmelons 			25.85
	2x 5 packs @ 9.95
	1x 3 packs @ 5.95
14 pineapples 			54.80
	1x 8 packs @ 24.95
	3x 2 packs @ 9.95
-------------------------------------
TOTAL 				98.63
```

***

__2. View invoice and add more items__
```
Main menu: LIST available products, SHOP (add items to your order), VIEW basket, EXIT
```

> $_ SHOP

```
Type BACK at any time to return to the main menu. 
Add qty and items to your order, example input: 3 watermelons
```
 
> $_ 10 watermelons
> 
> $_ BACK

```
Main menu: LIST available products, SHOP (add items to your order), VIEW basket, EXIT
```

> $_ VIEW

```
Customer Invoice
Items rounded up to nearest available qty
qty	item					sub
-------------------------------------
10 watermelons 				17.98
	2x 5 packs @ 8.99
-------------------------------------
TOTAL 						17.98
```

> $_ SHOP

```
Type BACK at any time to return to the main menu. 
Add qty and items to your order, example input: 3 watermelons
```
 
> $_ 13 rockmelons
>
> $_ 14 pineapples
> 
> $_ BACK

```
Main menu: LIST available products, SHOP (add items to your order), VIEW basket, EXIT
```

> $_ VIEW

```
Customer Invoice
Items rounded up to nearest available qty
qty	item					sub
-------------------------------------
10 watermelons 				17.98
	2x 5 packs @ 8.99
13 rockmelons 				25.85
	2x 5 packs @ 9.95
	1x 3 packs @ 5.95
14 pineapples 				54.80
	1x 8 packs @ 24.95
	3x 2 packs @ 9.95
-------------------------------------
TOTAL 						98.63
```
***

### Assumptions

* Orders which do not equate to the product of any given combination of packs will be ignored and not be added to the order

***

## Additional Reading
I wrote up my process of building this app, including one major tangent which completely ignored the premise of the brief and threw my design sideways for a period before finally resolving the solution. You can read about it here: http://webgeek.selenasmall.com/ruby-invoice/
