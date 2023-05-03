# thewiki

The IISERM Wiki

## Editing and Building the wiki

The wiki is built using a github action so that every commit/push to the repo triggers a jekyll build from `./src` and deploys to <https://iiserm.github.io/thewiki>

So just change content in `./src` in markdown files and commit/push.

### Github Actions

You don't need this unless you know what you are doing, or you don't, but nothing else has worked.

Currently, the action is just the default jekyll build action from Github, with the source directory set to `./src`.

