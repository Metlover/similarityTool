# similarityTool
R package of similarity tool methods for use in comparing players batted ball and offensive peripheral profiles

**What is this?**

This package is designed to generate comparisons for a given player based on their batted ball or offensive profile using FanGraphs data.

**How does it work?**

Primer on how it works is coming soon to the FG community, hopefully soon.


**What does BB or Off mean?**

BB refers to batted ball profile. For functions with the "BB" tag, the similarity scores are based solely upon batted ball data from FanGraphs, specifically the following metrics: LD%, FB%, GB%, HR/FB, Pull%, Cent%, Oppo%, Soft%, Med%, Hard%.

Off refers to offensive peripherals - this includes all of the metrics in BB but with BB% and K% included as well.

**How do I use it?**

Get R and Rstudio installed (obviously), then import devtools and load them.

```
> install.packages("devtools")
> library("devtools")

```

Then, install the package from this github directory, and load them into Rstudio.

```
> install_github('similarityTool', 'Metlover')
> library('similarityTool')
```

You now have all the packages you need loaded onto your computer.

Next, you need the data from FanGraphs. For 2017 qualified batters across the MLB, for instance, go here: (http://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=y&type=2&season=2017&month=0&season1=2017&ind=0&team=0&rost=0&age=0&filter=&players=0)

If using **only** BB functions, simply click "Export data" in the upper right corner of the table.

If using Off functions, scroll down to the bottom of the screen below the table. In the list on the far left, scroll down and select "BB%", then click on the "To Right" arrow. Repeat this for "K%". Then click on "create custom table", and then click on "Export data".

In both cases, you should end up with a CSV of either BB or Off data. Import the CSV as a dataset by going from `File -> Import Dataset -> From CSV... ` and select the CSV of the batted ball data. Feel free to name it something simple like "battedBallData".

From there, use the functions to obtain similarity scores from the dataset. For example, the following command yeilds the most similar players based on offensive peripherals to Nolan Arenado in 2017 among qualified hitters:

```
> similarityToolOff(battedBallData, "Nolan Arenado", 5)
Warning message:
package ‘FNN’ was built under R version 3.4.2 
> result
               Name   Scores
1       Ian Kinsler 1.228740
2      Justin Smoak 2.106559
3 Andrew Benintendi 2.191174
4  Francisco Lindor 2.320362
5    Mike Moustakas 2.459700

```

Check the documentation, the forthcoming FanGraphs article, and below for how to use the other functions.

**What does each tool do?**

*similarityToolBB.R | similarityToolOff.R*

This is the most fundamental function. Given batted ball or offensive peripheral data from FanGraphs and the name of a player within the dataset, this function will output the most similar players and their similarity scores.

*similarityToolBBx.R | similarityToolOffx.R*

This function works similarly to the above function, but takes a singular data frame of batted ball profile as the input instead of a name - i.e., PlayerVals = data.frame("LD%" = .xxx, "GB%" = .xxx, "FB%" = .xxx, "Pull%" = .xxx, "Cent%" = .xxx, "Oppo%" = .xxx, "Soft%" = .xxx, "Med%" = .xxx, "Hard%" = .xxx, "HR/FB" = .xxx, check.names=FALSE) (include BB% and K% for the offensive metric).

*similarityToolMostSimBB.R | similarityToolMostSimOff.R*

This function relies upon similarityToolBB/Off.R to find players with the lowest overall similarity scores, i.e. what players are most similar to other players within a dataset.

*similarityToolMostUniqueBB.R | similarityToolMostUniqueOff.R*

Acts in reverse of the MostSimBB/Off and finds the players with the highest overall similarity scores, i.e. what players are most unique.

*similarityToolTwoPlayersBB.R | similarityToolTwoPlayersOff.R*

Finds the similarity score between two players. NOTE THAT THIS SONG REQUIRES A FULL DATASET - because of the normalization techniques used in similarityToolBB/Off, an accurate similarity score will not be generated if the dataset consists only of the two players.
