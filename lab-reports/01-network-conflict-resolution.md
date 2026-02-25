# Case Study 01: Environment Isolation & Protocol Routing

**Date:** February 2026  
**Project:** NCFE Data Analytics Lab  
**Status:** Completed & Verified  

---

## 🔍 Executive Summary
This report details the resolution of a critical service conflict on a RackNerd VPS where a MySQL deployment interrupted a production Zipline dashboard. By implementing **Layer 4 TCP Streams** and **IPAM (IP Address Management)**, I restored service availability and secured remote database access.

## 🛠️ Infrastructure Breakdown
* **Production Stack:** Zipline (Node.js/Prisma) + PostgreSQL
* **Learning Stack:** MySQL 9.6 + HeidiSQL
* **Network Gateway:** Nginx Proxy Manager (NPM) + Cloudflare

---

## 🔧 Technical Implementation

### **Phase 1: Addressing the IP Collision**
The primary failure was caused by Docker's default bridge assigning the same IP (`172.20.0.5`) to two different database services.
* **Action:** Modified the MySQL Compose stack to use a **Static IP** (`172.20.0.100`).
* **Outcome:** Prevented future address "stealing" during container restarts.

### **Phase 2: Transitioning to TCP Streams**
Standard HTTP Proxying failed with **525 Handshake** errors because SQL traffic is not web-compatible.
* **Action:** Deleted the Proxy Host and established an **NPM Stream** on port `3306`.
* **Action:** Enabled **TCP Forwarding** to pass raw data packets directly to the MySQL container.

### **Phase 3: Network Security**
* **Firewall:** Updated `UFW` rules to whitelist `3306/tcp` while maintaining a strict "Deny" policy on all other ports.
* **DNS:** Set Cloudflare to **Grey Cloud (DNS Only)** for `sql.justdazza.com` to bypass web-only SSL checks.

---

## 📊 Data Verification
Using **HeidiSQL**, I verified the data integrity of the `inventory_measurements` table:

| Record ID | Item Name | Measured Weight |
| :--- | :--- | :--- |
| 1 | Initial Batch A | **452.7g** |
| 2 | Initial Batch B | **323.8g** |



---

## 🎓 NCFE Unit Mapping
* **Unit 2 (Security):** Evidence of firewall management and network isolation.
* **Unit 4 (Troubleshooting):** Evidence of diagnostic testing using `nc -zv` and log analysis.

---

## 💻 Technical Snippets

### **Firewall Configuration (UFW)**
Used to whitelist specific ports while maintaining a "Deny All" incoming policy:
```bash
ufw allow 80/tcp    # HTTP
ufw allow 443/tcp   # HTTPS
ufw allow 3306/tcp  # MySQL Stream
ufw reload
```

**Nginx Proxy Manager Stream Config**
Configuration for the Layer 4 Stream to route database traffic:

**Incoming Port:** 3306
**Forward Host:** 172.20.0.100 (Static IP)
**Forward Port:** 3306

```bash
nc -zv sql.justdazza.com 3306
# Expected Output: Connection to sql.justdazza.com 3306 port [tcp/mysql] succeeded!
```