VERSION=00
BASE=draft-mrw-homenet-rtg-comparison

TEXT=$(BASE)-$(VERSION).txt
HTML=$(BASE)-$(VERSION).html
NROFF=$(BASE)-$(VERSION).nroff
XML=$(BASE)-$(VERSION).xml
ALLGEN=$(TEXT) $(HTML) $(NROFF)

all: $(ALLGEN)

clean:
	rm -f $(ALLGEN)

$(TEXT): $(XML)
	xml2rfc $< --text

$(HTML): $(XML)
	xml2rfc $< --html

$(NROFF): $(XML)
	xml2rfc $< --nroff

