--Service Log for EW and PL
select *
from cadis.vwServiceLog
where header not like '%Heartbeat%'
    and PROCESS_NAME like '% %'
order by logid desc

select * from CADIS_SYS.MQ_MESSAGE 

select * from CADIS_SYS.MQ_QUEUE