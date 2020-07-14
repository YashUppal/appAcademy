# Git Add

## Recommended Methods

* We should explictly add individual files using ```git add <filename>``` instead of using ```git add .``` or ```git add -A```, as in the case of latter options there is a risk of unintentionally commiting files with sensitive information (API keys).