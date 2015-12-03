Alg-sel
===========================

Alg-sel is a algorithm selection method for SAT, MAXSAT, Plan etc. It's based on multi-output regression model to predict the runtime for each algorithm.
Compared to single-output learning, the multi-output learning can capture the relation of the candidate algorithms.

Alg-sel contains 3 multi-output learning method

- Multi-output regressor stacking.
- Multi-output extreme randomized trees
- Combined single- and multi-output trees

## Demo

`run_demo.sh` give an example to train the alg-sel model for SAT. More datasets can be found in [APBS: Algorithm Portfolio Benchmark Set](http://4c.ucc.ie/~ymalitsky/APBS.html).

```
$ ./run_demo.sh
input: ./run_demo.sh algtype
  algtype:
    1 | MultiOut-ET
    2 | MultiOut-RF
    3 | SingleOut-ET
    4 | SingleOut-RF
    5 | Stacking-ET
    6 | Stacking-RF
    7 | Combined-ET
    8 | Combined-RF
```

```
$ ./run_demo.sh 1
datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_test.features
wpms_industrial
=========================== train ===================================
Main Options:
 -> Target type                      1
 -> Num of trees                     10
Parsing Data
 -> Reading Train Features : datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_train.features
 -> Reading Train Times    : datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_train.times
Basic Information on Data:
 --> Number of Algorithms            : 72
 --> Number of Features              : 32
 --> Number of Train-Feature-vectors : 5340
 --> Number of Train-Time-vectors    : 5340
target: y
training multi-output ET
model is saved in model.pickle
Training time: 13.02
=========================== predict =================================
Parsing Data
 -> Reading Test Features  : datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_test.features
 -> Reading Test Times     : datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_test.times
 Basic Information on Data:
 --> Number of Algorithms            : 72
 --> Number of Features              : 32
 --> Number of Test-Feature-vectors  : 594
 --> Number of Test-Time-vectors     : 594
Main Options:
 -> Trained model: model.pickle
      Multi-output ET; ntrees=10
Test-Instances                     : 594.0
n-Solved                           : 580.0
Percentage solved                  : 97.64
Geometric-Mean (shifted by 10)     : 18.64
Runtime-Mean                       : 137.38
Runtime-Mean-On-Solved             : 92.42
PAR-1                              : 137.38
PAR-5                              : 325.93
PAR-10                             : 561.62
VBS-Solved                         : 594.0
VBS-Percentage solved              : 100.00
VBS-Mean                           : 59.16
VBS-Geometric-Mean (shifted by 10) : 10.16
Testing time                       : 1.79
```
