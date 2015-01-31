#!/usr/bin/make

HOME=calwork
JAVA=java -cp dist/$(HOME).jar $(HOME).WorkCalendar

all: javadoc deploy tgz

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
	rm -f $(HOME).zip
	find . | grep -v "test/" | zip -@ $(HOME).zip	
#----------------
try:
	`pwd | sed -e "s/\([A-Za-z0-9]*\/\)*\(.*\)/\2/" | tr -d "\n\r"`
xgrep:
	find src etc web -type f | xargs -l grep -iH $(GREP)
notmp:
	find . | grep -E ".bak$$|.tmp$$" | xargs -l rm -vf
tgz: notmp
	cd .. ; find $(HOME) -maxdepth 1 -type f 								 > files.tmp
	cd .. ; find $(HOME) -maxdepth 1 -type d 								>> files.tmp
	cd .. ; find $(HOME)/src $(HOME)/etc $(HOME)/web $(HOME)/dist -type f 	>> files.tmp
	cd .. ; tar --files-from=files.tmp -czvf $(HOME)_`/bin/date +%Y%m%d`.tgz
ly:
	lynx -source -mime_header http://localhost:8080/calwork/calendarservlet?variant=de_ev&year=2000&format=sql&dummy=1
