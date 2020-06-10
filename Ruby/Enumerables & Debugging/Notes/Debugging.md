# Debugging

## Rules to follow for debugging

 1) Read the error message, error type, error line and stack trace. Try to get into the mind of the machine. Follow the logical flow of your code to locate the bugs.

 2) Isolate the code and test it separately in REPL.

 3) Write testable code, code that can be isolated and bugs can be found easily.

 4) Use a debugger like 'byebug' to make the process of debugging easier.

## What after debugging?

* After you debug a code in your program, it is best-practice to write a test to ensure that a similar bug doesnot creep in the code in future. Rspec and Guard for the win.