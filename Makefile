# Build the Internet-Draft from markdown using kramdown-rfc and xml2rfc.
#
# Dependencies (one-time install):
#   gem install kramdown-rfc
#   python3 -m pip install --user xml2rfc
#
# Targets:
#   make           - build .xml and .txt
#   make html      - also build HTML
#   make clean     - remove built artifacts
#   make deps      - print dependency install instructions

DRAFT := draft-motters-ruuid-00

all: $(DRAFT).txt $(DRAFT).html

# -3 selects RFCXML v3 (the current format); without it, kdrfc emits v2
# and may fall back to a remote conversion service.
$(DRAFT).xml: $(DRAFT).md
	kdrfc -3 $(DRAFT).md

$(DRAFT).txt: $(DRAFT).xml
	xml2rfc --text $(DRAFT).xml

$(DRAFT).html: $(DRAFT).xml
	xml2rfc --html $(DRAFT).xml

html: $(DRAFT).html

deps:
	@echo "Install draft-build dependencies with:"
	@echo "  gem install kramdown-rfc"
	@echo "  python3 -m pip install --user xml2rfc"

clean:
	rm -f $(DRAFT).xml $(DRAFT).txt $(DRAFT).html

.PHONY: all html deps clean
