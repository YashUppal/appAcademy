# Validations

## What are Validations?

* Validations prevent bad data from getting into your database. They provide Rails level user-input checking and help in data integrity and consistency.

## Validations vs Constraints

* Validations are different from database constraints, in that they both work on different levels. Constraints work on Ruby/Rails level whereas database constraints are applicable to the database.

1) Validations are defined inside models
2) Constraints are defined inside migrations

## Use Constraints

* Database constraints like ```NOT NULL,PRIMARY KEY,FOREIGN KEY``` are applied on the database level. They're strong and keep the data integrated and consistent. When a database constraint is failed, the database will throw a generic ```SQLException``` which are not handled well by Rails.

## Use Validations

* For validating user inputs, Rails validations are very helpful. Rails has provided with a lot of inbuilt methods Models validation. If a user chooses a previously taken username, we want to ask user to choose a different username, and not serve a 500 Internal Server Error.

## Use Both

* We should and would be using Model validations and Database constraints together, to ensure maximum integrity of the data and optimal application performance. An example would be using a ```uniqueness: true``` validator and a ```UNIQUE``` constraint in the database.

## When does validation happen?

* When you save/save! the model. Upon calling save/save!, the data will be first validated, then if it is deemed fit to be persisted into the database, it will be inserted. Successful save will be returned with a ```true```, otherwise ```false```.

