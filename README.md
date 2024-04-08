# git-basics-example

The purpose of this repository is to show off the git flow for use in @kfcampbell's "git basics" demonstration.

## Usage

To run the script, open a terminal and execute `./facts.sh`.

(For Keegan, to separate dummy auth from his machine's auth):
To build the Dockerfile, run `docker build -t facts .` To run the container, run `docker run --rm -it facts`. To connect to that container from VS Code, open the Command Palette and run Attach to Running Container.

## `git` command reference

### Branching

- `git branch`
	- show branches and see what branch you're on
- `git switch -c yourNewBranch`
	- create a new branch and switch to it
- `git switch yourExistingBranch`
	- switch to an existing branch
- `git branch -D yourExistingBranch`
	- delete a branch (uppercase D because we want to delete it even if it's not fully merged)

## Commit loop

- `git status`
	- what's changed since the last commit?
- `git add {fileOrPatternMatcher}` to stage file for commit
- `git restore --staged {fileOrPatternMatcher}` to unstage file(s) for commit
- `git commit -m "{yourMessage}"` to add a commit with a simple message
- `git reset HEAD~1` to "undo" a local commit
- `git commit --amend` to alter a commit message

## Commit log

- `git log` to show all commits on a branch
- `git show {commitSHAOrBranch}` to view details of a single commit

## Remote sync

- `git pull` to fetch changes from the remote and merge them into your local branch
- `git push` to push local changes to the remote
- `git remote  -v` to show all remotes
