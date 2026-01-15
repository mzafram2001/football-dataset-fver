# ⚽️ football-dataset-fver

![Status](https://img.shields.io/badge/Status-Free-orange)
![License](https://img.shields.io/badge/License-CC_BY_NC-blue)
![Format](https://img.shields.io/badge/Format-CSV-green)
![Version](https://img.shields.io/badge/Version-v20260115-purple)

## 📖 About this repo
This repository contains a **free sample** of historical football (soccer) match results, specifically curated for **Data Science, Machine Learning models, and Sports Betting analytics**.

The data is cleaned, normalized, and ready to be loaded into **Python (Pandas), R, or Excel**.

> **⚠️ Note:** This is a **static demo** repository. The data contained here is **NOT** automatically updated.

## 🚀 Free vs. Premium: Why Upgrade?
To support the maintenance of this project, we offer a **Premium Repository** that is automatically updated every week with the latest match results and odds.

| Feature | 🆓 Free Version (This Repo) | ⚡ Premium Version (Sponsors) |
| :--- | :---: | :---: |
| **History Depth** | Sample Season (e.g., 2018-2019) | **Full History (2000 - Present)** |
| **Updates** | Static (Never updated) | **Automatic (Weekly/Daily)** |
| **Coverage** | Single League Demo | **Top 10+ Major Leagues** |
| **Data Types** | Basic Results | **+ Betting Odds & Match Stats** |
| **Access** | Public | **[Become a Sponsor to Access]** |

👉 **[GET FULL ACCESS & AUTOMATIC UPDATES HERE](YOUR_PATREON_OR_SPONSORS_LINK)**

## 📂 Database Schema (Relational Structure)

### 1. `results.csv` (Fact Table)
Contains all 380 matches of the season.
* `id` (PK): Unique Match ID.
* `date`: Match date.
* `season_id` (FK): Links to `seasons.csv`.
* `home_id` / `away_id` (FK): Links to `teams.csv`.
* `home_goals_full_time` / `away_goals_full_time`: Final score.
* `result`: Outcome (**H**/D/A).
* `b365h_odds` / `b365d_odds` / `b365a_odds`: Betting odds.

### 2. `teams.csv` (Dimension Table)
* `id` (PK): Team ID.
* `name`: Official Team Name (e.g., "Real Madrid").
* `code`: 3-letter abbreviation (e.g., "RMA").
* `color`: Team Hex Color code.

### 3. `seasons.csv` (Dimension Table)
* `id` (PK): Season ID.
* `year`: Season Name (e.g., "2015-2016").

## 💻 Usage Example (Python)

Since this is a relational database, you need to **merge** `results.csv` with `teams.csv` to replace IDs with Team Names.

Here is a robust Python script that cleans the raw data and calculates the **Top Scoring Home Teams**:

```python
import pandas as pd

# 1. Load the datasets directly from GitHub
base_url = "[https://raw.githubusercontent.com/mzafram2001/football-dataset-fver/refs/heads/main/data/](https://raw.githubusercontent.com/mzafram2001/football-dataset-fver/refs/heads/main/data/)"
df_results = pd.read_csv(base_url + "results.csv")
df_teams = pd.read_csv(base_url + "teams.csv")

# 2. Data Cleaning (Best Practice)
# The raw CSVs might have leading spaces in column names or values. Let's fix that.
df_results.columns = df_results.columns.str.strip()
df_teams.columns = df_teams.columns.str.strip()
df_teams['name'] = df_teams['name'].str.strip()

# 3. Merge: Connect Matches with Team Names
# We join results.home_id -> teams.id
df_merged = df_results.merge(df_teams, left_on='home_id', right_on='id', how='left')

# 4. Analysis: Who scored the most goals at home?
top_scorers = df_merged.groupby('name')['home_goals_full_time'].sum().sort_values(ascending=False)

print("🏆 Top 5 Home Scoring Teams (2015-2016):")
print(top_scorers.head())

Output:
🏆 Top 5 Home Scoring Teams (2015-2016):
name
Real Madrid        70
Barcelona          67
Sevilla            38
Athletic Club      35
Atlético Madrid    33
Name: home_goals_full_time, dtype: int64
```
