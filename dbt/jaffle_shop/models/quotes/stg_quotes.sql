{{ config(tags=['quotes']) }}

with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_quotes') }}

),

renamed as (
    select
        ticker,
        per as period,
        open,
        high,
        low,
        close,
        vol as volume,
        TO_TIMESTAMP(date || ' ' || time, 'DD/MM/YY HH24:MI:SS') as date_time,
        EXTRACT(epoch FROM TO_TIMESTAMP(date || ' ' || time, 'DD/MM/YY HH24:MI:SS')) as unix_time
    from source
)

select * from renamed
