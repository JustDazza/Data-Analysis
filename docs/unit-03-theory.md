# 📊 Unit 03: Collection, Processing and Preparation of Data

## 📂 Learning Outcome 1: Be able to identify sources of data

### 📥 1.1 Internal Sources of Data
Internal data is information generated, collected, and managed entirely within an organisation (First-party data).
* **Characteristics**: Exclusive to the organisation and tailored to specific business needs.
* **Examples**: 
    * **Financial**: Sales receipts, POS transactions, payroll.
    * **Customer**: CRM databases, loyalty card data, website cookies.
    * **Operations**: Inventory logs, sensor data from machinery.
* **Reliability**: Usually high, as the organisation controls the collection methods and environment.

### 🌐 1.2 External Sources of Data
External data is obtained from sources outside the organisation to provide broader market context.
* **Categories**:
    * **Public/Open Data**: Government census, inflation rates (ONS), weather reports.
    * **Third-Party Data**: Market research from firms like Nielsen or Gartner.
    * **Competitor Data**: Price lists, annual reports, or social media sentiment.
* **Reliability**: Varies significantly; requires vetting for bias, age of data, and the credibility of the publisher.

### ⚖️ 1.3 Assessing Data Reliability
Reliability is the consistency of a measure. In data analysis, we assess reliability through:
* **Stability**: Does the data remain consistent over time?
* **Reproducibility**: If another analyst used the same source, would they reach the same conclusion?
* **Credibility**: Is the source a recognised professional body or government agency?

### 💎 1.4 Data Quality and Characteristics of "Good" Data
Domain knowledge is required to identify if data is "fit for purpose." The characteristics of good data include:
* **Accuracy**: Does it reflect the real-world truth?
* **Completeness**: Are there missing values that could skew results?
* **Consistency**: Is the format uniform across the entire dataset?
* **Timeliness**: Is the data recent enough to be relevant to current decisions?
* **Relevance**: Does the data actually help answer the specific research question?

### 🛡️ 1.5 Data Validation Checks
Validation ensures data is clean and accurate before it enters the analytical pipeline. Common checks include:
* **Type Check**: Ensuring a field contains only numbers or only text.
* **Range Check**: Ensuring numbers fall within a logical limit (e.g., age cannot be 200).
* **Format Check**: Ensuring data matches a pattern (e.g., Postcodes or Email addresses).
* **Consistency Check**: Comparing two fields to ensure they make sense together (e.g., Delivery Date cannot be before Order Date).

---

## 🔍 Learning Outcome 2: Understand different research methods for collecting data

### 🧪 2.1 Research Methods
* **Quantitative**: Focuses on numbers and "How many?" (Surveys, POS logs, physical measurements).
* **Qualitative**: Focuses on "Why?" and "How?" (Interviews, focus groups, open-ended observations).
* **Triangulation**: The practice of using both methods to validate findings. For example, using sales data (Quant) to see *what* is selling, and interviews (Qual) to understand *why* customers prefer it.

### 🤝 2.2 Ethical Collection of Data
Ethics in data collection involves respecting the rights of participants and following legal frameworks like UK GDPR.
* **Informed Consent**: Participants must know what data is being collected and why.
* **Anonymity/Confidentiality**: Ensuring individuals cannot be identified from the dataset.
* **Right to Withdraw**: Participants must be able to remove their data at any time.
* **Transparency**: Being open about how data will be stored and who will have access to it.

---

## 🛠️ Learning Outcome 3: Be able to structure and prepare data

### ⚙️ 3.1 The ETL Process (Extract, Transform, Load)
Data preparation is usually managed through a three-step pipeline:
1.  **Extract**: Pulling raw data from sources (CSVs, Databases, APIs).
2.  **Transform**: Cleaning the data (removing duplicates, fixing typos, standardising formats).
3.  **Load**: Importing the clean data into a tool for analysis (Google Sheets, Power BI, SQL).

### 🧹 3.2 Data Cleansing Measures
Applied during the "Transform" stage to ensure data integrity:
* **Remove Duplicates**: Deleting identical rows to prevent over-counting.
* **Length Checks**: Ensuring strings aren't too long or short (e.g., validating a 7-character ID).
* **Sense Checks**: Identifying "Outliers" that are mathematically possible but logically unlikely (e.g., a £500 cup of coffee).

### 💾 3.3 Data Storage Methods
Organisations must choose storage based on security, cost, and accessibility:
* **Local Storage**: Data kept on a physical hard drive (Fast but risky if hardware fails).
* **Cloud Storage**: Data kept on remote servers like Google Drive or Azure (Scalable and accessible).
* **NAS (Network Attached Storage)**: A private cloud for a specific office/LAN.

### 🛡️ 3.4 Data Integrity: The 3-2-1 Rule
To protect against data loss, the professional standard is:
* **3 Copies of Data**: The original and two backups.
* **2 Different Media**: e.g., One on a local PC, one on an external drive.
* **1 Copy Off-site**: e.g., Cloud storage, to ensure data survives physical disasters (fire/theft).