HOME=/home/gustaf
BIN=$(HOME)/prj/WorldClock2
BUILD=$(HOME)/prj/WorldClock2/build
WWW=$(HOME)/public_html

deploy: clockpage2.html
	cp $(BUILD)/clockpage2.html $(WWW)/clockpage2.html

clockpage2.html: page.head page.foot
	cat page.head > $(BUILD)/clockpage2.html
	perl $(BIN)/generate-page.pl >> $(BUILD)/clockpage2.html
	cat page.foot >> $(BUILD)/clockpage2.html

