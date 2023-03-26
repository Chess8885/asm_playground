TOOLPATH = $(shell dirname $(shell xcodebuild -find clang))

binary: binary.o
	$(TOOLPATH)/ld -o binary binary.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

binary.o: binary.s
	$(TOOLPATH)/as -o binary.o binary.s
