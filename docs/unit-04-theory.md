# 📈 Unit 04: Interpretation of Data

## 📂 Learning Outcome 1: Understand how to assess different forms of data

### 🔡 1.1 Forms of Data
Data can be categorised by its structure and format to ensure correct processing.
* **Structured Data**: Highly organised data with a predefined model, such as SQL databases or spreadsheets.
* **Unstructured Data**: Information with no predefined structure, making it harder to analyse (e.g. emails, images, videos).
* **Semi-structured Data**: Data that doesn't reside in a relational database but has some organisational markers (e.g. JSON, XML).
* **Data Formats**:
    * **Text**: Alphabetic characters for names or descriptions.
    * **Numbers**: Numeric values used for counting or financial calculations.
    * **Strings**: Alphanumeric combinations often used for IDs (e.g. "A12345").
* **Discrete vs. Continuous**:
    * **Discrete**: Countable, distinct values existing in fixed increments (e.g. number of students).
    * **Continuous**: Measurable values that can take any value within a range, including decimals (e.g. temperature, time).
* **Metadata**: "Data about data" that describes the properties of a file, such as author, creation date, and file size.

### 🚨 1.2 Data Outliers
An outlier is a data point that differs significantly from other observations in a dataset.
* **Types**:
    * **Natural Outliers**: Valid but rare observations (e.g. a VIP customer making a massive purchase).
    * **Input Errors**: Result from human mistakes during data entry (e.g. typing 300 instead of 30).
    * **Measurement Errors**: Caused by faulty tools or uncalibrated instruments.
* **Impact**: Outliers can drastically skew the **Mean** (average), while having less impact on the **Median**.

### 🔑 1.3 Database Relationships and Primary Keys
Relationships connect tables to organise data logically and maintain integrity.
* **Primary Key (PK)**: A column that uniquely identifies each record in a table; it cannot be null or duplicated.
* **Identifying Relationship**: The child table cannot exist without the parent, and the parent's PK is part of the child's PK (e.g. Order and Order_Details).
* **Non-Identifying Relationship**: Tables are related but can exist independently; the parent's PK is a foreign key (FK) in the child but not part of its PK.

### 💬 1.4 Text Analytics Techniques
Extracting meaningful information and insights from written text.
* **Sentiment Analysis**: Determining the emotional tone (positive, negative, neutral).
* **Keyword Extraction**: Finding the most important words in a document.
* **NLP (Natural Language Processing)**: Helping computers understand human language structures.

---

## 🔢 Learning Outcome 2: Understand statistical terms used in data analysis

### 📊 2.1 Basic Statistical Functions
Methods used to summarise large datasets into understandable values.
* **Sum**: Total of all numbers.
* **Count**: Number of entries (`COUNT` for numbers, `COUNTA` for non-blank cells).
* **Mean**: The mathematical average (Sum ÷ Count).
* **Mode**: The most frequently occurring value.
* **Median**: The middle value in a sorted dataset.
* **Range**: The difference between the maximum and minimum values.

### ↔️ 2.2 Variance and 🎢 2.3 Skewness
* **Variance**: Measures how spread out the data points are from the mean. Higher variance indicates more diverse data.
* **Skewness**: Measures the asymmetry of a dataset.
    * **Positive (Right) Skew**: The tail is longer on the right side (mean > median).
    * **Negative (Left) Skew**: The tail is longer on the left side (mean < median).
    * **Symmetrical**: The left and right sides mirror each other (no skew).

---

## 🛠️ Learning Outcome 3: Be able to manipulate data in a spreadsheet

### 🛡️ 3.2 Data Anonymisation
Protecting private information by removing or modifying identifiable elements to comply with laws like GDPR.
* **Data Masking**: Replacing data with fictional values or symbols (e.g. A**** L**).
* **Pseudonymisation**: Replacing identifiers with pseudonyms (e.g. Customer IDs).
* **Suppression**: Removing sensitive fields entirely.

### 🔍 3.3 Lookup Functions
* **VLOOKUP**: Searches vertically for a value in the first column and returns data from the same row.
* **HLOOKUP**: Searches horizontally in the first row and returns data from the same column.

### 🚨 3.5 Actions Relating to Outliers
When an outlier is identified, analysts must decide on the best course of action:
* **Retention**: Keeping the outlier if it is a valid "Natural Outlier" to maintain an accurate business history.
* **Correction**: Updating the value if it is a proven input error (e.g. fixing a typo).
* **Transformation**: Using a logarithmic scale to pull extreme values closer to the rest of the data on a chart.

### 🔄 3.6 Pivot Tables
A dynamic tool used to summarise, analyse, and group large datasets efficiently without altering the source data.