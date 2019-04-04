# TASKS

## Overview

Please spend no more than 2 hours on this. I would recommend %50 of your time on part One and %50 on part two. 
The goal is to see your problem solving and development skills in a strict timeframe. We will quiz you on 
your solution in a final interview. Please do this in incremental commits so we can see your thought process. If you can do proper TDD with this then fantastic (but not essential).
Please make your solution available in a public repo in Github
  

Feel free to add any ruby gems you want. FactoryGirl

## Part One (Creating Offers)

* Add a root path to the routes. It should to the GET /offers page (INDEX)
* Add a maximum amount for both offer quantity and offer price. Update the specs
* Change offer season to an integer instead of a decimal
* Delete an offer
* Handle scenario when user tries to update an offer with invalid data
* Change the season input so that it is not editable in the edit offer 

## Part Two (Trading)

Implement the Bid#find_match method. Comphrehensive specs are a MUST. In an exchange we cannot afford to have errors in trading!

So when working at CGX you will find a lot of business rules which you will need to talk with the business to determine. However for the case of this test
you will not have the business available. As such can you please list your assumptions in a text file.  

Rules are as follows

* You must always match the offer with the highest bid
* A trade must reference the matching bid and offer. The trade does not store the price and quantity, only the references to the bid and offer. 
* When getting the quantity and price of a trade you must do so via the bid values (do not reference the offer values, if some is prepared to pay more then we let them)
* The bid price must be equal to or greater than the offer price for a valid trade. 
* The offer and bid must have a matching Season and Grade. The Bid price must be higher than or equal to the offer.
* You must match the full offer quantity. A bid can be a partial match on quantity. So if a Bid for a quantity of 1000 will match with an offer of 800. 
* In the case of multiple matches the offer created first should be used as the match. 
