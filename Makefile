SRC=printdemo
$(SRC): $(SRC).s  kprint.s
	cc -arch arm64 -o $@ $<
clean:
	rm $(SRC)
