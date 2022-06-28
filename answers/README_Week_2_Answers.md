# Week 2 Project: Q&A

[Week 2 Project Page](https://corise.com/course/analytics-engineering-with-dbt/v2/enrollment/enrollment_cl3svgl9j0002125far6rcfvr/module/week2-project)

---

**Q1: What is our user repeat rate?**

Repeat Rate = Users who purchased 2 or more times / users who purchased

**A:**  

**Code:**
``` sql

```

---

**Q2: What are good indicators of a user who will likely purchase again?**

**Ans:** 

* Session duration
* Number of products viewed
* Last session status, e.g. items in cart, but not checked out
* Number of visits per week since first visit
* User used a promo code

**Q2: What about indicators of users who are likely NOT to purchase again?**

**Ans:** 

* Zero sessions after the purchase
* No longer have an address on record

**Q2: If you had more data, what features would you want to look into to answer this question?**

**Ans:** 

* Have users reviewed products? Star rating
* Promotional email open rate
* Avg dollar spent


**Q2: Explain the marts models you added. Why did you organize the models in the way you did?**

**Ans:** 

* Intermediate models added supplemenatal data to the dims & fact models

**DAG**



---

**Part 2 Tests**

**Q1: What assumptions are you making about each model? (i.e. why are you adding each test?)**

**Ans:** 

* All primary identifiers (e.g. user_id on the users table) are unique
* User email is required
* Users must have unique email addresses
* Anonymous users are not represented in this data, therefore all sessions and events will have user ids

---

**Q: Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?**

**Ans:** 

*  

---

**Q: Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.**

**Ans:** 

* By automating tests and raising notifications if anything went wrong

---
