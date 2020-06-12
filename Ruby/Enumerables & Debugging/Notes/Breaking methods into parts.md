# Breaking methods into parts

## Breaking confusing methods into smaller parts.

* Consider the below line of code.

```ruby
exp(b, n) = b * exp(b, n - 1)
```
* This is an example of a code that is not very descriptive, and might confuse someone who looks at it doesn't provide the context for what it's used.

### Let's try to break it down.

1) Start by re-writing the code with longer and more descriptive variable names.

```ruby
# exp(b, n) = b * exp(b, n - 1)
exponent(base, power) = base * exponent(base , power - 1)
```
2) Start by the next-operation that takes place and break it down more.

```ruby
smaller_power = power - 1
exponent(base, power) = base * exponent(base, smaller_power)
```

3) Break down the next operation.

```ruby
smaller_power = power - 1
base_to_the_smaller_exponent = base * exponent(base, smaller_power)
exponent(base, power) = base * base_to_the_smaller_exponent
```

4) This gives us

```ruby
exponent(base,power) = base * base_to_the_smaller_exponent
```

* This step-by-step process of breaking down code and methods into smaller parts is a good practice. It is more readable, descriptive and can be debugged easier.

## Advantage of longer varible names.

1) Less to hold in your working memory. Longer variable names which are more descriptive will allow you to 'forget' about them, and save you some cognitive overhead for making and remembering associations.

```ruby
price_of_game = 12.04 # descriptive
x = 12.04 # what?
```

2) Easier for someone else to read your code.

## Exercise

The method below estimates how much money your child will have when they retire, based on your age.

Sample Inputs and Outputs:

* An input of 30 should output 11250
* An input of 50 should output 25000

You know the algorithm involves these steps in some order:

* Calculate how much money they'll have by multiplying by the number of years they have left until retirement.
* Estimate your child's current bank account by squaring their age.
* Estimate your child's age by dividing your age by two.
* Calculate how many years your child has left until they retire at age 65

```ruby
def return_number(a)
    ((a / 2)**2) * (65 - (a / 2))
end
```

### Solution

0)  ```ruby
    def return_number(a)
        ((a / 2)**2) * (65 - (a / 2))
    end
    ```

1)  ```ruby
    def return_number(parents_age)

        ((a / 2)**2) * (65 - (a / 2))
    end
    ```

2)  ```ruby
    def return_number(parents_age)
        childs_age = parents_age / 2 

        (childs_age**2) * (65 - childs_age)
    end
    ```

3)  ```ruby
    def return_number(parents_age)
        childs_age = parents_age / 2 
        childs_bank_balance = childs_age**2

        childs_bank_balance * (65 - childs_age)
    end
    ```

4)  ```ruby
    def return_number(parents_age)
        childs_age = parents_age / 2 
        childs_bank_balance = childs_age**2
        childs_years_until_retire = 65 - childs_age

        childs_bank_balance * childs_years_until_retire
    end
    ```

5)  ```ruby
    def return_number(parents_age)
        childs_age = parents_age / 2 
        childs_bank_balance = childs_age**2
        childs_years_until_retire = 65 - childs_age
        
        how_much_theyll_have = childs_bank_balance * childs_years_until_retire

        return how_much_theyll_have
    end
    ```

6) ```ruby
    def return_number(parents_age)
        childs_age = parents_age / 2 
        childs_bank_balance = childs_age**2
        childs_years_until_retire = 65 - childs_age
        
        how_much_theyll_have = childs_bank_balance * childs_years_until_retire

        return how_much_theyll_have
    end
    ```

7) ```ruby
    def child_retires_with_money(parents_age)
        childs_age = parents_age / 2 
        childs_bank_balance = childs_age**2
        childs_years_until_retire = 65 - childs_age
        
        how_much_theyll_have = childs_bank_balance * childs_years_until_retire

        return how_much_theyll_have
    end
    ```

* Break down complex lines!