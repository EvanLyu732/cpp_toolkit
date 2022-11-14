build: format
	rm -rf ./build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S. -Bbuild && cd build && ninja

format:
	find ./comm -name "*.h" -o -name "*.hpp" -o -name "*.cpp" | xargs clang-format -i -style=Google

ci: format build
   $(info ======== TRIGGER_CI ========)

test:
	#TODO

package:
	cd build && cpack -G DEB

.PHONY: format build test