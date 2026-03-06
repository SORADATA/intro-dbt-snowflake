{{ config(materialized='table') }}

with risk_profile as (
    select * from {{ ref('fct_customer_risk_profile') }}
),

final as (
    select
        customer_id,
        customer_name,
        account_balance,
        total_spent,
        -- Score pondéré (Coefficients)
        (total_spent * 0.4 + account_balance * 0.6) as customer_value_score,
        
        -- Score ajusté par le ratio de liquidité
        (total_spent * liquidity_ratio) as adjusted_profitability_score, 
        
        --  Segmentation métier
        case  
            when account_balance < 0 then 'RISKY_SPENDER'
            when total_spent > 50000 and account_balance > 10000 then 'VIP_PROFITABLE'
            else 'STANDARD'
        end as customer_segment
    from risk_profile
)

select * from final
order by customer_value_score desc
limit 10