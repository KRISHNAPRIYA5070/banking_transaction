transactions = LOAD 'data/banking_transactions.csv'
USING PigStorage(',')
AS (TransactionID:chararray, CustomerID:chararray, TransactionDate:chararray,
    TransactionType:chararray, Amount:double, Location:chararray,
    Status:chararray);

filtered = FILTER transactions BY TransactionID != 'TransactionID';

grouped = GROUP filtered BY TransactionType;

totals = FOREACH grouped GENERATE
    group AS TransactionType,
    SUM(filtered.Amount) AS TotalAmount;

ordered = ORDER totals BY TotalAmount DESC;

STORE ordered INTO 'results/pig_transaction_type_totals' USING PigStorage(',');
