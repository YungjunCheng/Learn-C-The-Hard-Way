import sys
import random
import subprocess
import argparse
from typing import List

def generate_sequential_args(n: int) -> List[str]:
    return [f"arg{i}" for i in range(1, n+1)]

def generate_random_args(n: int, length: int = 8) -> List[str]:
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return [''.join(random.choices(chars, k=length)) for _ in range(n)]

def main():
    parser = argparse.ArgumentParser(description="命令行参数生成器")
    parser.add_argument("-n", "--num", type=int, default=1000, help="参数数量")
    parser.add_argument("-m", "--mode", choices=['seq', 'rand'], default='seq', 
                      help="生成模式：seq-连续参数，rand-随机参数")
    parser.add_argument("--max-display", type=int, default=10, 
                      help="最大显示参数数量")
    args = parser.parse_args()

    if args.mode == 'seq':
        params = generate_sequential_args(args.num)
    else:
        params = generate_random_args(args.num)

    print('\n'.join(params))
    
if __name__ == "__main__":
    main()
