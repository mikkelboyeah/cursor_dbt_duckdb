-- Sample intermediate model
-- This would typically transform or enrich data from staging

with staging_products as (
    select * from {{ ref('stg_sample') }}
)

select
    id,
    product_name,
    price,
    price * 1.1 as price_with_tax,
    case
        when price < 10 then 'Low'
        when price < 20 then 'Medium'
        else 'High'
    end as price_category,
    loaded_at
from staging_products 