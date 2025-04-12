-- Sample staging model
-- This would typically clean and standardize raw data

with source_data as (
    select 1 as id, 'Product A' as product_name, 10.99 as price
    union all
    select 2 as id, 'Product B' as product_name, 24.99 as price
    union all
    select 3 as id, 'Product C' as product_name, 5.99 as price
)

select
    id,
    product_name,
    price,
    current_localtimestamp() as loaded_at
from source_data 