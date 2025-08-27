select
    {{ rename_columns(source('bikeleasing', 'test_table')) }}
from {{ source('bikeleasing', 'test_table') }}

