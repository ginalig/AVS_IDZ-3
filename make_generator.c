#include <stdio.h>
/*
    ./34_1_2.out test_input/input1.txt 34_1_2_test_output/output1.txt
    ./34.out test_input/input1.txt 34_test_output/output1.txt
    ./34_Optimized.out test_input/input1.txt 34_Optimized_test_output/output1.txt

*/
int main() {
    FILE *fp;
    fp = fopen("test.txt", "w");
        fprintf(fp, "\t");
    for (int i = 1; i <= 5; i++) {
        fprintf(fp, "./34_1_2.out test_input/input%d.txt 34_1_2_test_output/output%d.txt\n\t", i, i);
        fprintf(fp, "./34.out test_input/input%d.txt 34_test_output/output%d.txt\n\t", i, i);
        fprintf(fp, "./34_Optimized.out test_input/input%d.txt 34_Optimized_test_output/output%d.txt\n\t", i, i);
        //fclose(fp);
    }
}