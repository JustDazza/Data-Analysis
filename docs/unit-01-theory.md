# 📖 Unit 01: Introduction to Data Analysis

This document serves as a live draft for Unit 01, mapping theoretical concepts to the "Smart Coffee Shop" business case study.

---

## 🔍 1. Understanding Data vs. Information
The primary difference is that **Data** is the raw, unorganised input, while **Information** is the contextualised, meaningful output gained from processing that data to aid in decision-making.

* **Data (The Input):** Raw, unorganised facts or figures. By itself, it is a "dormant asset" because it lacks context.
    * *Example:* The raw number **452.7**. Without a unit or subject, this value cannot help a business.
* **The Transformation (The "Brewing" Analogy):** Data becomes information through processing (cleansing, calculating, and categorising). 
    * *Analogy:* In my Smart Coffee Shop project, raw data is like **coffee grounds**—unprocessed and not yet ready for use. Processing is the **brewing** stage (using SQL/Python on my VPS).
* **Information (The Output):** The "brewed" result that provides clear insight.
    * *Example:* **"The coffee bean Batch A weight is 452.7g."** By adding the unit (grams) and subject (Batch A), we can now make a decision, such as whether to order more stock.

### ⛰️ 1.5 The DIKW Pyramid
The DIKW pyramid represents the structural and functional relationships between Data, Information, Knowledge, and Wisdom. Each step up the pyramid adds context, application, and value.

* **Data**: Raw facts and figures (e.g., **452.7g**).
* **Information**: Data with context, answering "who, what, where, or when" (e.g., **"Batch A weighs 452.7g"**).
* **Knowledge**: How we use the information; it answers "how" (e.g., **"Based on past trends, 452.7g is below our minimum stock level"**).
* **Wisdom**: The final stage of using knowledge to make a sound decision; it answers "why" (e.g., **"Ordering more beans now to prevent a stock-out and loss of revenue tomorrow"**).

---

## ⚙️ 2. Key Components of Data Analysis
According to the curriculum, data analysis is a cyclical process consisting of six integrated components that ensure data is handled correctly from start to finish.


1. **Data Collection**: Gathering relevant and accurate data from various sources (e.g., smart sensors, sales logs, or customer feedback).
2. **Data Cleaning**: Identifying and removing inconsistencies, duplicates, or errors to ensure the data is reliable.
3. **Data Organisation**: Structuring the cleaned data into a format ready for analysis, such as a database table or a spreadsheet.
4. **Data Interpretation**: Examining the organised data to understand specific trends, patterns, and relationships.
5. **Data Visualisation**: Presenting findings through visual aids like charts and graphs to make complex insights easier to digest.
6. **Results and Communication**: Delivering the final, actionable insights to stakeholders to guide business strategy and decision-making.


**Coffee Shop Example**: 
We **collect** bean weights, **clean** the sensor errors, **organise** them by date, **interpret** that waste is rising, **visualise** this on a dashboard, and **communicate** to the manager that we need to recalibrate the grinder.

---

## 📊 3. Qualitative vs. Quantitative Data
Understanding the difference between numerical and descriptive data is essential for choosing the correct analysis method.

### **Quantitative Data (Numerical)**
Data that can be measured or counted. It is highly structured and used for **Statistical Analysis**.
* **Focus**: Answers "How much?", "How many?", or "How often?"
* **Sub-types**:
    * **Discrete**: Countable whole numbers (e.g., **42** Flat Whites sold today).
    * **Continuous**: Precise measurements on a scale (e.g., Milk temperature at **65.5°C** or bean weight at **323.8g**).
* **Coffee Shop Analysis**: Calculating the average transaction value or identifying the busiest hour of the day.



### **Qualitative Data (Descriptive)**
Descriptive data that provides "quality" insights. It is often unstructured and requires **Thematic Analysis** (identifying recurring patterns or topics).
* **Focus**: Answers "Why?" or "How?" to provide context to the numbers.
* **Examples**: 
    * **Roast levels**: Light, Medium, Dark.
    * **Customer Feedback**: "The espresso had a nutty aftertaste" or "The seating area feels a bit cramped."
* **Coffee Shop Analysis**: Categorising feedback forms to see if a recurring theme (e.g., "slow service") explains a drop in quantitative sales figures.

---

## 📈 4. The Four Types of Data Analytics
Data analytics is categorised into four types that move from understanding the past to optimising the future. As the complexity of the analysis increases, so does the strategic value it provides to the business.

| Type | Definition | Question | Coffee Shop Application |
| :--- | :--- | :--- | :--- |
| **Descriptive** | Summarising historical data to identify trends and patterns. | *What happened?* | Calculating that the average bean waste last week was **452.7g**. |
| **Diagnostic** | Examining data to find the root cause of a specific event or trend. | *Why did it happen?* | Identifying that a **10%** drop in sales was due to a broken espresso machine. |
| **Predictive** | Using historical patterns and models to forecast future outcomes. | *What will likely happen?* | Estimating that next Thursday will require **18kg** of beans based on past footfall. |
| **Prescriptive** | Recommending specific actions or automated responses to achieve a goal. | *How can we make it happen?* | Automatically triggering a "2-for-1" pastry alert on the app during slow Tuesday afternoons. |

---

## 📏 5. Measuring Data & Big Data
Digital data is measured in a binary hierarchy (base-2), where each level increases by a factor of **1,024**.

| Unit | Size | Real-World Context |
| :--- | :--- | :--- |
| **Bit (b)** | 0 or 1 | Smallest unit of digital data. |
| **Byte (B)** | 8 bits | A single character (e.g., "A"). |
| **Kilobyte (KB)** | 1,024 B | A text-based transaction record (e.g., 452.7g). |
| **Megabyte (MB)** | 1,024 KB | A high-resolution photo for social media. |
| **Gigabyte (GB)** | 1,024 MB | 1 hour of HD streaming (~3GB) or **UHD/4K (~10GB)**. |
| **Terabyte (TB)** | 1,024 GB | 1,000 hours of UHD video (~10TB). |
| **Petabyte (PB)** | 1,024 TB | **Netflix processes 5PB of user logs every single day.** |
| **Zettabyte (ZB)** | 1,024 EB | Annual global internet traffic ($1\text{ ZB} = 1,048,576\text{ PB}$). |



### **The 5 Vs of Big Data (Netflix Case Study)**
To understand large-scale datasets, we define them using the **Netflix Recommendation System** as a benchmark:

* **Volume (Amount):** Netflix handles the **5PB of daily log data** generated by 300m+ users tracking every click and hover.
* **Velocity (Speed):** Data is processed in near real-time. Recommendations must update within seconds of a user finishing a show to maintain engagement.
* **Variety (Type):** 
    * **Structured:** User account and billing details (SQL).
    * **Semi-Structured:** JSON/XML log files from various devices and APIs.
    * **Unstructured:** The actual video files, thumbnails, and audio tracks.
* **Veracity (Quality):** The system must "clean" data to ensure accuracy—for example, ignoring a movie that played while a user was asleep so it doesn't skew future recommendations.
* **Value (Insight):** The ultimate goal is **customer retention**. Accurate recommendations drive 80% of content watched, keeping users subscribed.

---

## ⚖️ 6. Ethical Data Analysis
Analysis must be conducted ethically to maintain public trust and comply with legal frameworks like **GDPR** and the **Data Protection Act 2018**.

* **Informed Consent**: Ensuring users are aware of data collection through clear privacy notices.
* **Anonymisation & Pseudonymisation**: Removing or masking personally identifiable information (PII) so individuals cannot be identified from the dataset.
* **Data Minimisation**: Limiting collection to only the data strictly necessary for the specific analysis task.
* **Bias Mitigation**: Regularly auditing models to ensure they do not produce discriminatory outcomes based on flawed historical data.
* **Smart Coffee Shop Application**: If implementing a loyalty app, we must ensure location data is only tracked while the app is in use and that customer names are encrypted in the main sales database.
