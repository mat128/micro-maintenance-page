.PHONY: test

test:
	test/00-default-values/test.sh
	test/01-serves-static-page/test.sh
	test/02-allows-specifying-response-code/test.sh