.PHONY: init deps

CONTRACT = "HelloWorld"
GOPKG = "hello"


init:
	rm -rf ./node_modules && npm install
	rm -rf ./node_modules/ethereumjs-tx && tar -xzvf ethereumjs-tx.tar.gz && mv -f ethereumjs-tx ./node_modules/
	# go get github.com/chislab/go-ethereum && cd $(GOPATH)/github.com/chislab/go-ethereum && make all
	# export PATH=$(GOPATH)/github.com/chislab/go-ethereum/build/bin

deps:
	rm -rf build && mkdir -p ./build/$(GOPKG)
	truffle compile && node ./js/readbin.js
	abigen --bin=./build/$(CONTRACT).bin --abi=./build/$(CONTRACT).abi --pkg=$(GOPKG) --out=./build/$(GOPKG)/$(CONTRACT).go

