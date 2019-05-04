# Datafest2019Repo

## Getting the Repo on your local machine

 First Step is to make sure you download git at https://git-scm.com/downloads

Then, click the green clone button on this repository and copy the url.

Open a terminal window, navigate to where you want the git repo folder to be, and type: `git clone <url>`

It will ask you to log in as well.

After successful authentication, you should have the git repo

## Setting up your own branch

When you clone the repo first, you will be on the master branch.

Open the folder with the git repo in terminal and type: `git branch <your branch name>`

Type `git checkout <your branch name` and you will be in your branch.

Here, you can make changes freely and it wont affect others.

## Editing and adding files

You can edit files as you normally would.

For a file to be part of the git repo you need to add it first.

Use `git status` in the git repo to see untracked files

Use `git add <file name>` to add untracked files to the staging status. (Becareful not to add unnecessary files!)

If a file has been edited, it will show up as 'modified' when you use git status

You also need to use add git to add it to staging.

Once you have all the files you want staged, use `git commit -m "<description>"` to commit the changes to your local repo.

To make the changes appear in the cloud repo you need to push your commits.

## Pushing changes onto the cloud repo

The first time you push onto the cloud repo you will want to type `git push -u origin <your branch name>`

After that first time, you can just use `git push`
