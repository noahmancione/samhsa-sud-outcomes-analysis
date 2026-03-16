# SUD Treatment Outcomes Analysis
### SAMHSA TEDS-D 2023 | Python + PostgreSQL + Tableau

I built this project to explore treatment outcome patterns across 1.47 million 
substance use disorder discharge records from SAMHSA's 2023 TEDS-D dataset. 
The goal was to practice working with large real-world healthcare data and find 
insights that would be meaningful to a clinical or operational team.

**Tools:** Python (Pandas, NumPy), PostgreSQL, Tableau Public  
**Data:** SAMHSA TEDS-D 2023 — samhsa.gov  
**Dashboard:** [View Live on Tableau Public](https://public.tableau.com/app/profile/noah.mancione/viz/samhsa_sud_outcomes/Dashboard1)

## Key Findings

The overall treatment completion rate across all 1.47 million episodes was 42.6%. 
A few patterns stood out worth highlighting.

Opioid-related substances had by far the lowest completion rates: heroin at 24.4%, 
other opiates at 23.0%, and methadone at 14.4%. This is roughly half the rate of alcohol 
treatment at 49.5%. Methamphetamine stood out as a particular concern given its volume: 
180,000+ episodes with only a 34% completion rate.

Completion rates by age follow a U-shape that I didn't expect when creating this project. Adolescents 
(12-14) had the lowest rate at 35.3%, young adults (18-20) peaked at 47%, middle-aged 
patients clustered around 41%, and patients 65+ had the highest rate at 56.2%. The 
older adult finding was the most surprising result in the dataset.

The gender gap was small but consistent — males at 43.2% vs females at 41.5% across 
nearly 1.5 million records. At that sample size the difference is real, and likely 
reflects barriers outside of motivation or engagement.

Patients who completed treatment had a median stay of 28 days vs 17 days for 
non-completers. That 11-day gap suggests the first two weeks are where most dropout happens.

## SQL Analysis

The `sql_analysis/` folder contains six PostgreSQL query files that replicate and 
extend the Python analysis. Queries range from basic aggregations to CTEs and window 
functions. The dataset was loaded into a local PostgreSQL 18 database for this portion 
of the project.

- `01_overview.sql` — dataset summary and discharge reason breakdown
- `02_completion_by_substance.sql` — completion rates by primary substance
- `03_completion_by_age.sql` — completion rates by age group
- `04_completion_by_gender.sql` — completion rates by gender
- `05_length_of_stay.sql` — median and mean LOS by completion status
- `06_advanced_queries.sql` — CTEs and subqueries identifying high-volume, 
below-average substances and above-average age groups

## Repository Structure
```
samhsa_data_analysis/
├── data/
│   ├── tedsd_puf_2023.csv        ← raw SAMHSA data (not tracked in git)
│   ├── tedsd_clean.csv           ← cleaned analysis dataset
│   └── substance/age/gender/los  ← aggregated summary exports
├── notebooks/
│   ├── 01_data_cleaning.ipynb    ← data loading, cleaning, decoding
│   └── 02_analysis.ipynb         ← completion rate analysis
├── sql_analysis/                 ← PostgreSQL query files
├── visuals/                      ← exported chart screenshots
└── README.md
```

## Notes
- SAMHSA missing value codes (-9) replaced with NaN before analysis
- Columns with >50% missing data were excluded
- Raw data not tracked in git due to file size — download from samhsa.gov
- Analysis is for portfolio purposes using publicly available de-identified data
