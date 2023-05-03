# thewiki

The IISERM Wiki

## Editing and Building the wiki

The wiki is built using quarto and deployed to gh-pages, which has a workflow that deploys to the website every push to the gh-pages branch. 

Thus, the steps to edit are

1. You must clone
2. Install [Quarto](https://quarto.org/)
3. Edit files in `./src`
    - [] Make sure you add a page title to every page. See one of the other pages to understand how to do that.
    - [] Make sure you add your name in the `author` section of the page.
    - [] Make sure you add your name in the `index.qmd` file's `author` section.
4. Run `quarto publish gh-pages`
5. Wait.

### Github Actions

You don't need this unless you know what you are doing, or you don't, but nothing else has worked.

Currently, the action is just the default jekyll build action from Github, with the source directory set to `./src`.

