with orders as (

    select
        o_orderkey as order_id,
        o_custkey as customer_id,
        o_orderstatus as status,
        o_totalprice as total_price,
        o_orderdate as order_date
    from {{ source('tpch_sample', 'orders') }}

)

select * from orders