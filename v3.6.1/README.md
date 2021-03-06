# JHipster v3.6.1

This folder contains the data for JHipster v3.6.:

* [featuremodel/](featuremodel/) contains the base and refined (used to generate variants to test) feature models;
* [test/jhipster3.6.1-testresults.csv](test/jhipster3.6.1-testresults.csv) contains the results for all the JHipster variants;
* [manual-analysis/manual-classification.csv](manual-analysis/manual-classification.csv) contains the result of our manual classification of failures that could not be automatically classified. This classification has been performed, based on the execution logs that may be found in [execution-logs/](execution-logs/) and integrated to [jhipster3.6.1-testresults.csv](test/jhipster3.6.1-testresults.csv);
* [execution-logs/](execution-logs/) contains the execution logs of all the JHipster variants. One `.tar.gz` contains the logs for both Docker and non Docker variants.
* [Rscripts/](Rscripts/) contains the R scripts to retrieve the lines in the JHipster dataset corresponding to provided SPLCAT and PLEDGE output files.
* The glue between the refined feature model and the [test/jhipster3.6.1-testresults.csv](test/jhipster3.6.1-testresults.csv) file is defined in [convert.r](Rscripts/convert.r). This file should be updated when used with any other JHipster version. 
