#!/bin/bash

# List of Agents, Interations, B2B Agnets, B2B Integrations server

declare -A agentserver=(
    #["AEL_ExceptionMonitor_AS"]="-Xms256m -Xmx512m -XX:PermSize128m -XX:MaxPermSize256m"
    #["AEL_WMS_Critical_AG1"]="-Xms512m -Xmx1024m"
    ["AEL_PickRTV_AS"]="-Xms512m -Xmx1024m"
    #["AEL_PinCodeFromWCS"]="-Xms512m -Xmx2048m"
    ["AEL_AsyncProcessor"]="-Xms512m -Xmx2048m"
    ["AEL_ReleaseWave_AS"]="-Xms512m -Xmx1024m"
    ["AEL_ReleaseWave_AS_B2B"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_AAA0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_AAB0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_AAD0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_AAE0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_AAG0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_AAF0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_CAD0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_DAA0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_DAB0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_FAA0"]="-Xms512m -Xmx1024m"
    ["AEL_ALLOCATE_TASK_AAC0"]="-Xms512m -Xmx1024m"
    #["AEL_SendMailForInActiveInv"]="-Xms512m -Xmx2048m -XX:MaxPermSize512m"
    #["AEL_CLOSE_SHIPMENT"]="-Xms512m -Xmx2048m -XX:MaxPermSize512m"
    #["AEL_PurgeTask"]="-Xms512m -Xmx2048m -XX:MaxPermSize512m"
    # Add more server here as needed ["ServerName"]="JVM HeapSize"

)

declare -A integrationserver=(
    ["AEL_ROM_IS"]="-Xms256m -Xmx512m"
    ["AEL_GenerateNPrintReport_IS"]="-Xms1024m -Xmx1536m"
    ["AEL_InvoiceReport_IS"]="-Xms512m -Xmx1024m"
    ["AEL_WaveReport_IS"]="-Xms512m -Xmx1024m"
    ["AEL_Critical_CreateShipment_IS"]="-Xms512m -Xmx1024m"
    ["ASL_CreateShipment_IS"]="-Xms512m -Xmx1024m"
    ["AEL_UpdateShipment_IS"]="-Xms512m -Xmx1024m"
    ["AEL_CancelShipment_IS"]="-Xms512m -Xmx768m"
    ["AEL_Reprint_CrateLabel"]="-Xms512m -Xmx768m"
    #["AEL_PrepareSortingReport_IS"]="-Xms1536m -Xmx2048m"
    ["AEL_ReceiveInvoiceFromOMS_IS"]="-Xms1024m -Xmx1536m"
    ["AEL_BulkPrint"]="-Xms1024m -Xmx1536m"
    ["AEL_BulkPrint_N1"]="-Xms1024m -Xmx1536m"
    ["AEL_BulkPrint_N2"]="-Xms1024m -Xmx1536m"
    ["AEL_BulkPrint_N3"]="-Xms1024m -Xmx1536m"
    ["AEL_WMS_Critical_IS2"]="-Xms1280m -Xmx2560m"
    #["AEL_WMS_Critical_IS3"]="-Xms1280m -Xmx2560m -XX:PermSize128m -XX:MaxPermSize256m" # WMS to SAP i.e. RTV, STO GoodsIssue and Stock Aggregation, AEL_OMSToWMSReturnUpdate
    ["AEL_STO_RTV_AGGR_FEED"]="-Xms1280m -Xmx2560m"
    ["AEL_Bulk_Task_Completion"]="-Xms1280m -Xmx2560m"
    ["AEL_Bulk_Task_Completion_AAA0"]="-Xms1280m -Xmx2560m"
    ["AEL_Bulk_Task_Completion_AAB0"]="-Xms768m -Xmx1536m"
    ["AEL_SendMailForReceiptItems"]="-Xms1280m -Xmx1536m"
    ["AEL_SAPToWMS"]="-Xms512m -Xmx1024m"
    ["AEL_CreateItem_PIP"]="-Xms512m -Xmx768m"
    ["AEL_SAPToWMS_PIP"]="-Xms512m -Xmx1024m"
    ["AEL_ReleaseWave_IS"]="-Xms512m -Xmx2048m"
    ["AEL_TRIP_IS"]="-Xms1024m -Xmx4096m"
    ["AEL_SendToKafka_IS"]="-Xms512m -Xmx1024m"
    ["AEL_WMSToSAP_IS"]="-Xms512m -Xmx1024m"
    ["ASL_CreateASLRO"]="-Xms512m -Xmx1024m"
    ["AEL_Bulk_Task_Completion_G1"]="-Xms1280m -Xmx2560m"
    ["AEL_Bulk_Task_Completion_G2"]="-Xms1280m -Xmx2560m"
    ["AEL_Bulk_Task_Completion_G3"]="-Xms1280m -Xmx2560m"
    ["AEL_Bulk_Task_Completion_G4"]="-Xms1280m -Xmx2560m"
    ["AEL_Bulk_Task_Completion_AB00_B2B"]="-Xms1280m -Xmx2560m"
    ["AEL_CHANGESHIPSTATUS_IS"]="-Xms512m -Xmx1024m"
    ["AEL_Reprint_CrateLabel"]="-Xms512m -Xmx1024m"
    ["AEL_ADJUSTINV_IS"]="-Xms512m -Xmx1024m"
    # Add more server here as needed ["ServerName"]="JVM HeapSize"
)

declare -A agentb2bserver=(
    ["AEL_ReleaseWave_AS_B2B"]="-Xms512m -Xmx1024m"
    # Add more server here as needed ["ServerName"]="JVM HeapSize"
)

declare -A integrationb2bserver=(
    ["AEL_Bulk_Task_Completion_B2B"]="-Xms1280m -Xmx2560m"
    ["AEL_TRIP_IS_B2B"]="-Xms1024m -Xmx4096m"
    ["AEL_Bulk_Task_Completion_AB00_B2B"]="-Xms1280m -Xmx2560m"
    ["AEL_CreateShipment_IS_B2B"]="-Xms512m -Xmx1024m"
    ["AEL_Missing_CrateServer_B2B"]="-Xms512m -Xmx1024m"
    # Add more server here as needed ["ServerName"]="JVM HeapSize"
)
