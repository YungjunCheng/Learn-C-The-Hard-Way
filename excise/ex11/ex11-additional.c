#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	// go through each string in argv

	int i = argc - 1;
	while(i >= 0) {
		printf("arg %d: %s\n", i, argv[i]);
		i--;
	}

	// let's make our own array of strings
	char *states[] = {
		"California", "Oregon",
		"Washington", "Texas"
	};

	int num_states = sizeof(states)/sizeof(states[0]);
	i = 0;  // watch for this
	while(i < num_states) {
		printf("state %d: %s\n", i, states[i]);
		i++;
	}

	i = 0;
	while(i < argc && i < num_states) {
		// states[i] = argv[i];  // 浅拷贝（仅复制指针）
		states[i] = malloc(strlen(argv[i]) + 1); // 深拷贝
		strcpy(states[i], argv[i]);
		i++;
	}

	i = 0;  // watch for this
	while(i < num_states) {
		printf("state %d: %s\n", i, states[i]);
		i++;
	}

	int max_copy = (argc > num_states) ? num_states : argc;
	i = 0;
	while (i < max_copy) {
		// 深拷贝或浅拷贝
		states[i] = strdup(argv[i]);  // strdup 内部调用 malloc + strcpy
		i++;
	}

	i = 0;  // watch for this
	while(i < num_states) {
		printf("state %d: %s\n", i, states[i]);
		i++;
	}

	return 0;
}
