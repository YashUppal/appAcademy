# Faster Git with aliases

## What are aliases?

* Aliases is a shell feature where you can assign commands to a specific string and create shortcuts, so that instead of typing complete commands every time, you can use the alias as a shorcut. You can create persistent alises by modifying your bash config file.

```
~/.bashrc

alias gcm="git commit -m"
```

* So now, in terminal, to commit your changes and add a message you have to simply type

```
# before alias
git commit -m "this is a commit message"

# after alias
gcm "this is a commit message"
```