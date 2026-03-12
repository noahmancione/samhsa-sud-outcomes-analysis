# SUD Treatment Outcomes Analysis
### SAMHSA Treatment Episode Data Set — Discharges (TEDS-D) 2023

## Overview
This project analyzes 1,474,025 substance use disorder treatment discharge records 
from SAMHSA's 2023 TEDS-D dataset to identify patterns in treatment completion rates 
across substance type, age, gender, and length of stay. Findings are intended to 
support clinical leadership decision-making in SUD treatment settings.

**Tools Used:** Python (Pandas, NumPy), Tableau Public  
**Data Source:** SAMHSA TEDS-D 2023 — publicly available at samhsa.gov  
**Interactive Dashboard:** [View Live Dashboard](https://public.tableau.com/app/profile/noah.mancione/viz/samhsa_sud_outcomes/Dashboard1)

## Key Findings

### 1. Treatment Completion Rates Vary Significantly by Substance
Opioid-related substances consistently show the lowest completion rates — heroin at 24.4%, 
other opiates at 23.0%, and methadone at just 14.4%. Alcohol treatment has the highest 
completion rate at 49.5%. Methamphetamine, the second most common substance in the dataset 
with 180,249 episodes, shows a below-average completion rate of 34.0%, representing a 
significant public health concern.

### 2. Gender Gap in Completion Rates
Female patients complete treatment at 41.5% compared to 43.2% for male patients. 
While the gap is modest, it is statistically meaningful across nearly 1.5 million records 
and may reflect systemic barriers facing women in treatment such as childcare responsibilities 
and trauma history rather than differences in motivation or engagement.

### 3. Age Shows a U-Shaped Completion Pattern
Adolescents (ages 12-14) have the lowest completion rate at 35.3%. Rates rise sharply 
for young adults (18-20 at 47.0%), dip through middle age (30-44 averaging ~41%), 
then climb steadily to a peak of 56.2% for patients 65 and older. Middle-aged patients 
represent the highest volume group and fall consistently below the overall average of 42.6%.

### 4. Length of Stay Strongly Associated with Completion
Patients who complete treatment have a median length of stay of 28 days compared to 
17 days for non-completers — an 11-day gap suggesting early dropout is a primary driver 
of non-completion. Retention interventions focused on the first two weeks may have the 
highest impact on overall completion ra

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
├── visuals/                      ← exported chart screenshots
└── README.md
```

## Data Notes
- Dataset contains 1,474,025 discharge records from 2023
- SAMHSA missing value codes (-9) replaced with NaN prior to analysis
- Columns with >50% missing data excluded from analysis
- Raw data file not tracked in git due to size — download from samhsa.gov

## Disclaimer
This analysis is conducted for portfolio and educational purposes using 
publicly available de-identified data from SAMHSA.