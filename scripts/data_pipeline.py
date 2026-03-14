import pandas as pd
from sqlalchemy import create_engine

# 1. Load raw dataset
df = pd.read_csv("D:/Automated_Sales_BI_Dashboard/data/raw/Superstore.csv", encoding="latin1")

# 2. Standardize column names
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
    .str.replace("-", "_")
)

# 3. Convert data types
df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce")
df["ship_date"] = pd.to_datetime(df["ship_date"], errors="coerce")

df["sales"] = pd.to_numeric(df["sales"], errors="coerce")
df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce")
df["discount"] = pd.to_numeric(df["discount"], errors="coerce")
df["profit"] = pd.to_numeric(df["profit"], errors="coerce")

# 4. Feature engineering
df["order_month"] = df["order_date"].dt.strftime("%B")
df["month_number"] = df["order_date"].dt.month
df["ship_days"] = (df["ship_date"] - df["order_date"]).dt.days
df["profit_margin"] = df["profit"] / df["sales"]

df["discount_bucket"] = pd.cut(
    df["discount"],
    bins=[-0.01, 0, 0.2, 0.5, 1],
    labels=["No Discount", "Low", "Medium", "High"]
)

# 5. Remove duplicates
df = df.drop_duplicates()

# 6. Remove important nulls
df = df.dropna(subset=["order_date", "ship_date", "sales", "profit"])

# 7. Save cleaned CSV
df.to_csv("D:/Automated_Sales_BI_Dashboard/data/cleaned/clean_Superstore1.csv", index=False)

# 8. Connect to MySQL
engine = create_engine("mysql+pymysql://root:Abhi7667%40@localhost/automated_sales_bi")

# 9. Load into MySQL
df.to_sql("superstore_clean", con=engine, if_exists="replace", index=False)

# 10. Success message
print("Automation pipeline executed successfully.")
print("Cleaned data saved to data/cleaned/cleaned_superstore.csv")
print("Data loaded into MySQL table: superstore_clean")
print("Final shape:", df.shape)