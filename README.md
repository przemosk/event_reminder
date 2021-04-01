# README

### USAGE

````
git clone git@github.com:przemosk/event_reminder.git

cd event_reminder

bundle install

rails db:setup

rails s

in another terminal tab: redis-server ( redis required ) 
in another terminal tab: bundle exec sidekiq
````

### ENDPOINT

Create Event Alert
`POST http://localhost:3000/api/alerts/add_alert`

````
required params:
   user_id: integer
   event_id: integer
   remaind_at: 02-04-2021 10:00
````
