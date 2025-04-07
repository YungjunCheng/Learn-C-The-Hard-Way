import sys

def main():
	for i in range(1, len(sys.argv)):
		print(f"arg{i}:{sys.argv[i]}")

states=["California","Oregon","Washington","Texas"]

num_states = 4

for i in range(num_states):
	print(f"state {i}: {states[i]}")

if __name__ == "__main__":
	main()
