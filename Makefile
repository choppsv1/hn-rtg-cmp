VERSION=XX
BASE=draft-mrw-homenet-rtg-comparison

XML=$(BASE).xml
TEXT=$(BASE)-$(VERSION).txt
HTML=$(BASE)-$(VERSION).html
NROFF=$(BASE)-$(VERSION).nroff
GENXML=tmp-$(VERSION).xml
ALLGEN=$(TEXT) $(HTML) $(NROFF)

all: $(ALLGEN)

clean:
	rm -f tmp-*.xml *.txt *.html *.nroff

idnits: $(TEXT)
	idnits $(TEXT)

ifeq ($(VERSION), XX)
$(GENXML): $(XML)
	sed -e "/XXVERXXX/s/XXXVERXXX/$(VERSION)/" $(XML) > $(GENXML)
else
$(GENXML): $(XML)
	git show `git rev-parse --verify rev-$(VERSION)`:draft-mrw-homenet-rtg-comparison.xml | sed -e "/XXVERXXX/s/XXXVERXXX/$(VERSION)/" > $(GENXML)
endif

$(TEXT): $(GENXML)
	xml2rfc $(GENXML) -b $BASE -o $@ --text

$(HTML): $(GENXML)
	xml2rfc $(GENXML) -b $BASE -o $@ --html

$(NROFF): $(GENXML)
	xml2rfc $(GENXML) -b $BASE -o $@ --nroff

