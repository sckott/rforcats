---
layout: page
title: Contribute
---

* [How to contribute](#howcontrib)
    * [Cats for git!!](#git)
    * [What's git?](#nogit)
* [Contributors](#contributors)

## <a href="#howcontrib" name="howcontrib"/>#</a> How to contribute

<a href="#git" name="git"/>#</a> __If you like git__

The code is at [https://github.com/sckott/rforcats](https://github.com/sckott/rforcats)

1. Fork the repo to your account
2. Clone down to your machine from your account
3. Add an upstream remote for the `sckott/rforcats` repo by doing `git remote add upstream git@github.com:sckott/rforcats.git`
4. Make a new feature branch
5. The only file to change is `index.Rmd`. It's a R markdown document, so should be easy enough to add to/change. After you make your changes, run `knit("index.Rmd")` in R, which will build a new `index.md`. If you have time/interest, also build the html page by doing `jekyll build`. This requires `jekyll` of course. You can also preview the site by doing `jeyll serve`, then navigate in your browser to [http://localhost:4000/](http://localhost:4000/).  
6. Commit those changes and push to your account
7. Send a pull request to `sckott/rforcats`

If you want to submit an issue (bug report/question), then go to the [issues page](https://github.com/sckott/rforcats/issues?state=open) and do that.

Thanks for contributing whether you or your cat wrote the code!!!!!

<a href="#nogit" name="nogit"/>#</a> __If you don't like git (or, _I don't know what git is_)__

1. Go to the [index.Rmd file](https://github.com/sckott/rforcats/blob/gh-pages/index.Rmd) in the rforcats github repo
2. Edit whatever you want
3. Then write a message in the box at the bottom, and press the green button _Propose file change_. This will make a fork of the repo to your github account. You then can write any other message you want and press another green button _Send pull request_
4. The end!

## <a href="#contributors" name="contributors"/>#</a> Contributors

### people

* Scott Chamberlain [@sckott](https://github.com/sckott)
* Carson Sievert [@cpsievert](https://github.com/cpsievert)
* Ben Marwick [@benmarwick](https://github.com/benmarwick)
* Noam Ross [@noamross](https://github.com/noamross)
* You?

### cats

* the orange one at the bottom of the page: _Leo_ (aka _boom boom_, _muffin_, or _goosie_)
* your cat?
