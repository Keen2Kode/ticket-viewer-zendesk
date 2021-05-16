# Zendesk Ticket Viewer

The intern coding challenge provided by Zendesk. Basic Requirements:

* Connect to the Zendesk API
* Request all the tickets for your account
* Display them in a list
* Display individual ticket details
* Page through tickets when more than 25 are returned

## Framework used 

Ruby on Rails 5 running on Cloud9 AWS through the Linux/Ubuntu terminal.

Due to the volatility of Rails, I also deployed a [version to Heroku](https://shielded-coast-55327.herokuapp.com/) incase the app fails to run directly.

## Steps for configuration

This works on the Cloud 9 Linux/Ubuntu terminal.
```
rvm install ruby-2.7.3
gem install rails -v 5.2.4.3
git clone https://github.com/Keen2Kode/ticket-viewer-zendesk.git
cd ticket-viewer-zendesk
bundle install
rails s
```
## Steps for testing
```
rails test
```
