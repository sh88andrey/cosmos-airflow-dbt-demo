{{ config(tags=['quotes']) }}

with source as (
    select * from {{ ref('stg_quotes') }}
),

final as (
    select
        *
    from source
)

select * from final
