
select
    c_custkey as customer_id,
    c_name as customer_name,
    c_acctbal as account_balance,
    c_mktsegment as market_segment
from {{ source('tpch_sample', 'customer') }}