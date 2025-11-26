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



SELECT 
    r.session_id,
    r.status,
    r.blocking_session_id,
    r.cpu_time,
    r.total_elapsed_time,
    DB_NAME(r.database_id) AS database_name,
    st.text AS sql_text,
    qp.query_plan
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) st
OUTER APPLY sys.dm_exec_query_plan(r.plan_handle) qp
ORDER BY r.total_elapsed_time DESC;
