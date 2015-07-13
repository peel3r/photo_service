# Photo Search

What is the Arnold Clark Photo Search app?
---------------------------------------

Arnold	Clark’s	website	takes	images	of	our	used cars	from a	caching	server

and displays to user

##The functionality

Given a
         - stock-ref = "ARNFC-U-7276"
         - registration = “YT61BXJ"

App should display in user friendly manner a set of car images
## The challenge
     the app should fetch all appropriate images from the server from 0-12 or display the placeholder image
     on submission of registration and stock referencd the app should calculate the obfuscated stock reference
     when obfuscated stock reference is calculated the app should build image url based on example below
     `http://vcache.arnoldclark.com/imageserver/<obfuscated-stock-reference>/<size>/<camera>`
     where the

                - size	is	either	350	or	800
                - camera	is	one	of	f,	i,	r,	4,	5	or	6

     the rule for obfuscated stock reference

     The	obfuscated	stock	reference	is	calculated	by	interleaving	the	stock	reference	with	the

     reversal	of	the	registration	plate	and	appending	the	9th	character	of	the	stock	reference	and

     taking	the	shortest	possible	solution	(i.e.	ignore	any	unused	characters	from	the	stock

     reference)

     For	example.

     Given

     stock-ref = "ARNFC-U-7276"

     registration = “YT61BXJ"

     Then

     obfuscated-stock-reference = AJRXNBF1C6-TUY7

Install and run
---------------

1. Git clone
2. Bundle install
3. rails s

the app should be noe running on your browser under localhost:3000

the registration number used for tests is `mk5 1fdd`
the Stock Reference is `arnfa-u-4633 `

live app can be seen on https://fierce-crag-6250.herokuapp.com/

