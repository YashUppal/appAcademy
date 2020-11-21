# Validations

## What are validations?

* Model Level Validations are a way to ensure data integrity and consistency. They are the Ruby counterpart to Database constraints that make sure that wrong data is not entered into our database.

* If our database table has a not null contstraint on one of the columns, we can have a corresponding model validation on that table

* Validations in models are achieved using the ```validate``` method. Custom validations are achieved using ```validates``` method, then defining a custom method.

## Validations and Error

* In order to get verbose error messages, we can use:
1) object.save!
2) object.error.full_messages