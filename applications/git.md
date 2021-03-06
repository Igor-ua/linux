**Git commands**


Watch current head position
```
git log -1
```

Watch current git id
```
git rev-parse HEAD
```

Merge branch dev-unstable into master (standing on the master) as 1 commit
```
git merge --squash dev-unstable
git status (optional)
git add . (or not)
git commit -m "Merged dev-unstable"
```

Rollback merge from master-branch before it was pushed
```
git reset --hard origin/master
```

Lazy-git function for ubuntu
```
function lazy-git() {
	git add .
	git commit -m "lazy-git commit"
	git push
}
```

Show branches
```
git branch
```

Switch branch
```
git checkout master
git checkout dev-unstable
```

Delete remote and local branch
```
git push origin --delete <branch_name>
git branch -d <branch_name>
```

Permanently remove few commits from the remote branch
```
step 1: checkout local branch
git checkout master

step 2: reset hard useless commits:
git reset --hard <last_working_commit_id>

step 3: update remote:
git push --force
```

Moving Repository from BitBucket to GitHub (UUID repo example)
```
cd ~/Projects/uuid
git remote rename origin bitbucket
git remote add origin https://github.com/Igor-ua/uuid.git
git push origin master

Delete old remote repo:
git remote rm bitbucket
```