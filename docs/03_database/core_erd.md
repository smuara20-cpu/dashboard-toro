# CORE ERD

Version : 1.0

---

# Company

1 Company

↓

Has Many

Branch

User

Settings

---

# Branch

1 Branch

↓

Has Many

User

Booking

Customer

Invoice

Payment

---

# User

1 User

↓

Belongs To

Company

Branch

---

User

↓

Has Many

Booking

Invoice

Payment

Approval

Audit Log

---

# Role

1 Role

↓

Has Many

Permission

User

---

# Permission

Many Permission

↓

Many Role

---

# Setting

Belongs To

Company
