Trackify
=============

A simple link aggregator built for sharing music. Built entirely with Ruby on Sinatra.

## Getting Started

1. `bundle install`
2. `bundle exec rake db:migrate`
3. `bundle exec shotgun -p 3000 -o 0.0.0.0`
4. Visit `http://localhost:3000/` in your browser

## Features

+ User authentication and session management.
+ Create, update and destroy posting for tracks.
+ View, review and upvote tracks posted by others.
+ Tracks auto-sorted by upvotes count.