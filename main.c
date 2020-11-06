#pragma GCC optimize("O2")
#include <stdio.h>
#include <inttypes.h>
#define N 4
#define M 2
int32_t sum(int32_t n, int32_t m, int32_t matrix[M][N]) {
    int32_t sum = 0;
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if(matrix[i][j] > 0) sum+=matrix[i][j];
        }
    }
    return sum;

}
int main()
{
    int32_t res = 0;
    int32_t matrix[M][N] = {
            {1, 1, 1, 1},
            {2, 2, 2, 2}
    };
    res = sum(N, M, matrix);
    printf("%" PRId32 , res);
    return 0;
}

