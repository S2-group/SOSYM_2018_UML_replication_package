# SOSYM 2018 replication package
Replication package of the paper [Execution of UML models: A Systematic Review of Research and Practice](http://www.ivanomalavolta.com/files/papers/SOSYM_2018.pdf) published in SOSYM 2018

This study has been designed, developed, and reported by the following investigators:
- [Federico Ciccozzi](http://www.es.mdh.se/staff/266-Federico_Ciccozzi) (School of Innovation, Design and Engineering, Malardalen University, Västerås, Sweden)
- [Ivano Malavolta](http://www.ivanomalavolta.com) (Vrije Universiteit, Amsterdam, The Netherlands)
- [Bran Selic](https://scholar.google.com/citations?user=bzxh-TsAAAAJ&hl=en) (Malina Software Corporation, Ottawa, Canada)

For any information, interested researchers can contact us by writing an email to [federico.ciccozzi@mdh.se](mailto:federico.ciccozzi@mdh.se) or [i.malavolta@vu.nl](mailto:i.malavolta@vu.nl)

## Structure of the replication package

This replication package is organized according to the following structure.

```
Root
│   readme.md: the file you are reading right now.
│   protocol.pdf: a document containing the review protocol we followed for executing the whole study.
│   dataExtractionForm.pdf: a document containing the detailed explaination of all the parameters of the classification framework used in this study.
│   rawData: a folder containing all the raw data produced and managed during the study.
|─── extractedData.xlsx: an Excel spreadsheet containing all the extracted data. There you will find a colum for each parameter of the data extraction form and a row for each primary study.
|─── extractedData.txt: a Tab-delimited textual file created by exporting the extractedData.xlsx Excel spreadsheet 
|─── quality.xlsx: an Excel spreadsheet containing all the extracted data related to the quality assessment of the primary studies. There you will find a colum for each quality criteria (Q1-Q6 and TOTAL) and a row for each primary study.
|─── quality.txt: a Tab-delimited textual file created by exporting the extractedData.xlsx Excel spreadsheet 
|─── selection: a folder containing "selectionData.xlsx" with the full list of all potentially relevant studies, grouped by search type, electronic data source, and tool-related entries. In the Excel file there are the following 9 sheets, with columns containing information about the studies (title, venue, etc.), a column for each selection criteria, and a column for representing whether the study is included or not; each row represents a potentially relevant study:
|   |─── ACM to 2015: the list of potentially relevant studies obtained by executing the search string on the ACM Digital library up to 2015.
|   |─── IEEE to 2015: the list of potentially relevant studies obtained by executing the search string on IEEE Xplore up to 2015.
|   |─── Scoputs to 2015: the list of potentially relevant studies obtained by executing the search string on Scopus up to 2015.
|───|─── WoS to 2015: the list of potentially relevant studies obtained by executing the search string on Web of Science up to 2015.
|   |─── Snowball forward: the list of potentially relevant studies resulting from the forward snowballing activity.
|   |─── Snowball backward: the list of potentially relevant studies resulting from the backward snowballing activity.
|   |─── Tools: the list of potentially relevant tools.
|   |─── Petri nets: the list of potentially relevant studies from all databases regarding translation from UML to petri nets (separated since double-checked for revision).
|   |─── All for 2015-2016: the lsit of potentially relevant studies from all databases for 2015-2016 (separated since added for manuscript revision).
|   |─── duplicates_checker.py: a Python script for automatically removing all duplicates across the Excel files contained in the "selection" folder (remember to export each Excel file into a comma-separated-value format first).

│   analysisScripts: a folder containing all the R scripts for analysing the extracted data and for generating all the figures included in the paper. Each script is self-contained, it does not depend on any other scripts, and has been executed via R Studio (version 1.1.383). 
|─── academia_vs_industry.R: generates the contingency tables dedicated to the comparison between academia and industry across the various parameters of the classification framework.
|─── pieChart.R: generates the pie chart related to the types of publications
|─── qualityAgreementChecker.R: generates the figures related to the quality assessment of the primary studies.
|─── facetGenerator.R: generates the figures for presenting the results of RQ2 and RQ3 (only the nested figures).
|─── horizontal.R: generates a large PDF file containing a contingency table for each possible pair of parameters of the classification framework. Of course, parameters of type "paper fragment" or syntactical ones (e.g., the unique ID of the primary study) are not considered here.
|─── summary.R: generates a large PDF file containing a bar chart for each parameter of the classification framework
|─── lineChart.R: generates the line chart showing the distribution of the publications over the years
|─── results: the folder that will contain the result of the execution of each script. 
|   |─── summary.pdf: the result of the execution of summary.R, it may be useful for investigating on additional potentially interesting trends.
|   |─── horizontal.pdf: the result of the execution of horizontal.R, it may be useful for investigating on additional interesting correlations across the parameters of the classification framework.
```

### Legend for the selectionData.xlsx file.

#### Inclusion criteria (I1-I6)
- "-": the inclusion criterion is satisfied
- "X": the inclusion criterion is NOT satisfied
- blank: the inclusion criterion is not evaluated because some other criterion already dominates it 

#### Exclusion criteria (E1-E4)
- "-": the exclusion criterion is satisfied
- "X": the exclusion criterion is NOT satisfied
- blank: the exclusion criterion is not evaluated because some other criterion already dominates it 

This means that a primary study is included in our study if:
- all its inclusion criteria are "-"
- all its exclusion criteria are "X"

## How to cite our work
If our study is helping your research, consider to cite is as follows, thanks!

```
@article{SOSYM_2018,
  url = { http://www.ivanomalavolta.com/files/papers/SOSYM_2018.pdf },
  number = { 1 },
  volume = { 18 },
  pages = { 1-48 },
  publisher = { Springer },
  doi = { 10.1007/s10270-018-0675-4 },
  issn = { 1619-1374 },
  year = { 2018 },
  journal = { Software {\&} Systems Modeling },
  title = { Execution of UML models: a systematic review of research and practice },
  author = { Federico Ciccozzi and Ivano Malavolta and Bran Selic },
}
```
