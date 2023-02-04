# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version 2.7.3

Create database.yml and application.yml like example

Run below commands:
`bundle install`

`rails db:create`

`rails db:migrate`



About risks/scale up and solotions

I. You need to think through potential attack vectors on the application

  1. Spamming 

    -Application can be attacked by sending large number of requests

    => Solotion: Detect spammer's IP and limit number of requests of them from server

       Simpler, adding captcha input at client side also prevent spamming
  
II. You need to think through how your implementation may scale up, especially to solve the collision problem

  1. The number of records will increase after a few years. If it affects performance, then Database Sharding need to be use
  
  2. High-performance processing systems also needed
