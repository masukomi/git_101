# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default

# create a topic branch
git checkout -b handling_mistakes

# set up a couple files
echo -e "puts 'hello'\nbyebug\nputs 'world'" > foo.rb

echo "puts 'bar'"> bar.rb

git add foo.rb

# commit them
git commit -m "added foo.rb hello world script"

# double check ...
git status
# oops! forgot one

git add bar.rb

git commit --amend -m "added foo.rb and bar.rb hello world scripts"

# double check again
git status

git log --stat -1
# looks like we got everything

# lets check the contents of that diff
git diff HEAD^

# in a graphical diffing app
git difftool HEAD^

# how about a different tool?
git difftool --tool=Kaleidoscope

echo -e "puts 'hello'\nputs 'world'" > foo.rb

git diff

git add foo.rb

git commit --amend -m "added foo.rb and bar.rb hello world scripts"

git log --stat -1

# how to back up and explore 
# a different solution to a problem
cat .git/HEAD

git checkout HEAD^

# DETACHED HEAD NOW
# this is when HEAD is NOT
# pointing to the tip of a branch
cat .git/HEAD

echo "another bogus file" > bogus.txt
git add bogus.txt
git commit -m "added bogus file" 

# just to show it could be done
git checkout -b back_one_step

git log --left-right --graph --cherry-pick --oneline \
handling_mistakes..back_one_step


git log --left-right --graph --cherry-pick --oneline \
back_one_step..handling_mistakes

git push origin back_one_step

# back to original topic branch
git checkout handling_mistakes


git branch -d back_one_step
# didn't work because it has commits
# that won't exist elsewhere

# going to have to force it 
git branch -D back_one_step

# deleted locally, but still on server
git fetch

git branch -a | grep back_one_step

# how do we kill it on the server?
# push nothing to that branch
git push origin :back_one_step

git fetch 

git branch -a | grep back_one_step

######### stash 
# let's play with stash

echo "puts 'stuff in existing file'"  > bar.rb

echo "some bogus stuff" > bogus.txt

git status

# stash it.
git stash
git status
# note that the edit to bar.rb is gone,
# but the bogus.txt is still showing up.
# Why? because bar.rb is tracked 
# and bogus.txt is not
git stash list
# note that it actually tells you what branch 
# the stash was created against
# apply it
git stash pop
git status
# changes are back
# note that it's gone from the list
git stash list

# let's save it again with a more 
git stash save "stashing bogus stuff"
git stash list

git stash apply stash@{0}
# note that it's still present in the list of stashes
git stash list
# we've effectively just taken a snapshot of our code
# wrote something. put it in a stash. pulled it right back out.
# noting that untracked files are NOT in the stash.
# if you add them they will be.

# ok, we don't need that stash anymore so...
git stash drop stash@{0}

# blow away the changes we made 
# playing with stash 
git reset --hard HEAD

### END STASH

# REMOVING FILES
# Deal with files that shouldn't have been added
# a bad file
echo "this file is trash" > trash.rb
# a legit change to bar.rb
echo "puts 'bar is better than foo'"  > bar.rb

git status

git add bar.rb

git add trash.rb

git status

# Hasn't been committed
# how do we remove it from the index
# without deleting the file?

git reset HEAD trash.rb

git status
# now we're good to commit
git commit -m "indicated the superiority of bar in bar.rb"

git status

git log --stat -1


# Rebasing
# exersise one: removing file from commit without deleting it.
echo "puts 'bar is OBVIOUSLY better than foo'" > bar.rb

git status

git add -u

git status

git add trash.rb # totally accidental, I swear.

git commit -m "made it even more obvious how superior bar was"

git log --stat -1

# now to do a rebase 


