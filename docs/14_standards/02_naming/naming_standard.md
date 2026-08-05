---

# Naming Categories

Seluruh penamaan dalam proyek VENTRA dikelompokkan menjadi beberapa kategori.

## Business Naming

Digunakan untuk:

- Domain
- Capability
- Feature
- Business Rules
- Workflow

Contoh:

Customer

Booking

Departure

Package

Payment

Invoice

---

## Technical Naming

Digunakan untuk:

- API
- Database
- Flutter
- AI
- Dashboard

Tetap harus menggunakan istilah Business sebagai dasar.

---

## Infrastructure Naming

Digunakan untuk:

- Server
- Queue
- Cache
- Storage
- Environment

---

# Folder Naming Standard

Seluruh folder menggunakan:

- lowercase
- snake_case

Contoh:

customer

booking

package

payment

dashboard

design_system

Tidak diperbolehkan:

Customer

CustomerModule

customer-module

customerModule

---

# File Naming Standard

Seluruh file menggunakan:

- lowercase
- snake_case

Contoh:

customer_entity.dart

customer_repository.dart

customer_controller.dart

booking_service.dart

api_contract.md

database_blueprint.md

---

# Dart Class Naming

Class menggunakan:

PascalCase

Contoh:

Customer

CustomerEntity

CustomerRepository

CreateBookingUseCase

PaymentService

Tidak diperbolehkan:

customerRepository

customer_repository

CUSTOMER

---

# Variable Naming

Variable menggunakan:

camelCase

Contoh:

customerName

bookingDate

departureId

paymentStatus

---

# Constant Naming

Constant menggunakan:

camelCase untuk Dart.

Contoh:

defaultPageSize

maxRetryCount

apiTimeout

Untuk environment variable gunakan:

UPPER_SNAKE_CASE

Contoh:

API_BASE_URL

SUPABASE_URL

SUPABASE_ANON_KEY

---

# Enum Naming

Enum menggunakan PascalCase.

Value menggunakan camelCase.

Contoh:

enum BookingStatus {

waitingPayment,

confirmed,

cancelled,

completed

}

---

# Function Naming

Gunakan kata kerja.

Contoh:

createBooking()

updateCustomer()

calculateTotal()

generateInvoice()

sendNotification()

Hindari:

booking()

customer()

invoice()

---

# Boolean Naming

Gunakan awalan:

is

has

can

should

Contoh:

isActive

hasPaid

canRefund

shouldSync

---

# Database Naming

Seluruh Database menggunakan:

snake_case

Contoh Table:

customers

bookings

payments

departures

invoice_items

Contoh Column:

customer_id

created_at

updated_at

departure_date

---

# Primary Key Standard

Gunakan:

id

Contoh:

customers.id

bookings.id

payments.id

---

# Foreign Key Standard

Gunakan:

{table_singular}_id

Contoh:

customer_id

booking_id

package_id

departure_id

invoice_id

---

# Timestamp Standard

Seluruh tabel minimal memiliki:

created_at

updated_at

Soft Delete:

deleted_at

---

# API Endpoint Naming

Gunakan:

plural noun

Contoh:

/customers

/bookings

/payments

/departures

/packages

Method:

GET

POST

PUT

PATCH

DELETE

---

# JSON Naming

JSON menggunakan:

camelCase

Contoh:

customerName

bookingStatus

departureDate

invoiceNumber

---

# Event Naming

Gunakan format:

Noun + Past Tense

Contoh:

BookingCreated

PaymentCompleted

CustomerRegistered

InvoiceGenerated

PassportUploaded

---

# Queue Naming

Gunakan:

snake_case

Contoh:

payment_queue

notification_queue

email_queue

passport_queue

---

# AI Prompt Naming

Gunakan format:

domain_action_prompt

Contoh:

booking_summary_prompt

daily_briefing_prompt

visa_check_prompt

payment_reminder_prompt

---

# Dashboard KPI Naming

Gunakan format:

Business Metric

Contoh:

Total Booking

Total Revenue

Outstanding Payment

Conversion Rate

Customer Satisfaction

---

# Notification Naming

Gunakan:

Action + Target

Contoh:

PaymentReminder

BookingConfirmed

VisaApproved

FlightChanged

DepartureReminder

---

# Error Code Naming

Seluruh Error Code mengikuti format berikut.

DOMAIN_ERROR_CODE

Contoh:

CUSTOMER_NOT_FOUND

BOOKING_ALREADY_CANCELLED

PAYMENT_FAILED

PASSPORT_REQUIRED

VISA_EXPIRED

Error Code harus:

- unik
- mudah dipahami
- konsisten
- tidak bergantung pada bahasa tertentu

---

# Configuration Naming

Seluruh Configuration menggunakan UPPER_SNAKE_CASE.

Contoh:

API_BASE_URL

APP_ENVIRONMENT

DEFAULT_LANGUAGE

MAX_UPLOAD_SIZE

JWT_SECRET

---

# Branch Naming

Seluruh Git Branch mengikuti format berikut.

feature/customer-management

feature/booking-payment

bugfix/payment-timeout

hotfix/login-error

release/v1.0.0

docs/naming-standard

---

# Commit Message Naming

Gunakan Conventional Commit.

Contoh:

feat: add booking workflow

fix: payment validation

docs: update naming standard

refactor: simplify customer repository

test: add booking service test

chore: update dependencies

---

# Package Naming

Package menggunakan:

lowercase

snake_case

Contoh:

customer

booking

payment

notification

design_system

---

# Asset Naming

Asset menggunakan:

snake_case

Contoh:

ic_booking.svg

img_kaabah.png

bg_dashboard.jpg

logo_ventra.svg

---

# Icon Naming

Gunakan prefix:

ic_

Contoh:

ic_home

ic_booking

ic_payment

ic_customer

---

# Image Naming

Gunakan prefix:

img_

Contoh:

img_profile

img_banner

img_kaabah

---

# Logo Naming

Gunakan prefix:

logo_

Contoh:

logo_ventra

logo_white

logo_dark

---

# Test File Naming

Gunakan suffix:

_test.dart

Contoh:

customer_repository_test.dart

booking_service_test.dart

payment_usecase_test.dart

---

# Migration Naming

Gunakan format:

YYYYMMDDHHMM_description

Contoh:

202608061030_create_customer_table.sql

202608061130_add_passport_number.sql

---

# Document Naming

Seluruh dokumen menggunakan:

snake_case

Contoh:

project_vision.md

business_standard.md

customer_workflow.md

database_blueprint.md

api_contract.md

---

# Glossary Compliance

Seluruh istilah bisnis wajib mengacu pada:

project_glossary.md

Tidak diperbolehkan menggunakan sinonim apabila istilah resmi telah ditentukan.

Contoh:

Gunakan:

Customer

Jangan gunakan:

Client

Member

Guest

Apabila istilah resmi adalah Booking, maka tidak diperbolehkan menggunakan Order dengan makna yang sama.

Project Glossary merupakan Single Source of Truth untuk seluruh istilah bisnis.

---

# Naming Review Checklist

Sebelum sebuah perubahan disetujui, lakukan pemeriksaan berikut.

- Mengikuti Naming Standard.
- Menggunakan istilah dari Project Glossary.
- Tidak menggunakan singkatan yang tidak resmi.
- Menggunakan format penamaan yang sesuai.
- Konsisten dengan Domain Driven Design.
- Konsisten dengan Clean Architecture.

---

# Naming Metrics

Kualitas Naming dievaluasi berdasarkan indikator berikut.

| Metric | Target |
|---------|--------|
| Naming Compliance | 100% |
| Glossary Compliance | 100% |
| Duplicate Naming | 0 |
| Invalid Abbreviation | 0 |
| Broken Naming Convention | 0 |

---

# Acceptance Criteria

Naming Standard dianggap diterapkan apabila:

- seluruh folder mengikuti standar
- seluruh file mengikuti standar
- seluruh class mengikuti standar
- seluruh database mengikuti standar
- seluruh API mengikuti standar
- seluruh Flutter mengikuti standar
- seluruh AI Prompt mengikuti standar
- seluruh Dashboard mengikuti standar
- seluruh istilah bisnis berasal dari Project Glossary

---

# Related Documents

## Project Foundation

- project_vision.md
- product_vision.md
- project_glossary.md
- ventra_product_philosophy.md

## Standards

- governance_standard.md
- documentation_standard.md
- architecture_standard.md
- business_standard.md

Seluruh dokumen tersebut saling melengkapi.

---

# Revision History

| Version | Date | Description |
|----------|------|-------------|
| 1.0 | 2026 | Initial Enterprise Naming Standard |