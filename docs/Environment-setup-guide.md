# 🚀 NCFE Data Lab: Infrastructure & Environment Setup Guide

This guide provides the necessary steps to replicate the data lab environment, manage the containerised infrastructure, and connect to the database instances for analysis.

---

## 🌐 Infrastructure Overview
The lab is hosted on a high-availability **Linux VPS (RackNerd)**, providing a persistent environment for data analysis that is accessible from any workstation.

### **The Tech Stack**
* **Operating System:** Ubuntu 22.04 LTS
* **Containerisation:** Docker & Docker Compose
* **Database Engines:** MySQL (Latest)
* **Traffic Management:** Nginx Proxy Manager (NPM) handling Layer 4 TCP Streams.
* **Security:** UFW (Uncomplicated Firewall) and Docker Network Isolation.

---

## 🚀 Deployment & Containerisation
The learning environment is managed via **Infrastructure as Code (IaC)** using Docker Compose. This ensures that the database environment is consistent, isolated, and easily reproducible.

### **Docker Compose Configuration**
Below is the orchestrated setup for the primary learning database:

```yaml
version: '3.8'

services:
  mysql-learning-db:
    image: mysql:latest
    container_name: mysql-learning
    environment:
      MYSQL_ROOT_PASSWORD: ${DATABASE_PASSWORD}  # Managed via environment variables
      MYSQL_DATABASE: practice_db
    ports:
      - "3307:3306"
    networks:
      proxy-network:
        ipv4_address: 172.20.0.100  # Resolved IP conflict with Zipline service
    volumes:
      - mysql_data:/var/lib/mysql
    restart: always

networks:
  proxy-network:
    external: true

volumes:
  mysql_data:
```

### Deployment Insights
* **IP Conflict Resolution:** A static IP (172.20.0.100) was manually assigned to avoid collisions with the Zipline service on the same bridge network.
* **Port Mapping Strategy:** The container is mapped to host port 3307 to prevent internal resource conflicts on the VPS.
* **Schema Segmentation:** A single MySQL service is used to host multiple isolated databases (practice_db and SmartCoffeeShop), optimising VPS resource usage while maintaining project separation.

---

## 🏗️ Database Initialisation
Follow these steps in order to build the schemas and populate the initial data for both the practice environment and the primary case study.

### **1. Practice Lab Setup (`practice_db`)**
Used for fundamental SQL training and precision inventory logging.

* **Execute:** [`/scripts/lab-setup.sql`](../scripts/lab-setup.sql)
  * Builds the `inventory_measurements` table and seeds the raw gram data (e.g., **452.7g** and **323.8g**).
* **Execute:** [`/scripts/data-dictionary.sql`](../scripts/data-dictionary.sql)
  * Establishes the standard data dictionary for the lab to ensure metadata consistency.

### **2. Smart Coffee Shop Analysis (`SmartCoffeeShop`)**
The end-to-end case study for the NCFE Unit 2 portfolio.

* **Execute:** [`/lab-reports/Smart-Coffee-Shop-Analysis/scripts/01_database_setup.sql`](../lab-reports/Smart-Coffee-Shop-Analysis/scripts/01_database_setup.sql)
  * Orchestrates the 9-table relational schema and prepares the environment for retail data import.
* **Execute:** [`/lab-reports/Smart-Coffee-Shop-Analysis/scripts/00_coffee_shop_dictionary.sql`](../lab-reports/Smart-Coffee-Shop-Analysis/scripts/00_coffee_shop_dictionary.sql)
  * Applies project-specific metadata, defining units of measure and column descriptions for the coffee shop dataset.

## 🔌 Connection Details
To access the database via **HeidiSQL** or other GUI tools:

* **Hostname:** `sql.justdazza.com`
* **Port:** `3306`
* **Network Type:** TCP/IP (MySQL/MariaDB)

## 🛡️ Security & Access Control
* **Firewall**: Access is restricted via **UFW** on the origin server.
* **Routing**: Traffic is managed through an **Nginx Proxy Manager Stream.** This translates external **3306** traffic to the internal **3307** service port, isolating the database engine from direct exposure while maintaining standard connection strings for the client.

---
*Last Updated: March 2026*
---