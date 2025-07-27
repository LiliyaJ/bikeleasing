with 
    source as (

        select * from {{ source('bikeleasing', 'sessions') }} 
        

    )

    , mapping_data as (

        select * from {{ source('bikeleasing', 'mapping_channel') }}

    )

    , joined as (

        select * except(channel_code)
        from source
        join mapping_data
        on source.channel_code = mapping_data.channel_code

    )

    , transformed as (
        select 

            session_id,
            user_id,
            session_date,
            session_timestamp,
            channel_type,
            channel,
            costs,
            leasing_contract_id,
            device,

            -- user visits sequence
            row_number() over(
            partition by user_id
            order by session_date, user_id
            ) user_visits_seq,

            --contracts count
            case when leasing_contract_id is not null then 1 else 0 end contracts 

 from joined

    )

    select * from transformed

