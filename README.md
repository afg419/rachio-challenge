# Rachio Zone Controller

### This app allows a registered user to control their Rachio devices' zones.  Users can select zones from their devices, specify a duration to run, and initiate them all at once or in sequence.  Counters indicate how much longer the zones will run.

![](http://imgur.com/qFY5BGr.png)

### Test Suite

![](http://imgur.com/8frggMb.png)

### To run locally...  
Clone this repo:  
`$ git clone https://github.com/afg419/rachio-challenge.git`    
`$ cd rachio-challenge`  

Install dependencies:  
`$ bundle exec`  

Setup database:  
`$ rake db:create && rake db:migrate && rake db:seed`  

Run server locally and visit localhost:3000:    
`$ rails server`


To run the test suite:  
`$ rspec`


