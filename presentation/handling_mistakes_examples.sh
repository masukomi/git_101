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
git difftool --tool=Kaleidoscope HEAD^

# let's get rid of byebug
echo -e "puts 'hello'\nputs 'world'" > foo.rb

git diff

git add foo.rb

git commit --amend -m "added foo.rb and bar.rb hello world scripts"

git log --stat

# what if we want to back up 
# and explore 
# a different solution to a problem?

# first i want you to note what HEAD is 
# currently pointed to

cat .git/HEAD

git checkout HEAD^

# DETACHED HEAD NOW
# this is when HEAD is NOT
# pointing to the tip of a branch
cat .git/HEAD

echo "another bogus file" > bogus.txt
git add bogus.txt
git commit -m "added bogus file" 

git branch

# just to show it could be done
git checkout -b back_one_step

git log --left-right --graph --cherry-pick --oneline handling_mistakes..back_one_step


git log --left-right --graph --cherry-pick --oneline back_one_step..handling_mistakes

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


# update git's knowledge of the remote repo
git fetch 

git branch -a | grep back_one_step

######### stash 
# let's play with stash


#edit an existing file
echo "puts 'stuff in existing file'"  > bar.rb

# create a new file
echo "some bogus stuff" > bogus.txt

git status

# stash it.
# and note that it tells you what branch
# the stash was made against
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
# note that this *can* result in a conflict

git status
# changes are back
# note that it's gone from the list
git stash list

# let's save it again with a more 
# useful message
git stash save "stashing bogus stuff"
git stash list
# note that now it tells us the branch and our message



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

rm bogus.txt

### END STASH
#############################

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

# This hasn't been committed yet.
# How do we remove it from the index
# without deleting the file?

git reset HEAD trash.rb


git status
# note that it's not longer
# in "Changes to be commited"
# BUT it hasn't been deleted.

# So, now we're good to commit
git commit -m "indicated the superiority of bar in bar.rb"

git status

git log --stat -1


# exersise one: removing file from commit without deleting it.
echo "puts 'bar is OBVIOUSLY better than foo'" > bar.rb

git status

git add -u

git status

git add trash.rb # totally accidental, I swear.

git commit -m "made it even more obvious how superior bar was"

git log --stat -1

# Does not touch the index file or the working tree at all,
# but resets the head to <commit>
git reset --soft HEAD^

git log --stat -1

git status
# because we've moved HEAD, it's now at a point 
# where trash.rb didn't exist 
# so, now we resolve it the same way we
# did before
git reset HEAD trash.rb

### ok, but what happens when the bad add
# is in a prior commit.
git add trash.rb
git commit -m "added changes to bar and *accidentally* added trash"


echo 'puts "yet another silly change"' > bar.rb
git add -u
git commit -m "just moving things along a commit"

git log

### END AUTOMATED

# we're going to start a rebase
# git rebase -i HEAD^^
# edit the appropriate commit


# git log --stat
#  note that the commit we want to edit has already been applied
# git reset HEAD^
#   effectively undoes that commit and leaves the modified files unstaged
# git add bar.rb
# git commit -m "edited bar (without trash.rb now)"
# git log
#   that first commit, our new commit
#   but not the just moving things along commit

# git rebase --continue
# git log
#   and now we have the "just moving things along"
#   commit back. :)
