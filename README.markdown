# Andrew Littleford

[![Build Status](https://travis-ci.org/kmcphillips/andrewlittleford.com.svg)](https://travis-ci.org/kmcphillips/andrewlittleford.com)

[Kevin McPhillips](mailto:github@kevinmcphillips.ca)

[http://andrewlittleford.com](http://andrewlittleford.com)


## About

Personal home page for Andrew Littleford. It is written with Rails 3, haml, and jQuery. It provides a full CMS back end including RMagick image upload, transformation, and thumbnailing.


## Quick Setup

With an OS X or Linux machine with ruby and bundler installed, you should be able to go from 0 to running in under three minutes.


### For the impatient

    $ git clone git://github.com/kmcphillips/andrewlittleford.com.git
    $ cd andrewlittleford.com
    $ bundle install
    $ cp config/database.yml.example config/database.yml
    $ rake db:create
    $ rake db:migrate
    $ rake db:populate
    $ rails server

Point your browser to [http://localhost:3000/](http://localhost:3000/) and you should be set to go.


## Feedback

Contact me at [github@kevinmcphillips.ca](mailto:github@kevinmcphillips.ca) with questions or feedback.

