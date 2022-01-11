HOME=/home/gustaf
BIN=$(HOME)/prj/WorldClock2
BUILD=$(HOME)/prj/WorldClock2/build
WWW=$(HOME)/public_html

deploy: clockpage2.html
	cp $(BUILD)/clockpage2.html $(WWW)/clockpage2.html

# test-deploy: faq.html
# 	cp $(BUILD)/faq.html $(WWW)/t/faq.html

# test-newfaq: newfaq
# 	cp $(BUILD)/newfaq.html $(WWW)/t/newfaq.html

clockpage2.html: page.head page.foot
	cat page.head > $(BUILD)/clockpage2.html
	perl $(BIN)/generate-page.pl >> $(BUILD)/clockpage2.html
	cat page.foot >> $(BUILD)/clockpage2.html

# newfaq: [0-9][0-9][0-9]_*.txt faq.head faq.foot
# 	cat faq.head > $(BUILD)/newfaq.html
# 	perl ./new-generate-faqpage.pl | $(MARKDOWN) >> $(BUILD)/newfaq.html
# 	cat faq.foot >> $(BUILD)/newfaq.html

# clean-test: test-deploy
# 	rm $(WWW)/t/*.html
