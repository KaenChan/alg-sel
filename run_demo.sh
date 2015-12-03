#!/bin/bash


case $1 in
    '1' | 'MultiOut-ET'  ) algtype='MultiOut-ET' ;;
    '2' | 'MultiOut-RF'  ) algtype='MultiOut-RF' ;;
    '3' | 'SingleOut-ET' ) algtype='SingleOut-ET';;
    '4' | 'SingleOut-RF' ) algtype='SingleOut-RF';;
    '5' | 'Stacking-ET'  ) algtype='Stacking-ET' ;;
    '6' | 'Stacking-RF'  ) algtype='Stacking-RF' ;;
    '7' | 'Combined-ET'  ) algtype='Combined-ET' ;;
    '8' | 'Combined-RF'  ) algtype='Combined-RF' ;;

    *)
        echo $1: unknow option
        echo input: $0 algtype
        echo '  algtype:'
        echo '    1 | MultiOut-ET'
        echo '    2 | MultiOut-RF'
        echo '    3 | SingleOut-ET'
        echo '    4 | SingleOut-RF'
        echo '    5 | Stacking-ET'
        echo '    6 | Stacking-RF'
        echo '    7 | Combined-ET'
        echo '    8 | Combined-RF'
        exit 1
esac

datadir=datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_test.features
dataset=wpms_industrial
timeout=2000

echo $datadir
echo $dataset

i=1

train_features=datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_train.features
train_times=datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_train.times
test_features=datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_test.features
test_times=datasets/SAT_2012_seq_all_10fold_f2/fold_1/sat_new_test.times

echo '=========================== train ==================================='
python algsel_train.py $train_features $train_times $timeout -n 10 -m $algtype -a 0.5

echo '=========================== predict ================================='
python algsel_predict.py $test_features $test_times $timeout
