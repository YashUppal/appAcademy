# ORM Overview

## Motivation

* Writing embedded SQL code in Ruby is cool, but the data returned upon running those queries is often in the form of generic hashes or arrays. It works, but is not easy to work, it requires a lot of complex conversions.

## What is an ORM?

* An ORM (Object Relational Mapper) is something that allows data retrieved from SQL to be represented in the form of Ruby objects, and work with them directly. ActiveRecord is an ORM that could be used with Rails.