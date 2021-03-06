\name{similarityToolMostUniqueBB}
\alias{similarityToolMostUniqueBB}
\title{
Most Unique Players per Batted Ball Data
}
\description{
Finds the players who are most unique to all other players in a given dataset of batted ball data from FanGraphs
}
\usage{
similarityToolMostUniqueBB(battedBallVals, numResults = 10)
}
\arguments{
  \item{battedBallVals}{
A dataframe of batted ball data from FanGraphs.
}
  \item{numResults}{
An integer. Defaults to 10.
}
}
\details{
BattedBallVals are designed to be from FanGraphs, using the Batted Ball tab. They must contain all of the following attributes (other values can be included, but will not be used):
GB\%, LD\%, FB\%, HR/FB, Pull\%, Cent\%, Oppo\%, Soft\%, Med\%, Hard\%, Name.
}
\value{
A dataframe of the players with the highest net similarity score.
}
\author{
John Edwards
}
\note{
Similarity scores will differ depending upon the sample size presented due to the normalization applied in the creation of the scores.
}
\keyword{ misc }
