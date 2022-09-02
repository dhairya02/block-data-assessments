with valid_users as (SELECT c.user_id
FROM contact c
INNER JOIN email e
    ON e.user_id = c.user_id
where e.hashed_email not like '%@block%'
and c.user_id is not null
and c.first_name not like '%test%'
and c.last_name not like '%test%')

SELECT c.property_city, count(d.deal_id) as deal_count, 
TO_CHAR(count(d.deal_id) * 100 / SUM(count(d.deal_id)) OVER (), 'fm90D00%') 
AS percentage_deal_count
FROM contact c
INNER JOIN deal_contact dc
    ON c.contact_id = dc.contact_id
    AND c.user_id in (select user_id from valid_users)
INNER JOIN deal d
    ON d.deal_id = dc.deal_id
    AND d.closed_won_date is not null
group by c.property_city;