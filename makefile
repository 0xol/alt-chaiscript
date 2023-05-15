cxx = g++
cxxflags = -std=gnu++14 -O2 -g -Iinclude
ar = ar

install_dir = C:/nix

all:
	if [ -d "bin" ]; then rm -rf bin; fi
	mkdir bin

	$(cxx) $(cxxflags) -c src/chaiscript_stdlib_module.cpp -o bin/chaiscript_stdlib_module.o
	$(cxx) $(cxxflags) -c src/libfuzzer_client.cpp -o bin/libfuzzer_client.o
	$(cxx) $(cxxflags) -c src/main.cpp -o bin/main.o
	$(cxx) $(cxxflags) -c src/sha3.cpp -o bin/sha3.o
	$(cxx) $(cxxflags) -c src/stl_extra.cpp -o bin/stl_extra.o
	$(cxx) $(cxxflags) -c src/test_module.cpp -o bin/test_module.o

	$(ar) rcs libchaiscript.a bin/*.o

install:
	cp include/* $(install_dir)/include -r
	cp libchaiscript.a $(install_dir)/lib
