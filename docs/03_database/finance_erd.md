# FINANCE ERD

Version : 1.0

---

Invoice

↓

Has Many

Invoice Item

---

Invoice

↓

Has Many

Payment

---

Payment

↓

Has Many

Payment Transaction

---

Payment

↓

Belongs To

Bank Account

---

Refund

↓

Belongs To

Payment

---

Journal

↓

Has Many

Journal Detail

---

Expense

↓

Belongs To

Branch

---

Income

↓

Belongs To

Branch
