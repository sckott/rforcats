---
title: "Home"
layout: default
---





## An intro to R for new programmers

This is an introduction to R. I promise this will be fun.  Since you have never used a programming language before, or any language for that matter, you won't be tainted by other programming languages with different ways of doing things. This is good - we can teach you the R way of doing things.

<img src="/assets/img/programmer.png" width="300">

## jsforcats?

Yep, this is a total rip off of [JSforcats.com](http://jsforcats.com) - hopefully [Max](http://maxogden.com/) doesn't mind.

## List of things

* [Using the R console - let's dig our claws in](#rconsole)
* [vectors - the basic R data structure](#vectors)
* [data frames - weird but familiar](#dataframes)
* [lists](#lists)
* [indexing](#indexing)
* [functions](#functions)
* [pipes](#pipes)
* [Using packages](#packages)
* [No no's for cats using R](#nonos)
* [Do do's for cats - or things to do](#dodos)
* [Open data from the web! Cat's love open data](#data)
* [Reading](#reading)
* [Does this site suck?](#makeitbetter)

## <a href="#rconsole" name="rconsole">#</a> R console

Writing code is fun. Since you're a cat, not having opposable thumbs may be a bit of an issue, but surely you're clever enough to find a way around that.

So open up R, and you'll see something like this:

<img src="/assets/img/console.png" width="550" border="1">

You can do math:


```r
1 + 1
#> [1] 2
```

Strings are always fun to start with, type a set of letters together within quotes and the console will print it back to you


```r
"Hello Mr Tickles"
#> [1] "Hello Mr Tickles"
"This is a string"
#> [1] "This is a string"
```
Double quotes and single quotes are more or less interchangable, but is better practice to stick with double quotes.

Another thing you'll want to do as a cat using R is assign things to a name so that you can use it later. Think of this as being if you were a chipmunk and you buried a nut in the ground to dig up later. You can assign anything in R to a name, then use it later (in the current R session of course :)).

Assign the number 5 to the name `mynumber`


```r
mynumber <- 5
```

Later you can use `mynumber`, like adding it to another number


```r
mynumber + 1
#> [1] 6
```

Sweet!


## <a href="#vectors" name="vectors">#</a> Vectors

Vectors are one of the simplest and common objects in R. Think of a vector like a cat's tail.  Some are short. Some are long. But they are are pretty much the same width - that is, they can only contain a single data type. So a vector can only have all `numeric`, all `character`, all `factor`, etc.

But wait, how do we make a vector? The easiest way is to use a function called `c`. So `c(5,6,7)` will create a vector of numbers 5, 6, and 7. Let's try to put a `character` and a `numeric` together.


```r
c("hello", 5)
#> [1] "hello" "5"
```

Notice how the output of the above converted the 5 to a character type with quotes around the `5` to make it `"5"`, i.e., or an object of type _character_.
But we can happily make a vector of the same type of information, like


```r
c(5, 8, 200, 1, 1.5, 0.9)
#> [1]   5.0   8.0 200.0   1.0   1.5   0.9
```

Vectors are handy because they can be combined to make other R objects, such as lists (see [lists](#lists) below), and [data frames](#dataframes).

In addition, you can do something to each part of the vector. Let's say you have a vector of three types of animals:


```r
animals <- c("birds", "squirrels", "fish")
```

You can add something to each of them like


```r
paste(animals, "are silly")
#> [1] "birds are silly"     "squirrels are silly" "fish are silly"
```

## <a href="#dataframes" name="dataframes">#</a> Data frames

A `data.frame` is one of the most commonly used objects in R. Just think of a `data.frame` like a table, or a spreadsheet, with rows and columns and numbers, text, etc. in the cells. A very special thing about the `data.frame` in R is that it can handle multiple types of data - that is, each column can have a different type. Like in the below table the first column is of `numeric` type, the second a `factor`, and the third `character`.



```r
df <- data.frame(hey = c(5, 6, 7),
           there = as.factor(c("a", "b", "c")),
           fella = c("blue", "brown", "green"))
```


```r
df
#>   hey there fella
#> 1   5     a  blue
#> 2   6     b brown
#> 3   7     c green
```

Notice that the first _column_ of numbers are actually row names, and are not part of the `data.frame` _per se_, though are part of the _metadata_ for the `data.frame`.

We can quickly get a sense for the type of data in the `df` object by using the function `str`, which gives information on the types of data in each column.


```r
str(df)
#> 'data.frame':	3 obs. of  3 variables:
#>  $ hey  : num  5 6 7
#>  $ there: Factor w/ 3 levels "a","b","c": 1 2 3
#>  $ fella: chr  "blue" "brown" "green"
```

__Matrices__

Think of a matrix in R like a `data.frame` with all the same type of data, only numeric, only character, etc. A matrix is technically a special case of a two-dimensional array.


```r
mat <- matrix(c(1, 2, 3, 11, 12, 13), nrow = 2, ncol = 3)
```


```r
mat
#>      [,1] [,2] [,3]
#> [1,]    1    3   12
#> [2,]    2   11   13
```

## <a href="#lists" name="lists">#</a> Lists

Lists are sorta crazy. They are kinda like vectors, but kinda not. Using our cat tail analogy again, lists are like cat tails in that they can be short or long, but they can also vary in width. That is, they can hold any type of object. Whereas vectors can only hold one type of object (only `character` for example), lists can hold for example, a `data.frame` and a `numeric`, or a `data.frame` and another `list`!  The way we make a list is via the function `list`


```r
list(1, "a")
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] "a"
```

A nested list


```r
mylist <- list(1, list("a", "b", "c"))
mylist
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] "a"
#> 
#> [[2]][[2]]
#> [1] "b"
#> 
#> [[2]][[3]]
#> [1] "c"
```

Just like vectors, you can do operations on each element of the list. However, since lists can be nested you have to worry about what level of nesting you want to manipulate.

For example, if we take the `mylist` list from above, and perform the following:


```r
length(mylist[1])
#> [1] 1
length(mylist[2])
#> [1] 1
```

This gives a length of 1 for each element of the list. But wait, aren't there three things in the second slot of the list ("a", "b", "c")? Indeed there are


```r
length(mylist[2][[1]])
#> [1] 3
```

## <a href="#indexing" name="indexing">#</a> Indexing

Okay, so let's say you have made a `vector`, `list`, or `data.frame`. How do you get to the things in them? Its slightly different for each one.

There is a general way to index objects in R that can be used across `vectors`, `lists`, and `data.frame`. That is the square bracket: `[]`. For some objects you can index by the sequence number (e.g., `5`) of the thing you want, while with others you can do that, but also index by the character name of the thing (e.g., `kitty`).

**vectors**

Vectors only have one dimension, as we said above. So with `[]` there is only one number to give here. For example, let's say we have the vector


```r
bb <- c(5, 6, 7)
```

We can index to each of those 3 numbers by the sequence of its place in the vector. Get the 6 by doing


```r
bb[2]
#> [1] 6
```

You can also have a named vector. What's that? A named vector is like `bb` above, but each of the three elements has a name.


```r
bb <- c(5, 6, 7)
names(bb) <- c("hey", "hello", "wadup")
bb
#>   hey hello wadup 
#>     5     6     7
names(bb)
#> [1] "hey"   "hello" "wadup"
```

With a named vector we can get to each element in the vector using its name with a single set, or double set of brackets to get the value, or the value and name, respectively.


```r
bb["hello"]
#> hello 
#>     6
```


```r
bb[["hello"]]
#> [1] 6
```

Fun.

**lists**

Indexing on lists is similar to vectors. A huge difference though is that lists can be nested. So there could be infinite things within each slot of a list.

For example, let's say we have the nested list from above `mylist`


```r
mylist <- list(foo = 1, bar = list("a", "b", "c"))
```

We can index to the first item in the list, including its name, by


```r
mylist[1]
#> $foo
#> [1] 1
```

Or equivalently


```r
mylist["foo"]
#> $foo
#> [1] 1
```

And get just the value by using two `[`


```r
mylist[[1]]
#> [1] 1
```

Or equivalently


```r
mylist[["foo"]]
#> [1] 1
```

And get the second item in `mylist` by


```r
mylist[2] # or mylist["bar"]
#> $bar
#> $bar[[1]]
#> [1] "a"
#> 
#> $bar[[2]]
#> [1] "b"
#> 
#> $bar[[3]]
#> [1] "c"
```


```r
mylist[[2]] # or mylist[["bar"]]
#> [[1]]
#> [1] "a"
#> 
#> [[2]]
#> [1] "b"
#> 
#> [[3]]
#> [1] "c"
```

And get to the individual elements within `bar` by


```r
mylist[[2]][1]
#> [[1]]
#> [1] "a"
```

And so on to get to what you need.

There are a number of convenience functions to make working with lists easier, but you can learn about those later.

**data.frame and matrix**

Indexing on a `data.frame` and `matrix` is similar. Both have two things to index on: rows and columns. Within `[,]`, the part before the comma is for rows, and the part after the comma for columns. So if you have a data frame `iris` in R,


```r
head(iris)
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa
```

You can index to the third row and second column by doing


```r
iris[3, 2]
#> [1] 3.2
```

You can also use names to index if you have named rows or columns. For example,


```r
iris[2, "Species"]
#> [1] setosa
#> Levels: setosa versicolor virginica
```

You can select the entire second row like this


```r
iris[2, ]
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 2          4.9           3          1.4         0.2  setosa
```


If now your data frame is `mtcars`, you can get its first column by doing 



```r
mtcars[, 1]
#>  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
#> [29] 15.8 19.7 15.0 21.4
```

You can also use the `$` symbol to index to a column, like


```r
mtcars$mpg
#>  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
#> [29] 15.8 19.7 15.0 21.4
```

## <a href="#functions" name="functions">#</a> Functions

Cats are the type of feline to love functions. Functions make your life easier by allowing you to generalize many lines of code, and avoiding repeating yourself. Functions make your work tidier - just like cats like it.

Functions are written like this


```r
foo <- function(){
  writeLines("I strongly dislike dogs")
}
```

After defining this function we can then call it later like this


```r
foo()
```

```
#> I strongly dislike dogs
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
#> I strongly dislike dogs
```

And set parameters to default values.


```r
foo <- function(mess = "I strongly dislike dogs"){
  writeLines(mess)
}
```


```r
foo()
#> I strongly dislike dogs
foo("Well, I dislike most dogs, but I like the one in my house")
#> Well, I dislike most dogs, but I like the one in my house
```

Generally, if you are writing more than 3 lines of code to do any particular task you may as well write a function to do that task, making it reusable and (hopefully) more general. For more justification for this Google the _DRY principle_.

## <a href="#packages" name="packages">#</a> Using packages

A lot of the functionality in R is in extensions to the language, called packages. Since you're a cat, you can think of packages like boxes that you put a bunch of code in. Since you are putting code in this box you probably don't want to sit in it :). These boxes generally hold a similar set of functions (see [functions](#functions) above). A package allows you and others to

* Easily install and load the code
* Incorporate documentation
* Lessen conflicts with functions in other packages (don't worry about why for now, but if you want to know [go here](http://adv-r.had.co.nz/Namespaces.html))

Most people that make R packages share them on a site on the interwebs called [CRAN](https://cran.rstudio.com/) (don't worry about what it stands for).

The humans behind CRAN have done a good job making sure that in most cases packages you install from CRAN will work on your computer, whether Linux, Windows, or OS X.

Installation is super easy. Do `install.packages("package_name")`, where `package_name` is the name of the package you want to install. Remember that the package name is case sensitive! Or if you're using RStudio you can go to the _Packages_ pane.

Once the package is installed you have to load the package in to your R session. That's easy too! Do `library('package_name')`, or if you're in RStudio go to the _Packages_ pane.

_Note: Package creation is out of scope for this site, but Hadley has made it much easier with [devtools](https://github.com/hadley/devtools)._

## <a href="#pipes" name="pipes">#</a> Pipes

<img src="/assets/img/pipe_gif.gif" width="300">

Pipes have only been recently introduced in base R, but are a concept you should know about as a cat.

The R package [magrittr](https://cran.rstudio.com/web/packages/magrittr) introduced pipe operators. There are many, but we'll just focus on `%>%`. This allows you to pipe a value forward into an expression or function call, like `x %>% f`, rather than `f(x)`, if `f()` is a function.

First, let's install `magrittr`:


```r
install.packages("magrittr")
```

Then load the package so we can use it in the R session:


```r
library("magrittr")
```

Why should you care about this? This concept can make writing code and understanding it simpler. Take for example this case:


```r
mtcars %>% subset(cyl < 6) %>% head()
```

```
#>                 mpg cyl  disp hp drat    wt  qsec vs am gear carb
#> Datsun 710     22.8   4 108.0 93 3.85 2.320 18.61  1  1    4    1
#> Merc 240D      24.4   4 146.7 62 3.69 3.190 20.00  1  0    4    2
#> Merc 230       22.8   4 140.8 95 3.92 3.150 22.90  1  0    4    2
#> Fiat 128       32.4   4  78.7 66 4.08 2.200 19.47  1  1    4    1
#> Honda Civic    30.4   4  75.7 52 4.93 1.615 18.52  1  1    4    2
#> Toyota Corolla 33.9   4  71.1 65 4.22 1.835 19.90  1  1    4    1
```

If you have a version of R recent enough you can use the base pipe `|>` like so:


```r
mtcars |> subset(cyl < 6) |> head()
```

```
#>                 mpg cyl  disp hp drat    wt  qsec vs am gear carb
#> Datsun 710     22.8   4 108.0 93 3.85 2.320 18.61  1  1    4    1
#> Merc 240D      24.4   4 146.7 62 3.69 3.190 20.00  1  0    4    2
#> Merc 230       22.8   4 140.8 95 3.92 3.150 22.90  1  0    4    2
#> Fiat 128       32.4   4  78.7 66 4.08 2.200 19.47  1  1    4    1
#> Honda Civic    30.4   4  75.7 52 4.93 1.615 18.52  1  1    4    2
#> Toyota Corolla 33.9   4  71.1 65 4.22 1.835 19.90  1  1    4    1
```

Alternatively, we could avoid pipes:


```r
head( subset(mtcars, cyl < 6) )
```

```
#>                 mpg cyl  disp hp drat    wt  qsec vs am gear carb
#> Datsun 710     22.8   4 108.0 93 3.85 2.320 18.61  1  1    4    1
#> Merc 240D      24.4   4 146.7 62 3.69 3.190 20.00  1  0    4    2
#> Merc 230       22.8   4 140.8 95 3.92 3.150 22.90  1  0    4    2
#> Fiat 128       32.4   4  78.7 66 4.08 2.200 19.47  1  1    4    1
#> Honda Civic    30.4   4  75.7 52 4.93 1.615 18.52  1  1    4    2
#> Toyota Corolla 33.9   4  71.1 65 4.22 1.835 19.90  1  1    4    1
```

Both solutions above give the same result, but the first with pipes is more intuitive. That is, it starts with the thing we're going to manipulate (the `mtcars` data.frame), then subsets the data.frame to take rows with the `cyl` column having values less than 6, then take the head, or first six rows. In the second solution, we have to read from the inside out to find the thing that we are manipulating (`mtcars`), which is then subsetted, then the first six rows are given. This is a simple example - as complexity grows, using pipes can make understanding and iterating on code much easier.

Pipe are increasingly being integrated into various R packages. One of the more popular ones is [dplyr](https://cran.rstudio.com/web/packages/dplyr), which allows you to manipulate data frames.


## <a href="#nonos" name="nonos">#</a> No no's for cats using R

There are a few R gotchas to avoid cat friends.

* `attach()`: This attaches an object to the search path. Like fleas, these can be hard to live with and harder to get rid of.
* When doing `library()` or `require()` use the package name in quotes as package name without quotes is easier, but can cause problems.
* Make sure to keep your claws trimmed so they don't get stuck in spaces between the keys.

## <a href="#dodos" name="dodos">#</a> Do do's for cats using R

* Do combine code and text with `Markdown` or `LaTeX` to have reproducible documents, using `knitr`.
* When googling for R help, use `cran`, not `r`
* When asking questions on Twitter/Appdotnet/G+/etc. use `#rstats`
* Do ask lots of questions on StackOverflow (use the `[r]` tag), Twitter (does this need saying), etc. But make sure to do your research before asking, and [include a reproducible example](http://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example)!
* `.rda`, `.rds`, `.RData` compressed files are useful, but for reproducibility purposes, use non-R specific file formats like `.csv`, `.xml`, `.json`, etc.

## <a href="#data" name="data">#</a> Data from the web: pictures

This is sort of an advanced R topic, but hey, how else do we get cute cat pictures? That's the point of the internet after all - to serve cat pictures.

Install `cowsay`


```r
install.packages("cowsay")
```

Now let's get a cat fact!


```r
library("cowsay", quietly = TRUE, warn.conflicts = FALSE)
say("catfact", "cat")
```

```
#> 
#>  -------------- 
#> Cats can predict earthquakes. We humans are not 100% sure how they do it. There are several different theories. 
#>  --------------
#>     \
#>       \
#>         \
#>             |\___/|
#>           ==) ^Y^ (==
#>             \  ^  /
#>              )=*=(
#>             /     \
#>             |     |
#>            /| | | |\
#>            \| | |_|/\
#>       jgs  //_// ___/
#>                \_)
#> 
```

A little explanation is in order me thinks. There are a few things going on in the last thing we just did. The `say` function looks like sorta like this:

```r
say <- function(what, by, type){
  <== some ascii art ==>
  url <- "http://catfacts-api.appspot.com/api/facts?number=1"
  what <- fromJSON(url)$facts
  message(sprintf(by, what))
}
```

The first line is a bunch of ascii characters to make a cat. The second line defines the url for the cat facts API. The third line retrieves one cat fact from the cat facts API. And the fourth line prints the messages with a cat.

> But what is an API? I'm a cat, I only drink water or milk (preferably milk) - but at least I've heard of an IPA. What the rat's ass (yum) is an API?

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

150 pixels


```r
getcutecat(150)
#> ![](http://placekitten.com/g/150/150)
```

<img src="/assets/img/150.jpeg" width="150">

250 pixels


```r
getcutecat(250)
#> ![](http://placekitten.com/g/250/250)
```

<img src="/assets/img/250.jpeg" width="250">

## <a href="#doge" name="doge">#</a> ***Hey! R is not just for cats!*** - dogs

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
#> ![](http://dogr.io/wow/suchhostility/bemoreinclusive.png)
```

<img src="/assets/img/bemoreinclusive.png" width="400"/>

***Now, back to your regular, cat-dominated tutorial.***

## <a href="#dataNames" name="dataNames">#</a> Data from the web: names


Besides pictures, R is also really good at scraping data from websites! Here, we'll look at the names of famous cats that are listed on Wikipedia.

First, we'll have to load some helpful packages.


```r
library("httr")
library("rvest")
```

Each of these packages will help us do different things. The httr package has really helpful functions for grabbing the data from websites, and the `XML` package can translate those webpages into useful objects in our environment.

Here, we'll use the `GET()` function from the `httr` package to save the source code of the page in an object.


```r
wikiCatNamePage <- GET("https://en.wikipedia.org/wiki/List_of_fictional_felines")
```

Cool! We have the website in an object!

But...looking at `wikiCatNamePage`, it doesn't seem like R will understand what we want to do! This is where we use the `content()` function from the httr package--it's really good at translating the page so R can use it. That's what we'll do in this next command:


```r
parsedWikiCatNamePage <- httr::content(wikiCatNamePage)
```

Alright! Now we've translated the website code so that a different function, `html_table()`, will be able to pull the tables that we want.


```r
wikiCatNameTables <- html_table(parsedWikiCatNamePage, fill = TRUE)
```

It looks like the function stored 13 different things in the object, `wikiCatNameTables`. Looking at the webpage, I like the table from the subsection called _In animation_ (there is even a full page about [fictional cats in animation](https://en.wikipedia.org/wiki/List_of_fictional_cats_in_animation)). My favorite is Tom, from Tom and Jerry!

If we use `str(wikiCatNameTables)`, we'll see that `wikiCatNameTables` is a list with six items. It looks like the sixth item is the one with our data--we're almost done! The `str()` function shows too much information because of how `wikiCatNameTables` is organized, so the output isn't shown here. You should try it, though!

Let's put the sixth item in `wikiCatNameTables` into an object and see what we get:


```
#>           Character                                        Origin
#> 1       "Baby Puss"                               The Flintstones
#> 2              Cake                                Adventure Time
#> 3             Felix                                 Felix the Cat
#> 4 Gumball Watterson                  The Amazing World of Gumball
#> 5       MC Skat Kat                             Opposites Attract
#> 6               Leo Blinky Bill’s Extraordinary Balloon Adventure
#>                                                                                                                                                                                                                                                                                                       Notes
#> 1 A saber tooth tiger housecat that is seen in the beginning of the episodes going with the Flintstones and Dino to the movies; a running gag is at the end of the episode Fred puts the cat out-who runs back inside and puts Fred out! Rarely seen outside this role in the series except three episodes.
#> 2                                                                                                                                                                                                         A gender/species swapped version of "Jake the dog" from the Cartoon Network show "Adventure time"
#> 3                                                                                                                                                                                                                       A black cat and "one of the most recognized cartoon characters in film history."[9]
#> 4                                                                                                                                                                                                                                      A 12-year-old anthropomorphic blue cat, who is the titular character
#> 5                                                                                                                                                                                                            Anthropomorphic cat rapper and leader of the Stray Mob that sings and dances with Paula Abdul.
#> 6
```

```r
famousCats <- wikiCatNameTables[[6]]
head(famousCats)
```



Wow! We did it! And the data looks great! Give yourself a pat on the back!

If you're interested in learning more about scraping webpages, you should check out tutorials for `rvest` and `xml2` packages. They are designed to be as cat-friendly as possible!

## <a href="#reading" name="reading">#</a> Reading

After this basic intro you'll want to do more, such as:

* What do you think should go here? say so [here](https://github.com/sckott/rforcats/issues)

And for even more advanced R:

* [Advanced R, by Hadley Wickham](http://adv-r.had.co.nz/)

## <a href="#makeitbetter" name="makeitbetter">#</a> Make it better

Contribute by following [these instructions](/Contribute).

## <a href="#catslover" name="catslover">#</a> Cat's love R

<img src="/assets/img/leo_giffed.gif" width="300">

## <a href="#license" name="license">#</a> License
