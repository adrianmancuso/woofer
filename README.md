# Woofer - Tinder for dogs

![Cool doggo](http://i.imgur.com/OLmsCMt.gif)

## Project Description
A tongue-in-cheek social network for dogs seeking other dogs in their geographical area. Dogs can sign up for an account and send private messages to others based on a 222km radius.

## Tools Used
Address autocomplete and location use the ubiquitous Google maps and places APIs (with HTTParty). Sinatra / Ruby / ActiveRecord / PostgreSQL run on the backend. Deployed live via heroku: https://floating-tundra-40938.herokuapp.com/

## Challenges
My main challenge is that the joke of creating a secure social network for dogs wore thin after a day or two. 

Google's API seem to have been created with the mindset that developers would like to include a Google Map image on their website. To get the location of a user from their address I needed to pass the location provided by the user to a HTTParty call to the googlemaps API in the backend. 

Storing the longitude / latitude of the user location - I originally attempted to use a PSQL geo circle (x,y, r) and then a point (x,y) to store the data, however accessing that data in a meaningful way proved impossible. Ultimately lng/lat are stored as floats in the DB and user proximity is quite forgiving.
  

## Lessons Learned
Don't create a joke site if you're planning to spend over 2 days working on it.

Keep class and method names short and logical and changes will be easy!

## Unresolved Issues
At present users can not register the same username twice however no error is presented. 

My original idea involved allowing dogs to choose their favourite park location however specifying this in the autocomplete did not return any results. At present dogs enter their address.

## Development Notes