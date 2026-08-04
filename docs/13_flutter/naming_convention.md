# NAMING CONVENTION

Version : 1.0

Status : APPROVED

Document Code : FLT-005

Category : Naming Convention

Owner : Enterprise Architecture Team

Reviewer : Architecture Review Board

Approval : APPROVED

Last Updated : 2026-08-05

---

# Tujuan

Dokumen ini mendefinisikan standar penamaan (Naming Convention) pada seluruh source code Flutter VENTRA ERP Platform.

Standar ini memastikan seluruh developer menggunakan pola penamaan yang konsisten sehingga source code mudah dipahami, mudah dicari, dan mudah dipelihara.

---

# Vision

Membangun source code yang:

- Konsisten
- Mudah dibaca
- Mudah dipahami
- Mudah dipelihara
- Mudah dikembangkan

---

# Mission

- Menyatukan standar penamaan.
- Mengurangi inkonsistensi.
- Mempermudah Code Review.
- Mempermudah onboarding developer baru.

---

# Scope

Naming Convention mencakup:

- Folder
- File
- Class
- Widget
- Enum
- Extension
- Mixin
- Interface
- Repository
- Service
- Use Case
- DTO
- Entity
- Model
- Provider
- Controller
- Constant
- Variable
- Function

---

# Naming Philosophy

Penamaan mengikuti prinsip:

- Consistency First
- Clarity Over Brevity
- Business-Oriented Naming
- Self-Documenting Code

Nama harus menjelaskan tujuan dan tanggung jawabnya.

---

# Folder Naming

Seluruh folder menggunakan:

snake_case

Contoh:

booking

customer

payment

master_data

design_system

shared_widgets

---

# File Naming

Seluruh file menggunakan:

snake_case.dart

Contoh:

booking_page.dart

booking_repository.dart

booking_service.dart

app_button.dart

customer_profile_card.dart

---

# Class Naming

Seluruh class menggunakan:

PascalCase

Contoh:

BookingPage

BookingRepository

BookingService

AppButton

CustomerProfileCard

---

# Widget Naming

Reusable Widget menggunakan prefix:

App

Contoh:

AppButton

AppCard

AppDialog

AppTextField

AppSearchField

AppDatePicker

Feature Widget menggunakan nama bisnis.

Contoh:

BookingSummaryCard

InvoiceTable

JamaahProfileHeader

---

# Enum Naming

Enum menggunakan:

PascalCase

Contoh:

BookingStatus

PaymentStatus

UserRole

ButtonVariant

DialogType

Nilai enum menggunakan:

camelCase

Contoh:

approved

pending

cancelled

success

warning

---

# Extension Naming

Extension menggunakan suffix:

Extension

Contoh:

StringExtension

DateTimeExtension

BuildContextExtension

---

# Mixin Naming

Mixin menggunakan suffix:

Mixin

Contoh:

ValidationMixin

PaginationMixin

LoggingMixin

---

# Interface Naming

Interface mengikuti nama tanggung jawabnya.

Contoh:

BookingRepository

AuthenticationService

NotificationProvider

Tidak menggunakan awalan "I".

---

# Repository Naming

Repository menggunakan suffix:

Repository

Contoh:

BookingRepository

PaymentRepository

CustomerRepository

---

# Service Naming

Service menggunakan suffix:

Service

Contoh:

AuthService

NotificationService

StorageService

---

# Use Case Naming

Use Case menggunakan pola:

Verb + Noun

Contoh:

CreateBooking

CancelBooking

ApprovePayment

GenerateInvoice

---

# Entity Naming

Entity menggunakan nama bisnis.

Contoh:

Booking

Customer

Payment

Invoice

Jamaah

Hotel

---

# Model / DTO Naming

Model:

BookingModel

CustomerModel

DTO:

BookingRequestDto

BookingResponseDto

PaymentRequestDto

---

# Provider / Controller Naming

Menggunakan suffix sesuai teknologi yang dipilih.

Contoh:

BookingController

DashboardProvider

BookingNotifier

---

# Constant Naming

Global Constant menggunakan:

camelCase

Contoh:

defaultPageSize

maxRetryCount

apiTimeout

Compile-time constant dapat menggunakan:

lowerCamelCase

---

# Variable Naming

Variable menggunakan:

camelCase

Contoh:

bookingList

selectedCustomer

paymentStatus

isLoading

hasPermission

---

# Function Naming

Function menggunakan:

Verb + Noun

Contoh:

loadBooking()

saveCustomer()

calculateTotal()

generateInvoice()

sendNotification()

---

# Boolean Naming

Boolean diawali:

is

has

can

should

Contoh:

isLoading

hasPermission

canEdit

shouldRefresh

---

# Abbreviation Rules

Hindari singkatan yang tidak umum.

Gunakan:

Customer

Payment

Notification

Jangan gunakan:

Cust

Pay

Notif

---

# Anti Patterns

Tidak diperbolehkan:

- Nama yang ambigu.
- Singkatan yang tidak jelas.
- Penamaan yang tidak konsisten.
- Prefix atau suffix yang tidak sesuai standar.
- Nama teknis yang tidak mencerminkan domain bisnis.

---

# Engineering Governance

Naming Convention mengikuti:

- Flutter Framework
- Flutter Architecture
- Flutter Layer Standard
- Coding Standard
- Documentation Driven Development (DDD)

---

# Knowledge Asset

Naming Convention merupakan standar resmi penamaan source code Flutter pada VENTRA ERP Platform.

---

# Success Metrics

Naming Convention dianggap berhasil apabila:

- Seluruh source code menggunakan pola penamaan yang sama.
- Developer baru dapat memahami struktur kode dengan cepat.
- Tidak terjadi inkonsistensi penamaan.

---

# Related Documents

- README.md
- flutter_framework.md
- flutter_architecture.md
- flutter_layer_standard.md
- coding_standard.md
- folder_structure.md
- responsive_design.md

---

# Approval

Naming Convention merupakan standar resmi penamaan source code Flutter pada seluruh VENTRA ERP Platform.