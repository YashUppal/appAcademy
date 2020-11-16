# Nontechnical Overview of Rails

## Ruby on Rails

* Ruby on Rails is a web application development framework developed by David Hanssson and released in 2004. It is based on Ruby language and is designed for rapid development.

## Design Principles

### MVC

* MVC Stands for Model-View-Controller and is a design pattern that divides an application into three parts

1) Model - Responsible for interacting with / retrieval of information from storage and performing logic on it.
2) View - Responsible for displaying of the information
3) Controller - Acts as an interface between Model and View

### Convention over Configuration

* The concept of CoC believes in adhering to the default configuration built into the framework, and make minor changes only for doing something unconventional. This allows rapid development, unified app structure and projects are easier to understand since they follow the conventions.

### REST

* REST stands for Representational State Transfer, it's an architectural design pattern for web services apis. Modularity and Statelessness ( client doesn't need to know server's state and vice versa) are the prime characteristics of REST apis.

## Components

### ActiveRecord

* All models inherit from ActiveRecord. It is an ORM (Object Relational Mapper) that allows data from database to be represented and interactable as Ruby objects.

### ActionController

* Used to manage controller, and other things like cookies.

### ActionView

* Used to render the views.

### Rake

* Its a utility packed shipped with Rails, used to perform administrative tasks. Can be though of as a scripting tool for Rails. Used to perform things like database migration.

### Rack

* Middleware that sits between the Rails router and Web server (Puma or WEBrick). Makes sure every framework can interact with every server.

### WEBrick

* Default HTTP server with Rails 4. Single threaded, doesn't scale well.

### Puma

* Default HTTP server shipped with Rails 5. Multithreaded. Can be used for production.

## Other Frameworks

## Sinatra

* Ruby frameworks, lighter and simpler than Rails. Suitable for smaller/simpler applications.

## NodeJS

* Runtime environment for JavaScript.

## Django

* MVC Python framework that follows 'Explicit is better than implicit'. 

## Spring

* Another MVC framework based on Java. Considered slower for today's needs.

## Play!

* Framework designed to be used with Java or Scala. Supports hot reload, and since Scala is faster than Ruby, apps built on Play! are more performant.

## ASP.NET MVC

* Framwork developed by Microsoft to be used with .NET languages like C#. Designed to work on Windows machines, in contrast to Rails which expects a Unix like environment. 

## Laravel

* Framework for PHP. More flexible than Rails. PHP is more explicit and probably easier to learn than Ruby.