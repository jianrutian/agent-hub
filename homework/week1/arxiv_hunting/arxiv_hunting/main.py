# arxiv_hunting/main.py

import sys
from arxiv_hunting.ui.cli import cli

def main():
    # 直接调用命令行接口
    cli.main(args=sys.argv[1:], standalone_mode=False)

if __name__ == "__main__":
    main()

