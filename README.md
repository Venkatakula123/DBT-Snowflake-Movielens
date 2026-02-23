# DBT + Snowflake MovieLens Analytics

## 📌 Project Overview

This project demonstrates an end-to-end modern analytics workflow using Snowflake as the data warehouse and dbt as the transformation layer.

The goal is to design a structured analytics environment by:

- Setting up Snowflake infrastructure (roles, warehouses, database, schemas, storage integration)
- Building a dimensional data model using dbt
- Applying testing, snapshots, and modular transformation logic
- Implementing best practices for analytics engineering

This project simulates how analytics environments are structured in real-world production systems.

---
## 🏗 Architecture
```plaintext

Data Source (MovieLens Dataset)
        ↓
Amazon S3 (Manual Upload)
        ↓
Snowflake (RAW Layer)
        ↓
dbt (STAGING → MART)
        ↓
Analytics-Ready Models


📌Infrastructure & Transformation Layers

Snowflake (Infrastructure Layer)
    ├── Warehouse
    ├── Database
    ├── Schemas (RAW, STAGING, MART)
    ├── Roles & Grants
    └── Storage Integration

dbt (Transformation Layer)
    ├── Sources
    ├── Staging Models
    ├── Fact & Dimension Models
    ├── Snapshots (SCD)
    └── Tests (Generic + Custom)
```
📥 Data Ingestion Workflow
```plaintext
1️⃣ The MovieLens dataset was manually uploaded to an Amazon S3 bucket.
2️⃣ A Snowflake storage integration was configured to securely access S3.
3️⃣ Data was loaded into Snowflake RAW schema using external stage + COPY INTO.
4️⃣ dbt was then used to transform data from RAW → STAGING → MART layers.

This mirrors a common real-world batch ingestion pattern used in modern cloud data platforms.
```

## 📊 Data Modeling Approach

The project follows a layered modeling approach:

### 1️⃣ RAW Layer
External or seeded data loaded into Snowflake.

### 2️⃣ STAGING Layer
Data cleaned, standardized, and transformed into consistent formats.

### 3️⃣ MART Layer
Business-ready models including:

- Fact tables
- Dimension tables
- Aggregated metrics

Dimensional modeling principles were applied to support analytical queries.

---

## ⚙️ dbt Features Demonstrated

- `ref()` dependency management
- Materializations (views, tables, incremental)
- Generic tests
- Custom tests
- Snapshots for Slowly Changing Dimensions
- Modular model structuring
- Environment configuration

---




dbt seed
dbt run
dbt test
