# Mayhem + Snort Demo

This repo provides `snortify.py`, a quick utility to build snort rules out of Mayhem defect test cases. Test cases are split into multiple pieces (at newlines) to ensure the exploit is detected despite fragmentation. All payloads are encoded in hex to handle possible non-printable characters in snort rules.

By default, the `docker-compose` setup uses "host" networking to make it simpler for snort to capture traffic. Follow the link below for a demo:

[![asciicast](https://asciinema.org/a/6LUZ6BHg1AbQHpgf98MwgaS1B.svg)](https://asciinema.org/a/6LUZ6BHg1AbQHpgf98MwgaS1B)