data <- read.csv("data/banking_transactions.csv")

cat("Transaction Type Summary:\n")
print(aggregate(Amount ~ TransactionType, data = data, FUN = sum))

cat("\nStatus Summary:\n")
print(table(data$Status))

cat("\nBasic Statistics of Transaction Amount:\n")
print(summary(data$Amount))

write.csv(
  aggregate(Amount ~ TransactionType, data = data, FUN = sum),
  "results/r_transaction_type_totals.csv",
  row.names = FALSE
)

write.csv(
  as.data.frame(table(data$Status)),
  "results/r_status_summary.csv",
  row.names = FALSE
)
