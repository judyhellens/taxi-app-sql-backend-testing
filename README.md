# 🚕 Taxi Application — SQL & Backend Testing Project

## 📌 Project Overview

Technical QA project focused on backend validation, SQL analysis, Linux log investigation, debugging, and database testing for a taxi application platform.

This project involved investigating backend issues, analyzing operational logs, validating business rules through SQL queries, and supporting bug investigation processes in a simulated production environment.

---

# 🛠️ Technologies & Tools

- SQL
- PostgreSQL
- Linux Console
- Backend Testing
- Data Validation
- Debugging
- Log Analysis
- API Validation
- Google Docs
- GitHub

---

# 🐧 Linux Log Investigation

## 📌 Task 1 — Investigating Requests from Specific IP Addresses

### Objective
Identify requests coming from IP addresses starting with:

```bash
233.201.
```

### Command Used

```bash
grep -R '^233.201.' ~/logs/2019/12
```

### Result Example

```bash
/home/morty/logs/2019/12/apache_2019-12-18.txt:
233.201.188.154 - - [18/12/2019:21:46:01 +0000]
"DELETE /events HTTP/1.1" 403 3971

/home/morty/logs/2019/12/apache_2019-12-21.txt:
233.201.182.9 - - [21/12/2019:21:56:20 +0000]
"PATCH /users HTTP/1.1" 400 4118
```

---

# 📂 Task 2 — HTTP Error Investigation

## Objective

Investigate backend failures by filtering HTTP 400 and HTTP 500 errors from production logs.

---

## Commands Used

### Create Directories

```bash
mkdir bug1
mkdir bug1/events
```

### Extract Logs From Specific Date

```bash
grep '30/12/2019' ~/logs/2019/12/* > ~/logs/bug1/main.txt
```

### Filter HTTP 400 Errors

```bash
grep ' 400 ' ~/logs/bug1/main.txt > ~/logs/bug1/events/400.txt
```

### Filter HTTP 500 Errors

```bash
grep ' 500 ' ~/logs/bug1/main.txt > ~/logs/bug1/events/500.txt
```

---

## Sample Results

### HTTP 400 Errors

```bash
/home/morty/logs/2019/12/apache_2019-12-30.txt:
80.57.170.51 - - [30/12/2019:21:35:12 +0000]
"DELETE /users HTTP/1.1" 400 3623
```

### HTTP 500 Errors

```bash
/home/morty/logs/2019/12/apache_2019-12-30.txt:
64.250.112.189 - - [30/12/2019:21:35:13 +0000]
"PUT /parsers HTTP/1.1" 500 4639
```

---

# 🗄️ SQL Database Analysis

## 📌 Task 1 — Total Number of Cabs

### Objective

Validate the total number of registered cabs in the database.

### SQL Query

```sql
SELECT 
COUNT(*) AS cnt 
FROM cabs;
```

### Result

```bash
5529
```

---

# 📌 Task 2 — Companies With Less Than 100 Cars

### Objective

Identify taxi companies operating with fewer than 100 registered vehicles.

### SQL Query

```sql
SELECT
company_name,
COUNT(*) AS cnt
FROM cabs
GROUP BY company_name
HAVING COUNT(*) < 100
ORDER BY cnt DESC;
```

### Key Findings

- Nova Taxi Affiliation Llc → 97 cars
- Patriot Taxi Dba Peace Taxi Associat → 89 cars
- Blue Diamond → 85 cars
- Checker Taxi Affiliation → 81 cars

---

# 📌 Task 3 — Weather Condition Validation

### Objective

Validate weather condition classification using SQL CASE statements.

### SQL Query

```sql
SELECT
ts,
CASE
WHEN description ILIKE '%rain%' 
OR description ILIKE '%storm%' 
THEN 'Bad'
ELSE 'Good'
END AS weather_conditions
FROM weather_records
WHERE ts BETWEEN 
'2017-11-05 00:00:00' 
AND '2017-11-05 23:59:59'
ORDER BY ts;
```

### Validation Example

| Timestamp | Weather Condition |
|---|---|
| 2017-11-05 00:00:00 | Good |
| 2017-11-05 01:00:00 | Bad |
| 2017-11-05 02:00:00 | Good |

---

# 📌 Task 4 — Taxi Trips Analysis

### Objective

Analyze the number of trips completed by taxi companies during a specific time period.

### SQL Query

```sql
SELECT
c.company_name,
COUNT(t.trip_id) AS trips_amount
FROM trips t
JOIN cabs c
ON t.cab_id = c.cab_id
WHERE DATE(t.start_ts) 
BETWEEN '2017-11-15' 
AND '2017-11-16'
GROUP BY c.company_name
ORDER BY trips_amount DESC;
```

### Top Companies Identified

| Company | Trips |
|---|---|
| Flash Cab | 19558 |
| Taxi Affiliation Services | 11422 |
| Medallion Leasin | 10367 |
| Yellow Cab | 9888 |

---

# ✅ Skills Demonstrated

- Backend Testing
- SQL Queries
- Data Validation
- Linux Log Investigation
- Bug Investigation
- Debugging
- Business Logic Validation
- Database Analysis
- QA Documentation
- Problem Solving

---

# 📄 Original Project Documentation

Google Docs Project:
https://docs.google.com/document/d/1Vuvm6C-EUZ7NFF5riRa176j76OChuUwzS7TQLt0oJfU/edit

---

# 👩‍💻 Author

Judy Hellen dos Santos Silva  
QA Software Engineering
