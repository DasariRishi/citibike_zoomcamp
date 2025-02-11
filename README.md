# citibike_zoomcamp
# Citibike Data Pipeline with Kestra, BigQuery, dbt & Looker Studio

## 📌 Overview
This project automates the extraction, transformation, and visualization of **Citi Bike** trip data. The pipeline utilizes **Kestra** for data orchestration, **Google Cloud Storage & BigQuery** for storage and processing, **dbt** for transformations, and **Looker Studio** for dashboard visualization.

## 🚀 Features
- **Automated Data Ingestion:** Kestra fetches data monthly from [CitiBike Trip Data](https://s3.amazonaws.com/tripdata/index.html).
- **Cloud Storage:** Extracted data is stored in **Google Cloud Storage (GCS)**.
- **BigQuery Staging & Processing:** The data is loaded into **BigQuery**, where it is staged and merged into the main `citibike_tripdata` table.
- **Transformations with dbt:** The raw data is cleaned and structured for analysis.
- **Dashboard in Looker Studio:** The transformed data is visualized in an interactive dashboard.

## 📁 Repository Structure
```
📂 citibike-dbt-pipeline
├── 📂 models             # dbt models for data transformation
│   ├── core             # Core transformation models
│   ├── staging          # Staging models
├── 📂 tests             # dbt tests and validations
├── 📂 macros            # dbt macros
├── 📂 seeds             # Seed data (if any)
├── 📂 scripts           # Python scripts for additional processing
├── 📂 kestra            # Kestra YAML workflow files
├── project_dbt.yml      # dbt project configuration
├── README.md            # Project documentation
└── requirements.txt     # Python dependencies
```

## 🔍 Explore the Repository
- **Kestra Workflow:** Defines the extraction and load jobs.
- **dbt Models:** Contains transformation logic for cleaning and structuring data.
- **BigQuery Tables:** Stores both raw and transformed data.
- **Looker Dashboard:** Connects to BigQuery for visualization.

## 🔄 Project Workflow
1. **Kestra extracts Citi Bike trip data** and loads it into **Google Cloud Storage**.
2. Data is **staged in BigQuery**.
3. The **staging table is merged into `citibike_tripdata`**.
4. **dbt transforms the data** into a structured format.
5. The **transformed data is stored back in BigQuery**.
6. **Looker Studio dashboard** provides insights into trip trends, popular stations, and more.

## 🔄 Architecture
![project_Architecture_diagram](images/345.jpg)

## 🛠️ Technologies Used
- **Kestra** – Data Orchestration
- **Google Cloud Platform (GCP)** – Storage & BigQuery
- **dbt (Data Build Tool)** – Data Transformation
- **Looker Studio** – Dashboard & Visualization
- **Docker** – Containerized Workflow Execution

## 📝 Languages
- **SQL** (BigQuery SQL for transformations)
- **Python** (Data extraction & automation)

## 📚 Libraries
- `dbt-bigquery`
- `pandas`
- `google-cloud-bigquery`
- `requests`

## 🔧 Tools
- **Jupyter Notebook**: Interactive data exploration and analysis.
- **GitHub**: Version control and collaboration.

## ✅ Prerequisites
- Python **3.8 or higher**
- **Jupyter Notebook** (for local analysis)
- **Google Cloud SDK** (for BigQuery & GCS access)
- **Docker** (for running Kestra workflows)

## ⚙️ Installation
```bash
# Clone the repository
git clone https://github.com/yourusername/citibike-dbt-pipeline.git
cd citibike-dbt-pipeline

# Install dependencies
pip install -r requirements.txt

# Set up dbt profiles.yml (if needed)
mkdir -p ~/.dbt
nano ~/.dbt/profiles.yml

# Run dbt models
dbt run

# Validate the transformations
dbt test
```

## 📊 Looker Dashboard
The dashboard provides insights into:
- **Trip Frequency**
- **Popular Stations**
- **Monthly Trends**
- **User Type Analysis (Members vs. Casual Users)**

🔗 **[View the Looker Dashboard](#)**(https://lookerstudio.google.com/reporting/2bbae005-985f-42d0-86b9-49bf53debeac)

---
### 📩 Feel free to contribute or raise issues!
