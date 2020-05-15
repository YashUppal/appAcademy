# Debugging

## Pry Notes

Pry is an advanced REPL for ruby that offers powerful debugging tools.

``` 
user@user:~$ pry
[1] pry(main)>
```

Few useful tools offered by Pry

1) ```ls``` : used to list all methods available on a data type
```ruby
[13] pry(main)> ls Integer
Integer.methods: sqrt
Integer#methods: 
  %   <    >>          chr          fdiv       modulo     rationalize  to_int  
  &   <<   []          coerce       floor      next       remainder    to_r    
  *   <=   ^           denominator  gcd        nobits?    round        to_s    
  **  <=>  abs         digits       gcdlcm     numerator  size         truncate
  +   ==   allbits?    div          inspect    odd?       succ         upto    
  -   ===  anybits?    divmod       integer?   ord        times        |       
  -@  >    bit_length  downto       lcm        pow        to_f         ~       
  /   >=   ceil        even?        magnitude  pred       to_i 
  ```
Can also be used directly on values and variables.

```ruby
pry(main)> ls "coolstring"
```

2) ```show-doc``` : used to display a summary of documentation of some method.

```ruby
[14] pry(main)> show-doc String#end_with?

From: string.c (C Method):
Owner: String
Visibility: public
Signature: end_with?(*arg1)
Number of lines: 7

Returns true if str ends with one of the suffixes given.

  "hello".end_with?("ello")               #=> true

  # returns true if one of the suffixes matches.
  "hello".end_with?("heaven", "ello")     #=> true
  "hello".end_with?("heaven", "paradise") #=> false

```

3. ```load```: used to load a Ruby file in the Pry repl session

```ruby
[1] pry(main)> load "code.rb"
```

4. ```show-source```: used to see the underlying implementation of a method in Ruby

```ruby
[1] pry(main)> show-source String#reverse

From: string.c (C Method):
Owner: String
Visibility: public
Signature: reverse()
Number of lines: 49

static VALUE
rb_str_reverse(VALUE str)
{
    .
    .
    .
}
```
