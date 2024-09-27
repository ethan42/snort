#!/usr/bin/env python3

## Takes in a directory of exploits identified by Mayhem and builds a set of snort rules to block them

import argparse
import os
import sys


def main():
    parser = argparse.ArgumentParser(description='Generate snort rules from a directory of exploits')
    parser.add_argument('--exploits', help='Directory containing exploits')
    parser.add_argument('-o','--output', help='File to write snort rules to')
    args = parser.parse_args()

    if not args.exploits or not os.path.isdir(args.exploits):
        print(f"Error: {args.exploits} is not a directory")
        sys.exit(1)

    with open(args.output, 'w') as output:
        for i, exploit in enumerate(os.listdir(args.exploits)):
            with open(os.path.join(args.exploits, exploit), 'r') as exploit_file:
                exploit_data = exploit_file.read().strip()
                # use 2 hex bytes for each character separated by a space
                lines = exploit_data.split("\n")
                hex_lines = []
                for line in lines:
                    hex_line = " ".join("{:02x}".format(ord(c)) for c in line)
                    hex_lines.append(f"content:\"|{hex_line}|\";")
                contents = " ".join(hex_lines)

                output.write(f"drop tcp any any -> any 80 (msg:\"Exploit detected - Blocking!\"; {contents} sid:{1000001 + i}; rev:1; priority:1;)\n")

    print(f"Snort rules written to {args.output}")


if __name__ == "__main__":
    main()
