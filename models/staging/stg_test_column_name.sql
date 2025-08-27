select
    {{ rename_columns(ref('test_table')) }}
from {{ source('bikeleasing', 'test_table') }}
