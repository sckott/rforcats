### Contributing to rforcats

1. Fork this repo to your account
2. Clone down to your machine from your account
3. Add an upstream remote for the `sckott/rforcats` repo by doing `git remote add upstream git@github.com:sckott/rforcats.git`
4. Make a new feature branch
5. The only file to change is `index.Rmd`. It's a R markdown document, so should be easy enough to add to/change. After you make your changes, run `knit("index.Rmd")` in R, which will build a new `index.md`. If you have time/interest, also build the html page by doing `jekyll build`. This requires `jekyll` of course. You can also preview the site by doing `jekyll serve`, then navigate in your browser to [http://localhost:4000/](http://localhost:4000/).  
6. Commit those changes and push to your account
7. Send a pull request to `sckott/rforcats`

If you want to submit an issue (bug report/question), then go to the [issues page](https://github.com/sckott/rforcats/issues?state=open) and do that.

Thanks for contributing whether you or your cat!!!!!
