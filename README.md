# Airbnb Data Transformation with dbt

## Overview
This project focuses on transforming Airbnb data using **dbt (Data Build Tool)** with **Snowflake** as the data warehouse. It automates the transformation of raw data into a clean, structured format for analytical purposes. The transformed data enables better insights and decision-making, making it easier to analyze Airbnb listings, hosts, and reviews efficiently. The entire project is **well-documented**, ensuring clarity and ease of use for future improvements and collaboration.

## Features
- **Data Cleaning & Standardization**: Cleansing raw Airbnb data to ensure consistency and accuracy.
- **Modular SQL Development**: Using dbt to create structured data models (staging, dimension, fact, and marts).
- **Scalability**: Handling large datasets efficiently with **Snowflake**.
- **Lineage Graph**: Visual representation of model dependencies for better understanding.
- **Custom Tests & Macros**: Implemented custom tests with **dbt-expectations** and built reusable macros to streamline transformations and enforce data quality.
- **Orchestration with Dagster**: Automated and scheduled dbt runs using **Dagster** to ensure smooth data workflows.
- **Special Analysis**: Includes a unique analysis of whether the **full moon** impacts Airbnb reviews by mapping review dates with full moon nights.
- **Comprehensive Documentation**: The project is thoroughly documented, providing clear explanations of data models, transformations, and workflows.

## Project Structure
The repository follows a structured dbt project approach:
```
├── analyses/
├── assets/
├── data_tests/
├── dbt_packages/
├── logs/
├── macros/
├── models/
│   ├── src/                   # Source models (raw Airbnb data)
│   │   ├── src_hosts.sql
│   │   ├── src_listings.sql
│   │   ├── src_reviews.sql
│   ├── dim/                   # Cleaned and enriched dimension tables
│   │   ├── dim_hosts_cleansed.sql
│   │   ├── dim_listings_cleansed.sql
│   │   ├── dim_listings_with_hosts.sql
│   ├── fct/                   # Fact tables for analysis
│   │   ├── fct_reviews.sql
│   ├── mart/                  # Analytical marts
│   │   ├── full_moon_reviews.sql
└── seeds/                     # Static data like full moon dates
```

## Data Lineage Graph
The dbt **lineage graph** provides a visual representation of model dependencies, making it easier to understand data transformations. You can generate and view the lineage graph by running:
```sh
dbt docs generate
dbt docs serve
```

## Installation & Setup
1. Clone this repository:
   ```sh
   git clone https://github.com/jelb30/airbnb_dbt.git
   cd airbnb_dbt
   ```
2. Install dbt (if not already installed):
   ```sh
   pip install dbt-core dbt-snowflake  # Modify based on your data warehouse
   ```
3. Configure your `profiles.yml` file to connect to your **Snowflake** database.
4. Run dbt models:
   ```sh
   dbt run
   ```
5. Test the models:
   ```sh
   dbt test
   ```
6. View the documentation and lineage graph:
   ```sh
   dbt docs generate
   dbt docs serve
   ```

## Usage
- Use the transformed data for analysis, reporting, and dashboards.
- Explore the full moon review impact analysis in `full_moon_reviews.sql`.

## Future Improvements
- Adding **more complex transformations** for better insights.
- Integrating **dashboarding tools** like Looker/Tableau for visualization.
- Performance optimization for handling even **larger Airbnb datasets**.
- Expanding **orchestration capabilities** with **Dagster** to automate more workflows.
- Enhancing documentation with more **detailed explanations and examples**.
