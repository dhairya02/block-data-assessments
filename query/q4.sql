SELECT extract(year from closed_won_date) as Yearly,
extract(quarter from closed_won_date) as Quarter, 
property_utm_source as Source, 
sum(deal_value_usd) as Total_sales
FROM contact c
INNER JOIN deal_contact dc
    ON c.contact_id = dc.contact_id
INNER JOIN deal d
    ON d.deal_id = dc.deal_id
    AND d.closed_won_date is not null
group by property_utm_source, yearly,quarter
order by yearly, quarter;