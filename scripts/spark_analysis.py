from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("BankingTransactionAnalysis").getOrCreate()

df = spark.read.option("header", "true").option("inferSchema", "true").csv("/banking_transactions/input/banking_transactions.csv")

df.groupBy("TransactionType").sum("Amount").orderBy("sum(Amount)", ascending=False).show()

df.groupBy("Status").count().show()

spark.stop()
