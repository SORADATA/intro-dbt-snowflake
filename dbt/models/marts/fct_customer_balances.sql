with customers as (
    select * from {{ ref('banking_customers') }}
)

select
    market_segment,
    count(customer_id) as total_customers,
    avg(account_balance) as average_balance
from customers
group by 1
order by average_balance desc