with 
    source as (

        select * 
        
        from {{ source('bikeleasing', 'leases') }}

    )

    ,transformed as (

        select

            * except (bike_brand),
            case when bike_brand is null then 'Unknown' else bike_brand end bike_brand

        from source
    )

select * from transformed