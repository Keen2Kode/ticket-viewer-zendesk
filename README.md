# Zendesk Ticket Viewer

The intern coding challenge provided by Zendesk. Basic Requirements:

* Connect to the Zendesk API
* Request all the tickets for your account
* Display them in a list
* Display individual ticket details
* Page through tickets when more than 25 are returned

## Framework used 

I decided to go with **Ruby on Rails 5** running on Cloud9 AWS through the Linux/Ubuntu terminal.

Due to the volatility of Rails, I also deployed a [version to Heroku](https://shielded-coast-55327.herokuapp.com/) if the configuration fails.

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

---

### Additional Notes


* Currently, I'm doing the RAD course in RMIT which heavily employs Rails in its teaching material. As the coding challenge and the course are done in tandem, I thought this would be a good opportunity to apply the course knowledge I've acquired over the past 2 weeks onto this challenge. Due to the time constraints, using Rails also seemed like a good choice when going for Rapid Development.

* To reduce configuration issues with a database, I created the app with`--skip-ActiveRecord`so there's no database to create.

* Since there's no database, the models Zendesk and Ticket exist to access and manipulate API data.




