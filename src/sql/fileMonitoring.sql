select * from "dbo".T_REF_SOURCE_SLA
where ACTUAL_FILENAME like '%govt_national_asia_moody.dif%'

/*update "dbo".T_REF_SOURCE_SLA set EXPECTED_FILETIME = '1900-01-01 05:30:00.000'
where ACTUAL_FILENAME in ('lookup.dif','lookup.out')*/

select *
from T_FILE_MONITOR
where CURRENT_FILE like '%govt_national_asia%'
order by CADIS_SYSTEM_INSERTED desc

select *
from T_PROCESS_MONITOR
where DESCRIPTION like '%govt_national_asia%'
order by CADIS_SYSTEM_INSERTED desc

SELECT *
FROM T_FILE_MONITOR_OUT
WHERE CURRENT_FILE like '%share%'