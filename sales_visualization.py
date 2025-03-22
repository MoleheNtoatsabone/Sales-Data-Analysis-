import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_excel("sales_data.xlsx")

# Convert 'Date' to datetime format
df['Date'] = pd.to_datetime(df['Date'])

# Group sales data by month
df['Month'] = df['Date'].dt.to_period('M')
monthly_sales = df.groupby('Month')['Total_Sales'].sum()

# Plot Monthly Sales Trend
plt.figure(figsize=(10,5))
sns.lineplot(x=monthly_sales.index.astype(str), y=monthly_sales.values, marker='o', color='b')
plt.xticks(rotation=45)
plt.title("Monthly Sales Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Total Sales")
plt.show()
