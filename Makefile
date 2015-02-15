VERSION=00
BASE=draft-mrw-homenet-rtg-comparison

XML=$(BASE).xml
TEXT=$(BASE)-$(VERSION).txt
HTML=$(BASE)-$(VERSION).html
NROFF=$(BASE)-$(VERSION).nroff
ALLGEN=$(TEXT) $(HTML) $(NROFF)

all: $(ALLGEN)

clean:
	rm -f *.txt *.html *.nroff

$(TEXT): $(XML)
	xml2rfc -o $@ --text $<

$(HTML): $(XML)
	xml2rfc -o $@ --html $<

$(NROFF): $(XML)
	xml2rfc -o $@ --nroff $<

