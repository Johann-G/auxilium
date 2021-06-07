YouMind

https://you-mind.herokuapp.com/

This is a prototype of an application to ensure a follow-up between a patient and his doctor in case of a new isolation due to the COVID crisis.  
The initial project was developed during Le Wagon's coding bootcamp within a team of 3 (https://github.com/ebblo/auxilium).


# README
To test the application, please do the following:

1) Go to the signin page -> http://you-mind.herokuapp.com/doctor/sign_in
2) On the signin page, use the following credentials -> email: youminddoctor@gmail.com, password: y3KvLU5v2rk37Twt
3) Allow Youmind to access the Google account linked to youminddoctor@gmail.com -> same credentials as above, email: youminddoctor@gmail.com, password: y3KvLU5v2rk37Twt
4) Create as many patients as you want -> Click on "Add a patient", fill in all fields -> an invitation e-mail will be sent to the patient's email



* TECHNOLOGIES 
- Ruby on Rails
- PostgreSQL
- Heroku 

* KEY FEATURES 
- Integration of Google Calendar's API
- Integration of an API to send SMS (Vonage)
- Implementation of a Websocket chat
- Devise invitable gem (emails handled by Sidekiq as background jobs)
- aasm state machine gem
- ...





