# Databricks notebook source

dbutils.widgets.text("environment", "development")

environment = dbutils.widgets.get("environment")

print(f"Running data processing in {environment} environment")

from pyspark.sql import Row

data = [
    Row(id=1, name="Devansh", department="Data Engineering"),
    Row(id=2, name="Alex", department="Data Engineering"),
    Row(id=3, name="Sam", department="Analytics"),
]

df = spark.createDataFrame(data)

print("Input data:")
display(df)

summary = (
    df.groupBy("department")
      .count()
      .orderBy("department")
)

print("Records by department:")
display(summary)