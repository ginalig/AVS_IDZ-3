#include <math.h>
#include <stdio.h>

double f(double x) {
    return (x * x * x * x) + 2 * (x * x * x) - x - 1;
}

int main(int argc, char* argv[]) {
    double a = 0.0, b = 1.0, c, eps = 1.0;
    int iterations_count = 0, accuracy;
    FILE *fp;
    if (argc != 3) {
        printf("Incorrect input!");
        return 0;
    }
    fp = fopen(argv[1], "r");
    if (!fp) {
        printf("File not found!\n");
        return 0;
    }
    fscanf(fp, "%d", &accuracy);
    if (accuracy > 10 || accuracy < 6) {
        printf("Incorrect accuracy!");
        return 0;
    }
    for (int i = 0; i < accuracy; i++) {
        eps /= 10;
    }
    while ((b - a) > eps) {
        c = (a + b) / 2;
        if (f(b) * f(c) < 0) {
            a = c;
        } else {
            b = c;
        }
        iterations_count++;
    }
    FILE *fp2;
    fp2 = fopen(argv[2], "w");
    fprintf(fp2, "%lf\n", (a + b) / 2);
    fprintf(fp2, "Iterations count - %d", iterations_count);
    return 0;    
}