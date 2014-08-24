## Variables, the data, and any transformations

* `features` raw data from "features.txt"
* `activities` raw data from "activity_labels.txt"
* `X_train` raw data from "train/X_train.txt"
* `y_train` raw data from "train/y_train.txt"
* `subject_train` raw data from "train/subject_train.txt"
* `X_test` raw data from "test/X_test.txt"
* `y_test` raw data from "test/y_test.txt"
* `subject_test` raw data from "test/subject_test.txt"

* data from train set and test set are combind together to `X`, `y`, and `subject`

* `Xsub` is subset of `X` only contains features whos name include "-mean()" or "-std()"

* a new column 'aname' is add to `y`, means activity name

* `dataset` is full set of 'X', 'y', and 'subject' bind together row by row

* `tidy` is a summary of 'Xsub' group by 'y' and 'subject', and applay mean to each group
