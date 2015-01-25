## Output data
* **motion_data.csv**: extract from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip), as required by 1-4.
* **motion_measures_means.csv**: aggregation per subject, activity as required by 5.

See the [CodeBook](CodeBook.md) for a description of the dimensions and how they are generated.

## How to generate these data files

1. download the input data : https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip
2. extrat into subdirectory **UCI HAR Dataset/** of working dir
3. run the script `run_analysis.R`
