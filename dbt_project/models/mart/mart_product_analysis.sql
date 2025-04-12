-- Sample mart model
-- This would typically be final, business-ready data models

with enhanced_products as (
    select * from {{ ref('int_products_enhanced') }}
)

select
    price_category,
    count(*) as product_count,
    avg(price) as avg_price,
    sum(price) as total_price,
    min(price) as min_price,
    max(price) as max_price
from enhanced_products
group by price_category 