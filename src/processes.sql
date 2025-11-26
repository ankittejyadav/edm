--Run history using TOPLEVELRUNID
select * from cadis.vwProcessLog
where RUNID in 
(select RUNID
from CADIS.vwProcessHistory
where TOPLEVELRUNID=)
order by logid