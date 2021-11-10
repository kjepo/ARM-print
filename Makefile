SRC=printdemo
$(SRC): $(SRC).s
	cc -arch arm64 -o $@ $<
