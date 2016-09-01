#!/usr/bin/make

# Test Xtool schema utility programs
# @(#) $Id: 2bbd9511422674a354fe5a19f2d55437adbebce0 $
# 2016-08-29: Georg Fischer: copied from Dbat
APPL=xtool
JAVA=java -cp dist/$(APPL).jar
DIFF=diff -y --suppress-common-lines --width=160
DIFF=diff -w -rs -C0
SRC=src/main/java/org/teherba/$(APPL)
TOM=c:/var/lib/tomcat/
TOMC=$(TOM)/webapps/$(APPL)
TESTDIR=test
# the following can be overriden outside for single or subset tests,
# for example make regression TEST=U%
TEST="%"
# for Windows, SUDO should be empty
SUDO=

all: regression
#-------------------------------------------------------------------
# Perform a regression test 
regression: 
	java -cp dist/$(APPL).jar org.teherba.common.RegressionTester $(TESTDIR)/all.tests $(TEST) 2>&1 \
	| tee $(TESTDIR)/regression.log
	grep FAILED $(TESTDIR)/regression.log
#
# Recreate all testcases which failed (i.e. remove xxx.prev.tst)
# Handle with care!
# Failing testcases are turned into "passed" and are manifested by this target!
recreate: recr1 regr2
recr0:
	grep -E '> FAILED' $(TESTDIR)/regression*.log | cut -f 3 -d ' ' | xargs -l -ißß echo rm -v test/ßß.prev.tst
recr1:
	grep -E '> FAILED' $(TESTDIR)/regression*.log | cut -f 3 -d ' ' | xargs -l -ißß rm -v test/ßß.prev.tst
regr2:
	make regression TEST=$(TEST) > x.tmp
# test whether all defined tests in common.tests have *.prev.tst results and vice versa
check_tests:
	grep -E "^TEST" $(TESTDIR)/all.tests   | cut -b 6-8 | sort | uniq -c > $(TESTDIR)/tests_formal.tmp
	ls -1 $(TESTDIR)/*.prev.tst            | cut -b 6-8 | sort | uniq -c > $(TESTDIR)/tests_actual.tmp
	diff -y --suppress-common-lines --width=32 $(TESTDIR)/tests_formal.tmp $(TESTDIR)/tests_actual.tmp
#---------------------------------------------------
jfind:
	find src -iname "*.java" | xargs -l grep -H $(JF)
rmbak:
	find src -iname "*.bak"  | xargs -l rm -v
#---------------------------------------------------
all2: javadoc deploy tgz

list:
	java -Xmx512m -jar dist/xtool.jar -cv -m plain test/camt.052.001.01.bdb2.xsd  > camt.052.tsv
list2:
	java -Xmx512m -jar dist/xtool.jar -cvd -m plain ../xtrans/test/control/jcl/jcl.xsd
	
sref2:
	perl -w etc/tool/schema_xref.pl test/camt.052.001.01.xsd test/pain.002.001.02.xsd > sref.html
	cmd /c start sref.html
sref3:
	perl -w etc/tool/schema_xref.pl test/camt.052.001.01.xsd test/pacs.008.001.01.xsd test/pain.002.001.02.xsd > sref.html
	cmd /c start sref.html
compare3:
	java -jar dist/xtool.jar -hfcai test/emz.pacs.008.001.01.xsd                               > emz.8.xml
	java -jar dist/xtool.jar -hfcai test/iso.pacs.008.001.01.xsd                               > iso.8.xml
	java -jar dist/xtool.jar -hfcai test/eba.pacs.008.001.01.xsd                               > eba.8.xml
sort3:
	java -jar dist/xtool.jar -hfcai test/emz.pacs.008.001.01.xsd | sort | uniq | grep -vE "</" > emz.8.xml
	java -jar dist/xtool.jar -hfcai test/iso.pacs.008.001.01.xsd | sort | uniq | grep -vE "</" > iso.8.xml
	java -jar dist/xtool.jar -hfcai test/eba.pacs.008.001.01.xsd | sort | uniq | grep -vE "</" > eba.8.xml
tree:
	java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -m -s -t test/iso.pacs.008.001.01.xsd
tree52:
	java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -t -s test/camt.052.001.01.bdb2.xsd 
pacs8:
	java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -f test/eba.pacs.008.001.01.xsd > eba.txt
	java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -f test/emz.pacs.008.001.01.xsd > emz.txt
	java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -f test/iso.pacs.008.001.01.xsd > iso.txt
scf:
	java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -f test/SCTScfBlkCredTrf.xsd > eba.scf.txt
	java -cp dist/xtool.jar org.teherba.xtool.SchemaTree -f test/BBkSCFBlkCdtTrf.xsd  > emz.scf.txt

zref:
	java -cp dist/xtool.jar org.teherba.xtool.XmlnsXref -p -z test/test.zip > zref.html
	cmd /c start zref.html
run:
	$(JAVA) 
javadoc:
	ant javadoc
deploy:
	ant deploy
zip:
	rm -f $(APPL).zip
	find . | grep -v "test/" | zip -@ $(APPL).zip	
#----------------
try:
	`pwd | sed -e "s/\([A-Za-z0-9]*\/\)*\(.*\)/\2/" | tr -d "\n\r"`
xgrep:
	find src etc web -type f | xargs -l grep -iH $(GREP)
notmp:
	find . | grep -E ".bak$$|.tmp$$" | xargs -l rm -vf
tgz: notmp
	cd .. ; find $(APPL) -maxdepth 1 -type f 								 > files.tmp
	cd .. ; find $(APPL) -maxdepth 1 -type d 								>> files.tmp
	cd .. ; find $(APPL)/src $(APPL)/etc $(APPL)/web $(APPL)/dist -type f 	>> files.tmp
	cd .. ; tar --files-from=files.tmp -czvf $(HOME)_`/bin/date +%Y%m%d`.tgz
ly:
	lynx -source -mime_header http://localhost:8080/calwork/calendarservlet?variant=de_ev&year=2000&format=sql&dummy=1
