# Introduction to RSpec

## What is RSpec?

* RSpec is a testing-library/DSL used to write test-cases (specs) for testing our Ruby code. It is Ruby code, built to test Ruby code.

## Why Test?

* We should test our code because of the following reasons:

    1) To make sure our code works
    2) To allow better collaboration
    3) Serve as documentation for our code

## What to test?

* We should test the public interface of our code. The private interface should not be tested since private methods are there to support the public interface, if our public interface is thoroughly tested and works as expected, then the private methods should automatically work as expected.