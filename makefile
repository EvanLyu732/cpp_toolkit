format:
	find ./comm -iname "*.h" | xargs clang-format -i -style=Google

test:
	#TODO

.PHONY: format test