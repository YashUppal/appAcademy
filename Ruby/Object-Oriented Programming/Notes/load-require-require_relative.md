# load/require/require_relative

## require

* ```require 'filename'``` will read and parse the content of ```filename``` into the current program, but it will look into the ```$LOAD_PATH``` and ```Gem.path```.

* ```require_relative 'filename'``` will read and parse the content of ```filename``` into the current program, it will look in places relative to the current directory of the program file it is used in.

* ```load 'filename'``` will read and parse the content of ```filename```. Wherease ```require``` and ```require_relative``` will keep track of the fact whether a file has been loaded before or not, if a file is loaded before, it will not be loaded again, ```load``` on the other hand will reload the file reqardless.```load``` is useful for testing purposes in REPL environment.