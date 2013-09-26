# SupTwitter app

    $ cd /tmp
    $ git clone https://github.com/chedli/suptwitter.git
    $ cd suptwitter
    $ cp config/database.yml.example config/database.yml
    
if you have RVM; you can remove the "bundle exec" prefix and run rake directly

    $ bundle install
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
For the test:
    $ bundle exec guard

after the migrate command, you can optionally execute:
    $ bundle exec rake db:populate

to have a sample database with fake users.
		
to have admin access:
chedli.bourguiba@supinfo.com// password: chedli