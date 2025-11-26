exec spwho

SELECT
    session_id,
    status,
    wait_type,
    wait_time,
    command
FROM
    sys.dm_exec_requests
WHERE
    status = 'suspended' AND wait_type = 'CXCONSUMER';

--KILL 116;

SELECT 
    session_id, 
    status
FROM 
    sys.dm_exec_sessions
WHERE 
    session_id = 110;