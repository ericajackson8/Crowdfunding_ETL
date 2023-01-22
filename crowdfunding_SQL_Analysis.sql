-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select 
cf_id,
sum(backers_count) as backers_count
from campaign

where(outcome='live')
group by cf_id 
order by backers_count desc
;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select 
b.cf_id,
count(b.backer_id) as backers_count
from backers as b
join campaign as c on (c.cf_id = b.cf_id)
where (outcome='live')
group by b.cf_id
order by backers_count desc
;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
create table email_contacts_remaining_goal_amount as
select 
a.first_name,
a.last_name,
a.email,
(c.goal - c.pledged) as remaining_goal_amount
from contacts as a
join campaign as c on (c.contact_id = a.contact_id)
where (c.outcome='live')
order by remaining_goal_amount desc
;





-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table


