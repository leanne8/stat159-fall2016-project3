#Finding high achieving students for tech companies 

## Leanne Lee, Jamie Stankiewiz, Eranda Bregasi

## Description
The file-structure for the project is as follows:

```
stat159-fall2016-project3/
   README.md
   Makefile
   LICENSE
   session-info.txt
   .gitignore
   code/
      regression-scripts/
         ...
      scripts/
         ...
      shiny-app/
      	 app.R
      tests/
         test.R
   data/
      top_schools.csv
      ...
   images/
      ...
   report/
      report.Rnw
      report.tex
      report.pdf
      report.log
   slides/
      ...
```


## Instructions on how to reproduce the Project

Users can download the credit database from https://collegescorecard.ed.gov/data/
Users can reproduce the Exploratory Data Analysis (EDA) by finding summary statistics and plotting data plots. They can also find the relationship between the dependent and independent variables through frequency.
Users can use multiple linear regression and ridge regression to compare the r-squared, mse and coefficients.
Then users can use random forest method to predict future earnings or other variables. 
By setting the seeds and using cross validation method, users can generate training and testing sets and use those sets to run regression models.


## Common License
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.