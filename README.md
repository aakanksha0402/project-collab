# README

### ProjectCollab

Project Collab provides the employees of a particular organization to maintain the projects and the tasks in it on a very basic and simplest form.

* Ruby Version - **2.4.1**

* Rails Version - **5.1.5**

* Database - **Postgres**

* Commands to setup the project

  1. `git clone https://github.com/aakanksha0402/project-collab.git`

  2. Copy credential file

    `cp config/database.example.yml config/database.yml`

    `cp config/secrets.example.yml config/secrets.yml`

  3. Populate the appropriate values in above files.

  4. Create RVM if needed. Bundle

    `bundle install`

  5. Setup the database.

    `rake db:create db:migrate db:seed`

  6. Start server

      `rails s -p 3000`
      and visit `localhost:3000`

#### TODO

1. Any user can register for now by selecting any role. Prevent it. Make email confirmation mandatory. A new employee can only be approved by an existing project manager. Only the approved employees woult be able to login.

2. Send welcome email.

3. Track activity for projects.

4. Make a a generic webapp so people of different org. can use the system.

5. Write more test cases.

6. etc to come.
