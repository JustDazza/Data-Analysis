# Operational Demand Analysis: London Fire Brigade (LFB)
### 🚒 Data-Driven Strategy for Resource Optimisation & Performance Resilience

## 📌 Project Overview
This project provides a comprehensive analysis of approximately **300,000 raw operational records** from the London Fire Brigade (LFB) to identify demand patterns and improve resource efficiency. By leveraging Python for large-scale data engineering, the analysis isolates geographic hotspots, defines critical temporal surge windows, and identifies the unique "Operational DNA" of London’s highest-volume fire stations.

The findings move beyond descriptive statistics to provide actionable strategic recommendations aimed at protecting response buffers and enhancing fire prevention ROI.

### 📊 Key Statistics at a Glance
<p align="left">
  <img src="https://i.justdazza.com/hDqqg.png" width="600" alt="Drinks Project Overview">
</p>

---

## 🛠️ Technical Stack & Methodology
* **Language:** Python 3.x
* **Libraries:** Pandas, NumPy (Data Engineering, Cleaning, & Aggregation)
* **Tools:** Google Sheets (Visualisation), PowerPoint (Executive Reporting)
* **Scale:** Processed **293,647 raw records** (Jan 2024 onwards) into a cleaned operational dataset of **138,912 records**.

### The Python Data Pipeline
Managing nearly 300,000 rows required a robust automated cleaning process:
1.  **Temporal Filtering:** Isolated a 12-month operational window (March 2025 – Feb 2026) to ensure current relevance.
2.  **Data Integrity:** Identified and removed null values in `AttendanceTime` to prevent performance metric skewing.
3.  **Standardisation:** Harmonised inconsistent station naming conventions across the dataset to ensure geographical accuracy.
4.  **Feature Engineering:** Converted raw seconds into attendance minute benchmarks and categorised time-of-call into 24-hour surge blocks.

---

## 💡 Key Analytical Insights

### 1. The "Evening Surge" (Temporal Demand)
The data identifies a critical **High-Pressure Window between 16:00 and 20:00**. This four-hour block represents the peak daily demand where resource saturation is highest. 
* **Finding:** Incident volume begins its sharpest ascent at 16:00, tracking perfectly with resource pressure (pump hours).

### 2. Geographical Outliers (Hotspot Mapping)
**Westminster** is the primary regional outlier, generating nearly **30% of total regional demand**. Within this borough, demand is hyper-concentrated at **Paddington and Soho** stations.

### 3. Operational DNA (Risk Profiling)
A cross-sectional analysis reveals that demand is not monolithic. Despite being geographical neighbours, the two busiest stations exhibit different risk "DNAs":
* **Soho:** Driven by **Commercial (Non-Residential)** incidents.
* **Paddington:** Driven by **Residential (Dwelling)** incidents.

---

## 🚀 Strategic Recommendations

1.  **Precision Prevention:** Transition from generic borough-wide safety campaigns to station-specific interventions (e.g., Commercial Fire Safety Audits in Soho vs. Residential Home Fire Safety Visits in Paddington).
2.  **Surge-Window Readiness:** Implementation of "High-Pressure Protocols" during the 16:00–20:00 window, ensuring all non-essential training and administrative tasks are completed during off-peak hours to protect appliance availability.
3.  **Refuse Mitigation Partnerships:** Proactive engagement with local authorities to address "Outdoor Structure" (refuse) fires in identified hotspots, reclaiming operational capacity for life-safety calls.
4.  **Scaling Excellence:** Standardising the turnout protocols used by Soho and Paddington, who consistently beat the **360-second target** despite extreme volume, to improve performance across the wider Brigade.

---

## 📈 Performance Scorecard
Analysis confirms that the highest-volume hubs are successfully exceeding the LFB's statutory attendance targets:
* **Paddington:** 308s Average (**52s Buffer**)
* **Soho:** 323s Average (**37s Buffer**)

---
*(Note: Google sheets and presentation slides are available in the repository files).*