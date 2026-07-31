# ERP TRAVEL AI

# ENTITY RELATIONSHIP DIAGRAM (ERD)

Version : 1.0

---

## Overview

ERP Travel AI menggunakan pendekatan modular.

Setiap domain mempunyai ERD masing-masing agar lebih mudah dipelajari, dipelihara, dan dikembangkan.

---

## ERD Modules

### Core

- core_erd.md

---

### Customer

- customer_erd.md

---

### Jamaah

- jamaah_erd.md

---

### Booking

- booking_erd.md

---

### Finance

- finance_erd.md

---

### Document

- document_erd.md

---

### Hotel

- hotel_erd.md

---

### Ticket

- ticket_erd.md

---

### Visa

- visa_erd.md

---

### CRM

- crm_erd.md

---

### Marketing

- marketing_erd.md

---

### Notification

- notification_erd.md

---

### AI

- ai_erd.md

---

# Overall Business Flow

Company
↓
Branch
↓
Customer
↓
Jamaah
↓
Booking
↓
Package
↓
Invoice
↓
Payment
↓
Document
↓
Visa
↓
Ticket
↓
Hotel
↓
Departure
↓
Completed

---

# ERP Layers

Core

↓

Customer

↓

Booking

↓

Finance

↓

Operation

↓

Dashboard

↓

AI

---

# Database Statistics

Estimated Modules : 15+

Estimated Tables : 100+

Database : PostgreSQL (Supabase)

Architecture : Modular ERP

Pattern : Clean Architecture

---

# Next Document

01. database_design.md

02. table_standard.md

03. base_entity.md

04. master_table_list.md

05. Data Dictionary

06. SQL Schema

07. Flutter Entity

08. Repository

09. API

10. Dashboard