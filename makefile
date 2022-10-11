build: format
	rm -rf ./build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S. -Bbuild && cd build && make

format:
	find ./comm -name "*.h" -o -name "*.hpp" -o -name "*.cpp" | xargs clang-format -i -style=Google

test:
	#TODO

.PHONY: format build test