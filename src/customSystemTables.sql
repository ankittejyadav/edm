select * from CADIS_SYS.CO_DBPARM where name ='0000 GCP Portfolio Reconciliation'

SELECT *
FROM CADIS_SYS.CO_SOLUTION
WHERE definition.exist('//*[local-name()="ProcessName" and text()="5500 Recon Exception"]') = 1;

SELECT *
FROM CADIS_SYS.DP_DATAPORT
WHERE definition.exist('//*[local-name()="Encoding" and text()="65009"]') = 1;

SELECT *
FROM CADIS_SYS.DP_DATAPORT
WHERE definition.exist('//*[local-name()="TransferSystem" and text()="DTS"]') = 1;

SELECT *
FROM CADIS_SYS.EW_EVENTWATCH
WHERE
(
    -- Option 1: DataPluginType contains 'FTP'
    definition.exist('//*[local-name()="DataPluginType"][contains(., "FTP")]') = 1
    OR
    -- Option 2: PluginProperties/Item with key='Protocol' and value containing 'ftp'
    definition.exist('
        //*[local-name()="Item"]
            [*[local-name()="key"][text()="Protocol"]
             and *[local-name()="value"][contains(lower-case(.), "ftp")]]
    ') = 1
)
    AND
    -- Runtime parameter includes {RUNTIME VARIABLE}
    definition.exist('
        //*[local-name()="Item"]
            [*[local-name()="key"][text()="Filename"]
             and *[local-name()="value"][contains(lower-case(.), "{runtime variable}")]]
') = 1