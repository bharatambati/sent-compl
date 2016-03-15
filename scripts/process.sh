candc="/home/ambati/ilcc/tools/candc-1.00/"
rdata="/home/ambati/ilcc/projects/parsing/experiments/readability/data"
pre=$rdata/"pre-process"
data="/home/ambati/ilcc/projects/parsing/experiments/replication/naacl2015-inc-ccg/data/final"
model="/home/ambati/ilcc/projects/parsing/experiments/replication/naacl2015-inc-ccg/models/greedy"
jpath="/home/ambati/netbeans/IncCCGParser/dist"

#java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.train.conll $pre/wiki.srtrain.auto $pre/wiki.srtrain.deps $model/srccgmodel.28.gz
#java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.devel.conll $pre/wiki.srdevel.auto $pre/wiki.srdevel.deps $model/srccgmodel.28.gz
#java -Xms6g -jar $jpath/IncCCGParser.jar 0 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.test.conll $pre/wiki.srtest.auto $pre/wiki.srtest.deps $model/srccgmodel.28.gz

#java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.train.conll $pre/wiki.inctrain.auto $pre/wiki.inctrain.deps $model/incccgmodel.28.gz
#java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.devel.conll $pre/wiki.incdevel.auto $pre/wiki.incdevel.deps $model/inccgmodel.28.gz
#java -Xms6g -jar $jpath/IncCCGParser.jar 1 0 30 1 1 0 "greedy" $data/train.gccg.auto $data/train.accg.conll $pre/dup.jparg $pre/wiki.test.conll $pre/wiki.inctest.auto $pre/wiki.inctest.deps $model/inccgmodel.28.gz

cd $rdata/../useful/Bharath-EngCode
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetFeaturesForWiki $pre/wiki.sents.devel.txt $pre/wiki.devel.csv &
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetFeaturesForWiki $pre/wiki.sents.test.txt $pre/wiki.test.csv &
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetFeaturesForWiki $pre/wiki.sents.train.txt $pre/wiki.train.csv

#cd $pre
#java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.FormatData wiki.devel.csv wiki.devel.arff
#java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.FormatData wiki.train.csv wiki.train.arff
#java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.FormatData wiki.test.csv wiki.test.arff

java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.train.csv wiki.srtrain.auto wiki.inctrain.auto wiki.train.arff 

java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.train.csv wiki.srtrain.auto wiki.inctrain.auto wiki.train.arff 
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.devel.csv wiki.srdevel.auto wiki.incdevel.auto wiki.devel.arff 
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.test.csv wiki.srtest.auto wiki.inctest.auto wiki.test.arff 

java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.train.csv wiki.srtrain.auto wiki.inctrain.auto wikip.train.arff 
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.devel.csv wiki.srdevel.auto wiki.incdevel.auto wikip.devel.arff 
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.test.csv wiki.srtest.auto wiki.inctest.auto wikip.test.arff

java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.train.csv wiki.srtrain.auto wiki.inctrain.auto wiki.train.dat
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.devel.csv wiki.srdevel.auto wiki.incdevel.auto wiki.devel.dat
java -cp ~/netbeans/Readability/dist/Readability.jar ilcc.readability.GetCCGFeatures wiki.test.csv wiki.srtest.auto wiki.inctest.auto wiki.test.dat


cut -f1-86 -d' ' wiki.devel.dat > wiki.devel.vm.dat
cut -f1-86 -d' ' wiki.train.dat > wiki.train.vm.dat
cut -f1-86 -d' ' wiki.test.dat > wiki.test.vm.dat
cut -f1-96 -d' ' wiki.train.dat > wiki.train.sr.dat
cut -f1-96 -d' ' wiki.devel.dat > wiki.devel.sr.dat
cut -f1-96 -d' ' wiki.test.dat > wiki.test.sr.dat
cut -d' ' -f97-118 wiki.train.dat > inc.train.dat
cut -d' ' -f97-118 wiki.devel.dat > inc.devel.dat
cut -d' ' -f97-118 wiki.test.dat > inc.test.dat
paste wiki.train.vm.dat inc.train.dat > wiki.train.inc.dat 
paste wiki.devel.vm.dat inc.devel.dat > wiki.devel.inc.dat 
paste wiki.test.vm.dat inc.test.dat > wiki.test.inc.dat

