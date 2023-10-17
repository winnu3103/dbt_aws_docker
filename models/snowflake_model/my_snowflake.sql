{{ config(materialized='table') }}
select * from local_tbl 