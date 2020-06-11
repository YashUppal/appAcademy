# Additonal Byebug Commands

## List of some additional Byebug commands

* ```list=``` shows where exactly are you in the code.
* ```display``` used to keep track of values of variables in the code.
* ```where``` used to view the stack-trace of a particular method (where all a particular method is invoked.)

## Conditional debugger

* We can use a conditional debugger to pause the execution of our code if a certain condition is met. 

```ruby
require 'byebug'

def meth
  i = 0
  while i < 100
    puts i
    debugger if i == 10
    i += 1
  end

  if __FILE__ == $PROGRAM_NAME
    meth
  end
end

irb(main):001:0> load 'test.rb'
=> true
irb(main):002:0> meth
0
1
2
3
4
5
6
7
8
9
10

[3, 12] in /home/revenge/test.rb
    3: def meth
    4:   i = 0
    5:   while i < 100
    6:     puts i
    7:     debugger if i == 10
=>  8:     i += 1
    9:   end
   10: 
   11:   if __FILE__ == $PROGRAM_NAME
   12:     meth
(byebug) 
```