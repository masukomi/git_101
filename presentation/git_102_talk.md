#[fit] Git 102
# by @masukomi

^
This document designed for use with [Deckset](http://www.decksetapp.com/)
The `---` lines are slide dividers.
Everything after a `^` (like this) is a presenter's note.

---

#[fit] Q: What's the difference 
#[fit] between a clone & a fork?

![fit left](images/clone_trooper.png)![fit right](images/fork.png)

---

#[fit] A: Forks live on GitHub

![left filtered](images/fork.png)

---

#[fit] Q: What is a tree-ish?

![fit](images/tree.png)

---

#A: *anything* that 
#points to a commit

* `master` # any branch name
* `1.4.0` # any tag name
* `da420fac92e619f2071a1a027eef3d5687c6f74c`
* `da420fac`
* `HEAD`
* `HEAD^` #each ^ is one ancestor prior
* `da420fac^`

---

# But wait, there's more!

* `HEAD~3` # 3 commits before head
* `HEAD@{3}` # 3 commits before head
* `master@{yesterday}` # where master was yesterday
* `master@{1.week.ago}` # where master was a week ago

---

#[fit] Q: Why is it called
#[fit] a "tree-ish"

---

#[fit] A: It indicates a point 
#[fit] in Git's commit *tree*

---

#[fit] Q: What is a branch?
#[fit] (under the covers)

---

#[fit] A: A pointer to a tree-ish

	$ cat .git/refs/heads/master
	da420fac92e619f2071a1a027eef3d5687c6f74c
	
Specifically, a file in `.git/refs/heads`. The file name is the branch name. The contents are the most recent treeish.

---

#[fit] Q: What does "HEAD" 
#[fit] point to?

----

#[fit] A: The tip of a branch
#[fit] *or* a tree-ish

	$ cat .git/HEAD
	ref: refs/heads/master
	$ git checkout HEAD^^
	$ cat .git/HEAD
	9bf82346f0bc9c79a3efa5a7caaf79ced443f63f
	

---

#[fit] Q: why are there 2 urls for remotes?

	$ git remote -v
	origin git@github.com:ChasManRors/git_101.git (fetch)
	origin git@github.com:ChasManRors/git_101.git (push)
	upstream git@github.com:masukomi/git_101.git (fetch)
	upstream git@github.com:masukomi/git_101.git (push)

^ 
A: because you can have push and fetch go to different ones.

---

#[fit] How to *prevent accidental* 
#[fit] *pushes* to upstream?

	git remote set-url --push upstream you_shouldnt_be_pushing_to_upstream

That gives us: 

	$ git remote -v
	origin git@github.com:ChasManRors/git_101.git (fetch)
	origin git@github.com:ChasManRors/git_101.git (push)
	upstream git@github.com:masukomi/git_101.git (fetch)
	upstream you_shouldnt_be_pushing_to_upstream (push)

---

##[fit] Live Coding!

---

#[fit] Thank You

# Questions? 
## @masukomi on twitter

---

# Image Credits

* Clone Trooper designed by [ARudmann](http://www.thenounproject.com/ARudmann)- from the [Noun Project](http://www.thenounproject.com)
* Tree designed by [Co-Effect Creative](http://www.thenounproject.com/thecoeffect) 