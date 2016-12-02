#declare phony targets
.PHONY: all data tests eda ridge lm report slides session clean testAndTrain rf shiny

all: eda ols report session-info data testAndTrain slides ridge lm rf shiny

#import data into the data folder (Run this line first to import)
data:
	data/top_schools.csv

#Run eda-script to generate images and summary statistics
eda: code/scripts/eda-script.R 
	Rscript code/scripts/eda-script.R

#Create testing and training sets and put them into csv 
testAndTrain:  code/scripts/training-and-testing.R 
	Rscript code/scripts/training-and-testing.R 

#Save session info information
session-info: code/scripts/session.sh
	sh code/scripts/session.sh

ridge:
	Rscript code/regression-scripts/ridge-regression.R; 
	Rscript code/regression-scripts/ridge-regression-1.R;
	Rscript code/regression-scripts/ridge-regression-2.R;
  
lm: code/regression-scripts/linear-regression.R
	Rscript code/regression-scripts/linear-regression.R

rf: 
	Rscript code/regression-scripts/random-forest.R; 
	Rscript code/regression-scripts/random-forest-1.R;
	Rscript code/regression-scripts/random-forest-2.R;

shiny: code/shiny-app/app.R
	Rscript code/shiny-app/app.R

#Generate pdf report
report: report/report.Rnw
	Rscript -e "library(knitr); knit('report.rnw')"

#slides:
slides: slides/slides.Rmd
	Rscript -e "library(rmarkdown); render('slides/slides.Rmd','html_document')";

#clean the target
clean:
	rm -f report/report.pdf 

