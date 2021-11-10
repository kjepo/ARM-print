SRC=printdemo
$(SRC): $(SRC).s  print.h
	cc -arch arm64 -o $@ $<
clean:
	rm $(SRC)
