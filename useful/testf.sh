home="/home/ambati"
home="/disk/data2/s1231888"
phd=$home/"ilcc/projects/parsing/experiments/replication/phd-thesis"
sentcompl=$phd/"sent-compl"

data=$phd/data/sent-compl/final
outpath=$sentcompl/output
scripts=$sentcompl/scripts
useful=$sentcompl/useful
lib=$sentcompl/useful

cd $data

echo "VM" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.vm.arff.gz -T wiki.test.vm.arff.gz
echo "VM Pairwise" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.vmp.arff.gz -T wiki.test.vmp.arff.gz
echo "VM Pairwise - PCFG features (Baseline)" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.vmpb.arff.gz -T wiki.test.vmpb.arff.gz
echo "Baseline + All CCG Features" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.ccgall.arff.gz -T wiki.test.ccgall.arff.gz
echo "Baseline + All iCCG Features" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.iccgall.arff.gz -T wiki.test.iccgall.arff.gz
#echo "Baseline + iCCG +inn Features" 
#java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.innall.arff.gz -T wiki.test.innall.arff.gz

echo "PCFG features" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.pcfg.arff.gz -T wiki.test.pcfg.arff.gz
echo "CCG Features" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.ccg.arff.gz -T wiki.test.ccg.arff.gz
echo "iCCG Features" 
java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.iccg.arff.gz -T wiki.test.iccg.arff.gz
#echo "iCCG +inn Features" 
#java -cp $lib/weka.jar weka.classifiers.functions.SMO -t wiki.td.inn.arff.gz -T wiki.test.inn.arff.gz

java -cp $lib/weka.jar weka.classifiers.functions.SMO -p 0 -t wiki.td.vmpb.arff.gz -T wiki.test.vmpb.arff.gz > $outpath/vmpb.txt
java -cp $lib/weka.jar weka.classifiers.functions.SMO -p 0 -t wiki.td.vmp.arff.gz -T wiki.test.vmp.arff.gz > $outpath/vmp.txt
java -cp $lib/weka.jar weka.classifiers.functions.SMO -p 0 -t wiki.td.ccgall.arff.gz -T wiki.test.ccgall.arff.gz > $outpath/ccgall.txt
java -cp $lib/weka.jar weka.classifiers.functions.SMO -p 0 -t wiki.td.iccgall.arff.gz -T wiki.test.iccgall.arff.gz > $outpath/iccgall.txt
java -cp $lib/weka.jar weka.classifiers.functions.SMO -p 0 -t wiki.td.pcfg.arff.gz -T wiki.test.pcfg.arff.gz > $outpath/pcfg.txt
java -cp $lib/weka.jar weka.classifiers.functions.SMO -p 0 -t wiki.td.ccg.arff.gz -T wiki.test.ccg.arff.gz > $outpath/ccg.txt
java -cp $lib/weka.jar weka.classifiers.functions.SMO -p 0 -t wiki.td.iccg.arff.gz -T wiki.test.iccg.arff.gz > $outpath/iccg.txt

cd -
python $scripts/McNemarsTest.py $outpath/pcfg.txt $outpath/iccg.txt
python $scripts/McNemarsTest.py $outpath/vmp.txt $outpath/iccgall.txt
