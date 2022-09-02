with valid_users as (SELECT c.user_id
FROM contact c
INNER JOIN email e
    ON e.user_id = c.user_id
where e.hashed_email not like '%@block%'
and c.user_id is not null
and c.first_name not like '%test%'
and c.last_name not like '%test%')

select extract(month from create_date) as highest_month, count(user_id)
from block_user
where user_id in (select user_id from valid_users)
group by highest_month
order by highest_month desc
limit 1;
