#!/usr/bin/env python3
import sys

for line in sys.stdin:
    line = line.strip()

    if not line or line.startswith("TransactionID"):
        continue

    fields = line.split(",")

    if len(fields) == 7:
        transaction_type = fields[3]
        amount = fields[4]

        print(f"{transaction_type}\t{amount}")
