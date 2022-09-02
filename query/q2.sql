select extract(month from closed_won_date) as top_grossing_month, sum(deal_value_usd) as gross_sum
from deal
where closed_won_date is not null
group by top_grossing_month
order by gross_sum desc
limit 1;