# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default

git checkout -b handling_mistakes

echo -e "puts 'hello'\nbyebug\nputs 'world'" > foo.rb

echo "puts 'bar'"> bar.rb

git add foo.rb

git commit -m "added foo.rb hello world script"

git status

git add bar.rb

git commit --amend -m "added foo.rb and bar.rb hello world scripts"

git status

git log --stat -1

git diff HEAD^

echo -e "puts 'hello'\nputs 'world'" > foo.rb

git diff

git add foo.rb

git commit --amend -m "added foo.rb and bar.rb hello world scripts"

git log --stat -1

echo "this file is trash" > trash.rb

echo "puts 'bar is better than foo'"  > bar.rb

git status

git add bar.rb

git add trash.rb

git status

git reset HEAD trash.rb

git status

git commit -m "indicated the superiority of bar in bar.rb"

git status

git log --stat -1

echo "puts 'bar is OBVIOUSLY better than foo'" > bar.rb

git status

git add -u

git status

git add trash.rb # totally accidental, I swear.

git commit -m "made it even more obvious how superior bar was"

git log --stat -1


