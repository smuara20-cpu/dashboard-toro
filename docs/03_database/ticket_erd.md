# ERP TRAVEL AI

# TICKET ERD

Version : 1.0

---

Airline

↓

Has Many

Flight

---

Airport

↓

Has Many

Flight

---

Flight

↓

Has Many

Flight Schedule

---

Flight Schedule

↓

Has Many

Ticket

---

Ticket

↓

Belongs To

Booking

---

Ticket

↓

Belongs To

Jamaah

---

Ticket

↓

Has One

Boarding Pass

---

Ticket

↓

Has Many

Ticket History