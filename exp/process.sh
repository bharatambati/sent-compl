#home="/disk/data1/s1231888/"
home="/home/ambati/"
rdata=$home/"ilcc/projects/parsing/experiments/readability/data"
pre=$rdata/"pre-process"
data=$home/"ilcc/projects/parsing/experiments/replication/naacl2015-inc-ccg/data/final"
model=$home/"ilcc/projects/parsing/experiments/replication/naacl2015-inc-ccg/models/greedy"
model2=$home/"ilcc/projects/parsing/experiments/english/ccg/useful/ccg-all/models/"
jpath=$home/"ilcc/projects/parsing/experiments/readability/useful"

java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.train.conll $pre/wiki.srtrain.auto $pre/wiki.srtrain.deps $model/srccgmodel.28.gz > 1.txt 2> 1.txt &
java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.devel.conll $pre/wiki.srdevel.auto $pre/wiki.srdevel.deps $model/srccgmodel.28.gz > 2.txt 2> 2.txt &
java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.test.conll $pre/wiki.srtest.auto $pre/wiki.srtest.deps $model/srccgmodel.28.gz > 3.txt 2> 3.txt &

java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.train.conll $pre/wiki.inctrain.auto $pre/wiki.inctrain.deps $model/inccgmodel.28.gz > 4.txt 2> 4.txt &
java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.devel.conll $pre/wiki.incdevel.auto $pre/wiki.incdevel.deps $model/inccgmodel.28.gz > 5.txt 2> 5.txt &
java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.test.conll $pre/wiki.inctest.auto $pre/wiki.inctest.deps $model/inccgmodel.28.gz > 6.txt 2> 6.txt &

#cd $rdata/../useful/Bharath-EngCode
#java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetFeaturesForWiki $pre/wiki.sents.train.txt $pre/wiki.train.csv
#java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetFeaturesForWiki $pre/wiki.sents.devel.txt $pre/wiki.devel.csv
#java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetFeaturesForWiki $pre/wiki.sents.test.txt $pre/wiki.test.csv

java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.nnccg.conll $pre/dup.jparg $pre/wiki.td.nn.conll $pre/wiki.nnsrtd.auto $pre/wiki.nnsrtd.deps $model2/per-gsrnn-model.gz > tdsr.txt 2> tdsr.txt &
java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.nnccg.conll $pre/dup.jparg $pre/wiki.td.nn.conll $pre/wiki.nninctd.auto $pre/wiki.nninctd.deps $model2/per-gincnn-model.gz > tdinc.txt 2> tdinc.txt &
java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.nnccg.conll $pre/dup.jparg $pre/wiki.test.nn.conll $pre/wiki.nnsrtest.auto $pre/wiki.nnsrtest.deps $model2/per-gsrnn-model.gz > testsr.txt 2> testsr.txt &
java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.nnccg.conll $pre/dup.jparg $pre/wiki.test.nn.conll $pre/wiki.nninctest.auto $pre/wiki.nninctest.deps $model2/per-gincnn-model.gz > testinc.txt 2>  testinc.txt &
