# GIT

## Initial settings
```
git --version
git init
git config --global user.name <USERNAME>
git config --global user.email <EMAILID>
git config --list
git help config
git status
```

* `touch .gitignore`  (include all files you don't want to add into commits in this file)
## add files to Staging area
```
git add "FILENAME"
git add -A
```
## Remove files from Staging area
```
git reset "FILENAME"
git reset

git commit -m <MESSAGE>
git log
```
#### `COMMIT BLOWN THEN :wq`
## Working with remote respository
```
git clone <REPOSITORY URL> <PATH IN YOUR COMPUTER>
git clone <REPOSITORY URL>
```


## Information about remote respository
```
git remote -v
git branch -a
```
## Difference with remote respository
`git diff`

## Get updated remote respository, if any developer pushed changes
```
git pull  <REMOTENAME> <BRANCHNAME> 
git push  <REMOTENAME> <BRANCHNAME> 
```
OR
to push branch which doesnot exists on remote
```
git push --set-upstream origin <BRANCHNAME>
```
## Branching from remote respository
```
git branch <BRANCHNAME>
git checkout <BRANCHNAME>
```
## Get list of local branch
`git branch`

## Removes changes made to the local branch if not staged
`git stash`

## Create branch, switch to it and commit changes to Branched remote repository
```
git branch <BRANCHNAME>
git checkout <BRANCHNAME>
OR
git checkout -b <BRANCHNAME>
```
```
git add <FILENAME>/<FOLDERNAME>
git add -A
git commit -m <COMMIT MESSAGE TO THE BRANCH>
git push -u origin <BRANCHNAME>
```
## Merge changes to Master remote repository
```
git checkout master
git branch
git pull origin master
git branch --merged (branches that are merged into master)
git merge <BRANCHNAME>
git push origin master
```
## Delete branch locally & push to remote
```
git branch --merged
git checkout <DIFFERENT_BRANCH_NAME>
git branch -d <BRANCHNAME>
git branch -a
git push origin --delete <BRANCHNAME>
```
## Checkout to remote repository branch
(branch exist only on remote repository)

```
git fetch origin
git branch -r
git checkout --track origin/<BRANCHNAME>

OR
git branch --set-upstream-to=<REMOTE-BRANCHNAME> <LOCAL-BRANCHNAME>  (track remote branch into local)

git fetch --all
```
## Correct wrong commit message after push to remote
```
git commit --amend -m <MESSAGE>
git push —force <REMOTENAME> <BRANCHNAME>
```
## Moving commits from one branch to another

(If accidently you did changes in the master branch instead of sub branch)
```
git log (Select HASH of the commit you want to move to different branch)
git checkout <BRANCHNAME> (BRANCHNAME, where you want to move the commit)
git cherry-pick <HASH>
```
## Undoing commits or changes

(HASH OF THE COMMIT= Point where you want to return)
```
git reset --soft <HASH OF THE COMMIT> (Undo the commit)
git status
git reset <HASH OF THE COMMIT> (Remove changes from staging area)
git reset --hard <HASH OF THE COMMIT> (Go to previous version of the commit)
```
## Revert commits with HASH
`git revert <HASH> (copy the HASH of the commit you want to revert)`

## Clean git repository of untrack folders and files
`git clean -df`

## Resolve merge conflicts with mergetool
(Set up any mergetool in config, for example meld)
```
git mergetool
```
- save and close meld tool
```
git status
git clean -df
git commit -m <MESSAGE>
```

