# Bash-profile

### Edit bash-profile

Open/edit bash profile on mac using following commands
* `sudo vim ~/.bash-profile`
  * to edit any file using terminal
    ```
     i = insert
     :w = write
     :q = quit
     :wq = write & quit
     :q! = quit & donʼt save
     ```
### Setting path
Use `exprort <NAME_VARIABLE> = .....`

### Setting alias
For day to day commands, create an alias which is short and easy to remember, for example
```
alias ll="ls -al"                               # List all files in current directory in long list format
alias docs="cd ~/Documents"                     # Open Documents directory
alias down="cd ~/Downloads"                     # Open Downloads directory
alias idea="cd ~/IdeaProjects"                  # Open IdeaProjects directory
alias github="cd ~/IdeaProjects/github"         # Open github projects directory
alias install="mvn clean install"               # Clean install maven projects
alias clean="mvn clean"                         # Clean maven projects

```
