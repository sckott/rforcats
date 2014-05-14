---
layout: default
title: Home
---

## An intro to R for new programmers

This is an introduction to R. I promise this will be fun.  Since you have never used a programming language before, or any language for that matter, you won't be tainted by other programming languages with different ways of doing things. This is good - we can teach you the R way of doing things.

<img src="/assets/img/programmer.png" width="300">

## jsforcats?

Yep, this is a total rip off of [JSforcats.com](http://jsforcats.com) - hopefully Max doesn't mind.

## List of things

* [Using the R console - let's dig our claws in](#rconsole)
* [vectors - the basic R data structure](#vectors)
* [data frames - weird but familiar](#dataframes)
* [lists](#lists)
* [indexing](#indexing)
* [functions](#functions)
* [Using packages](#packages)
* [No no's for cats using R](#nonos)
* [Do do's for cats - or things to do](#dodos)
* [Open data from the web! Cat's love open data](#data)
* [Reading](#reading)
* [Does this site suck?](#makeitbetter)

## <a href="#rconsole" name="rconsole"/>#</a> R console

Writing code is fun. Since you're a cat, not having opposable thumbs may be a bit of an issue, but surely you're clever enough to find a way around that.

So open up R, and you'll see something like this:

<img src="/assets/img/console.png" width="550" border="1">

You can do math:


```r
1 + 1
## [1] 2
```

Type a set of letters together (also known as a _word_) within quotes and the console will print it back to you


```r
"Hello Mr Tickles"
## [1] "Hello Mr Tickles"
```

Another thing you'll want to do as a cat using R is assign things to a name so that you can use it later. This is as if you were a chipmunk and you buried a nut in the ground to dig up later. You can assign anything in R to a name, then use it later (in the current R session of course :)).

Assign the number 5 to the name `mynumber`


```r
mynumber <- 5
```

Later you can use `mynumber`, like adding it to another number


```r
mynumber + 1
## [1] 6
```

Sweet!


## <a href="#vectors" name="vectors"/>#</a> Vectors

Vectors are one of the simplest and common objects in R. Think of a vector like a cat's tail.  Some are short. Some are long. But they are are pretty much the same width - that is, they can only contain a single data type. So a vector can only have all `numeric`, all `character`, all `factor`, etc.

But wait, how do we make a vector? The easiest way is to use a function called `c`. So `c(5,6,7)` will create a vector of numbers 5, 6, and 7. Let's try to put a `character` and a `numeric` together.


```r
c("hello", 5)
## [1] "hello" "5"
```

Notice how the output of the above converted the 5 to a character type with quotes around the `5` to make it `"5"`, i.e., or an object of type _character_.
But we can happily make a vector of the same type of information, like


```r
c(5, 8, 200, 1, 1.5, 0.9)
## [1]   5.0   8.0 200.0   1.0   1.5   0.9
```

Vectors are handy because they can be combined to make other R objects, such as lists (see [lists](#lists) below), and [data frames](#dataframes).

In addition, you can do something to each part of the vector. Let's say you have a vector of three types of dog:


```r
dogs <- c('dalmatians','retrievers','poodles')
```

You can add something to each of them like


```r
paste(dogs, "are silly")
## [1] "dalmatians are silly" "retrievers are silly" "poodles are silly"
```

## <a href="#dataframes" name="dataframes"/>#</a> Data frames

A `data.frame` is one of the most commonly used objects in R. Just think of a `data.frame` like a table, or a spreadsheet, with rows and columns and numbers, text, etc. in the cells. A very special thing about the `data.frame` in R is that it can handle multiple types of data - that is, each column can have a different type. Like in the below table the first column is of `numeric` type, the second a `factor`, and the third `character`.



```r
df <- data.frame(hey=c(5,6,7),
           there=as.factor(c("a","b","c")),
           fella=c("blue","brown","green"))
```


```r
df
##   hey there fella
## 1   5     a  blue
## 2   6     b brown
## 3   7     c green
```

Notice that the first _column_ of numbers are actually row names, and are not part of the `data.frame` _per se_, though are part of the _metadata_ for the `data.frame`.

We can quickly get a sense for the type of data in the `df` object by using the function `str`, which gives information on the types of data in each column.


```r
str(df)
## 'data.frame':	3 obs. of  3 variables:
##  $ hey  : num  5 6 7
##  $ there: Factor w/ 3 levels "a","b","c": 1 2 3
##  $ fella: Factor w/ 3 levels "blue","brown",..: 1 2 3
```

__Matrices__

Think of a matrix in R like a `data.frame` with all the same type of data, only numeric, only character, etc. A matrix is technically a special case of a [two-dimensional array](link).  

We'll not dig into these further since I'm guessing since you're a cat, you'll be more of a `data.frame` kind of animal.

If someone wants to write more about matrices, [do so](/Contribute).

## <a href="#lists" name="lists"/>#</a> Lists

Lists are sorta crazy. They are kinda like vectors, but not. Using our cat tail analogy again, lists are like cat tails in that they can be short or long, but they can also vary in width. That is, they can hold any type of object. Whereas vectors can only hold one type of object (only `character` for example), lists can hold for example, a `data.frame` and a `numeric`, or a `data.frame` and another `list`!  The way we make a list is via the function `list`


```r
list(1, "a")
```

```
## [[1]]
## [1] 1
## 
## [[2]]
## [1] "a"
```

A nested list


```r
mylist <- list(1, list("a","b","c"))
mylist
## [[1]]
## [1] 1
## 
## [[2]]
## [[2]][[1]]
## [1] "a"
## 
## [[2]][[2]]
## [1] "b"
## 
## [[2]][[3]]
## [1] "c"
```

Just like vectors, you can do operations on each element of the list. However, since lists can be nested you have to worry about what level of nesting you want to manipulate.

For example, if we take the `mylist` list from above, the following


```r
length(mylist[1])
## [1] 1
length(mylist[2])
## [1] 1
```

Gives a length of 1 for each element of the list. But wait, aren't there three things in the second slot of the list ("a","b","c")?  Indeed there are


```r
length(mylist[2][[1]])
## [1] 3
```

## <a href="#indexing" name="indexing"/>#</a> Indexing

Okay, so let's say you have made a `vector`, `list`, or `data.frame`. How do you get to the things in them? Its slightly different for each one.

There is a general way to index objects in R that can be used across `vectors`, `lists`, and `data.frame`.  That is the square bracket: `[]`.  For some objects you can index by the sequence number (e.g., `5`) of the thing you want, while with others you can do that, but also index by the character name of the thing (e.g., `kitty`).

**vectors**

Vectors only have one dimension, as we said above. So with `[]` there is only one number to give here. For example, let's say we have the vector


```r
bb <- c(5,6,7)
```

We can index to each of those 3 numbers by the sequence of it's place in the vector. Get the 6 by doing


```r
bb[2]
## [1] 6
```

You can also have a named vector. What's that?  A named vector is like `bb` above, but each of the three elements has a name.


```r
bb <- c(5,6,7)
names(bb) <- c('hey','hello','wadup')
bb
##   hey hello wadup 
##     5     6     7
names(bb)
## [1] "hey"   "hello" "wadup"
```

With a named vector we can get to each element in the vector using it's name with a single set, or double set of brackets to get the value, or the value and name, respectively.


```r
bb['hello']
## hello 
##     6
```


```r
bb[['hello']]
## [1] 6
```

Fun.

**lists**

Indexing on lists is similar to vectors. A huge difference though is that lists can be nested. So there could be infinite things within each slot of a list.

For example, let's say we have the nested list from above `mylist`


```r
mylist <- list(foo=1, bar=list("a","b","c"))
```

We can index to the first item in the list, including it's name, by


```r
mylist[1]
## $foo
## [1] 1
```

Or equivalently


```r
mylist['foo']
## $foo
## [1] 1
```

And get just the value by using two `[`


```r
mylist[[1]]
## [1] 1
```

Or equivalently


```r
mylist[['foo']]
## [1] 1
```

And get the second item in `mylist` by


```r
mylist[2] # or mylist['bar']
## $bar
## $bar[[1]]
## [1] "a"
## 
## $bar[[2]]
## [1] "b"
## 
## $bar[[3]]
## [1] "c"
```


```r
mylist[[2]] # or mylist[['bar']]
## [[1]]
## [1] "a"
## 
## [[2]]
## [1] "b"
## 
## [[3]]
## [1] "c"
```

And get to the individual elements within `bar` by


```r
mylist[[2]][1]
## [[1]]
## [1] "a"
```

And so on to get to what you need.

There are a number of convenience functions to make working with lists easier, but you can learn about those later.

**data.frame and matrix**

Indexing on a `data.frame` and `matrix` is similar. Both have two things to index on: rows and columns. Within `[,]`, the part before the comma is for rows, and the part after the comma for columns. So if you have a data frame `iris` in R,


```r
head(iris)
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

you can index to the third row and second column by doing


```r
iris[3,2]
## [1] 3.2
```

You can also use names to index if you have named rows or columns. For example,


```r
iris[2,"Species"]
## [1] setosa
## Levels: setosa versicolor virginica
```

You can also use the `$` symbol to index to a column, like


```r
mtcars$mpg
##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
## [15] 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
## [29] 15.8 19.7 15.0 21.4
```

## <a href="#functions" name="functions"/>#</a> Functions

Cats are the type of feline to love functions. Functions make your life easier by allowing you to generalize many lines of code, and avoiding repeating yourself. Functions make your work tidier - just like cats like it.

Functions are written like this

```r
foo <- function(){
  writeLines("I hate dogs")
}
```

After defining this function we can then call it later like this


```r
foo()
```

```
## I strongly dislike dogs
```

Yay! Dumb dogs.

The `foo` function was pretty simple. We can also pass in parameters to the function.


```r
foo <- function(mess){
  writeLines(mess)
}
```


```r
foo("I strongly dislike dogs")
## I strongly dislike dogs
```

And set parameters to default values.


```r
foo <- function(mess = "I strongly dislike dogs"){
  writeLines(mess)
}
```


```r
foo()
## I strongly dislike dogs
foo("Well, I dislike most dogs, but I like the one in my house")
## Well, I dislike most dogs, but I like the one in my house
```

Generally, if you are writing more than 3 lines of code to do any particular task you may as well write a function to do that task, making it reusable and (hopefully) more general. For more justification for this google the _DRY principle_.

## <a href="#packages" name="packages"/>#</a> Using packages

A lot of the functionality in R is in extensions to the language, called packages. Since you're a cat, you can think of packages like boxes that you put a bunch of code in. Since you are putting code in this box you probably don't want to sit in it :). These boxes generally hold a similar set of functions (see [functions](#functions) above). A package allows you and others to

* Easily install and load the code
* Incorporate documentation
* Lessen conflicts with functions in other packages (don't worry about why for now, but if you want to know [go here](http://adv-r.had.co.nz/Namespaces.html))

Most people that make R packages share them on a site on the interwebs called CRAN (don't worry about what it stands for) here [CRAN](http://cran.r-project.org/).

The humans behind CRAN have done a good job making sure that in most cases packages you install from CRAN will work on your computer, whether Linux, Windows, or OSX.

Installation is super easy. Do `install.packages("package_name")`, where `package_name` is the name of the package you want to install. Remember that the package name is case sensitive! Or if you're using RStudio you can go to the _Packages_ pane.

Once the package is installed you have to load the package in to your R session. That's easy too! Do `library('package_name')`, or if you're in RStudio go to the _Packages_ pane.

_Note: Package creation is out of scope for this site, but Hadley has made it much easier with [devtools](https://github/com/hadley/devtools)._

## <a href="#nonos" name="nonos"/>#</a> No no's for cats using R

There are a few R gotchas to avoid cat friends.

* `attach()`: Don't use it. Just don't.
* When doing `library()` or `require()` use the package name in quotes as package name without quotes is sugar, but can cause problems.
* Make sure to keep your claws trimmed so they don't get stuck in spaces between the keys.

## <a href="#dodos" name="dodos"/>#</a> Do do's for cats using R

* Do combine code and text with `Markdown` or `LaTeX` to have reproducible documents, using `knitr`.
* When googling for R help, use `cran`, not `r`
* When asking questions on Twitter/Appdotnet/G+/etc. use `#rstats`
* Do ask lots of questions on StackOverflow (use the `[r]` tag), Twitter (does this need saying), etc. But make sure to do your research before asking, and [include a reproducible example](http://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example)!
* `.rda`, `.rds`, `.RData` compressed files are useful, but for reproducibility purposes, use non-R specific file formats like `.csv`, `.xml`, `.json`, etc.

## <a href="#data" name="data"/>#</a> Data from the web

This is sort of an advanced R topic, but hey, how else do we get cute cat pictures? That's the point of the internet after all - to serve cat pictures.

Install `cowsay`


```r
install.packages("devtools")
library("devtools")
install_github("sckott/cowsay")
```

Now let's get a cat fact!


```r
library("cowsay")
say("catfact", "cat")
```

```
## 
## 
##  ----- 
##  The average lifespan of an outdoor-only cat is about 3 to 5 years while an indoor-only cat can live 16 years or much longer. 
##  ------ 
##     \   
##      \
##                \`*-.
##                  )  _`-.
##                 .  : `. .
##                 : _   '  
##                 ; *` _.   `*-._
##                 `-.-'          `-.
##                   ;       `       `.
##                   :.       .       \
##                   .\  .   :   .-'   .
##                   '  `+.;  ;  '      :
##                   :  '  |    ;       ;-.
##                   ; '   : :`-:     _.`* ;
##                .*' /  .*' ; .*`- +'  `*'
##                `*-*   `*-*  `*-*'
## 
```
A little explanation is in order me thinks. There are a few things going on in the last thing we just did. The `say` function looks like sorta like this:

```coffee
say <- function(what, by, type){
  <== some ascii art ==>
  url <- "http://catfacts-api.appspot.com/api/facts?number=1"
  what <- fromJSON(url)$facts
  message(sprintf(by, what))
}
```

The first line is a bunch of ascii characters to make a cat. The second line defines the url for the cat facts API. The third line retrieves one cat fact from the cat facts API. And the fourth line prints the messages with a cat.

> But what is an API? I'm a cat, I only drink water or milk (preferably milk) - but at least I've heard of an IPA. What the rat's ass (yum) is an API.

Okay, here goes. An API stands for Application Programming Interface. It's just a set of instructions for two computers to talk to each other. It's sorta like if you run into another cat and if you both knew beforehand a lot about each other, you would have a sense for how to behave - if you don't know each other, then best of luck to you Mr. Tickles.

**Another example**

Above, we learned about writing functions. Let's create a function to generate a markdown image link for a cute cat in various sizes (by pixels) from the website [placekitten.com](http://placekitten.com/). This is a awesome, but simple web service. You just use ask for the image size by adding two numbers at the end. For example, `http://placekitten.com/g/300/300` gives an image that is 300 by 300 pixels.


```r
getcutecat <- function(x){
  writeLines(
    sprintf("![](http://placekitten.com/g/%s/%s)", x, x)
  )
}
```

300 pixels


```r
getcutecat(300)
## ![](http://placekitten.com/g/300/300)
```

![some kittens](http://placekitten.com/g/300/300)

400 pixels


```r
getcutecat(400)
## ![](http://placekitten.com/g/400/400)
```

![some kittens](http://placekitten.com/g/400/400)

## <a href="#doge" name="doge"/>#</a> ***Hey! R is not just for cats!*** - dogs

R and web APIs are open to all sorts of animals.  For instance, the [dogr.io](http://dogr.io) service will create a "doge" style meme for you when provided with text.  Let's write another function to call this API:


```r
getdoge <- function(x){
  x = paste(x, collapse="/")
  writeLines(
    sprintf("![](http://dogr.io/%s.png)", x)
  )
}
```


```r
getdoge(c("wow", "suchhostility", "bemoreinclusive"))
## ![](http://dogr.io/wow/suchhostility/bemoreinclusive.png)
```

<img src="http://dogr.io/wow/suchhostility/bemoreinclusive.png" width="400"/>

***Now, back to your regular, cat-dominated tutorial.***

## <a href="#reading" name="reading"/>#</a> Reading

After this basic intro you'll want to head over to:

* What do you think should go here? say so [here](https://github.com/sckott/rforcats/issues)

And for even more advanced R:

* [Advanced R, by Hadley Wickham](http://adv-r.had.co.nz/)

## <a href="#makeitbetter" name="makeitbetter"/>#</a> Make it better

Contribute by following [these instructions](/Contribute).

## <a href="#catslover" name="catslover"/>#</a> Cat's love R

<img src="/assets/img/leo_giffed.gif" width="300">

## <a href="#license" name="license"/>#</a> License
