.PHONY: run
run: 
	gcc 34.s -o c.out
	./c.out test_input/input1.txt output.txt

.PHONY: build
build: 
	gcc -O2 -Wall -masm=intel  -fcf-protection=none   -fno-asynchronous-unwind-tables     -fno-jump-tables     -fno-stack-protector     -fno-exceptions     ./34.c    -fverbose-asm -S -o ./34_kek.s


.PHONY: generate-test
generate-test:
	./34_1_2.out test_input/input1.txt 34_1_2_test_output/output1.txt
	./34.out test_input/input1.txt 34_test_output/output1.txt
	./34_Optimized.out test_input/input1.txt 34_Optimized_test_output/output1.txt
	./34_1_2.out test_input/input2.txt 34_1_2_test_output/output2.txt
	./34.out test_input/input2.txt 34_test_output/output2.txt
	./34_Optimized.out test_input/input2.txt 34_Optimized_test_output/output2.txt
	./34_1_2.out test_input/input3.txt 34_1_2_test_output/output3.txt
	./34.out test_input/input3.txt 34_test_output/output3.txt
	./34_Optimized.out test_input/input3.txt 34_Optimized_test_output/output3.txt
	./34_1_2.out test_input/input4.txt 34_1_2_test_output/output4.txt
	./34.out test_input/input4.txt 34_test_output/output4.txt
	./34_Optimized.out test_input/input4.txt 34_Optimized_test_output/output4.txt
	./34_1_2.out test_input/input5.txt 34_1_2_test_output/output5.txt
	./34.out test_input/input5.txt 34_test_output/output5.txt
	./34_Optimized.out test_input/input5.txt 34_Optimized_test_output/output5.txt
	