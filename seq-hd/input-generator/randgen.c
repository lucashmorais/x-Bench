#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define SMALL_SIZE 1
#define BIG_SIZE 1024

void writeRandToFile (int fileSize, char * output)
{
	FILE *F = fopen(output, "w");

	srand(clock());

	for (int i = 0; i < fileSize * 1024; i++)
	{
		fprintf(F, "%c", rand() % 255);	
	}

	fclose(F);
}

void bigFile (int mbsize, char * outputDir)
{
	char *str = malloc(300 * sizeof(char));

	sprintf(str, "%s/%dmb-big.rnd", outputDir, mbsize);

	writeRandToFile(mbsize * 1024, str);
}

void smallFiles (int nfiles, int filesize, char * outputDir)
{
	char *str = malloc(300 * sizeof(char));

	for (int i = 0; i < nfiles; i++)
	{
		sprintf(str, "%s/%04d.rnd", outputDir, i);
		writeRandToFile(filesize, str);
	}
}

int main (int argc, char **argv)
{
	if (argc < 2)
	{
		printf("Please do specify the output directory.\n");
		return 1;
	}

	printf("%s\n", argv[1]);

	bigFile(BIG_SIZE, argv[1]);
	smallFiles(1024, SMALL_SIZE, argv[1]);
}
