#!/usr/bin/env python3
import sys

current_type = None
total_amount = 0

for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    transaction_type, amount = line.split("\t")
    amount = float(amount)

    if current_type == transaction_type:
        total_amount += amount
    else:
        if current_type is not None:
            print(f"{current_type}\t{total_amount:.2f}")

        current_type = transaction_type
        total_amount = amount

if current_type is not None:
    print(f"{current_type}\t{total_amount:.2f}")
