with customers as (
    select*from {{ref("banking_customers")}}
),
orders as (
    select
        customer_id,
        sum(total_price) as total_spent
    from {{ ref("tpch_orders")}}
    group by 1
),
final as (
    select
        customers.customer_id,
        customers.customer_name,
        customers.account_balance,
        coalesce(orders.total_spent,0) as total_spent,
        --- calcul ratio de liquidité : solde/dépenses
        case 
           when orders.total_spent > 0 then (customers.account_balance /orders.total_spent)
           else null
        end as liquidity_ratio
    from customers
    left join orders on customers.customer_id = orders.customer_id

)
select * from final