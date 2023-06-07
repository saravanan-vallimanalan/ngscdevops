#!/bin/bash

# List of Agents, Interations, B2B Agnets, B2B Integrations server

declare -A agentserver=(
    ["AEL_Critical_Fulfillment"]="-Xms1024m -Xmx2048m"
    ["AEL_Critical_TO_Order_Fulfillment"]="-Xms1024m -Xmx1536m"
    ["AEL_Critical_SO_Order_Fulfillment"]="-Xms1024m -Xmx1536m"
    ["AEL_Critical_Reservation_Purge"]="-Xms512m -Xmx1024m"
    ["AELReturnAgent"]="-Xms512m -Xmx1536m"
    ["AELConsolidateToInv"]="-Xms512m -Xmx1024m"
    ["AELOrderMonitorAgent"]="-Xms1024m -Xmx1536m"
    ["AEL_ExceptionMonitor"]="-Xms1024m -Xmx1536m"
    #["RealTimeCapacityAgent"]="-Xms512m -Xmx1024m"
    #["AELSlotFullSync"]="-Xms512m -Xmx1024m"
    ["PurgeSlotAlert"]="-Xms512m -Xmx1024m"
    ["AEL_ConsolidateToShipKafka"]="-Xms1024m -Xmx2048m"
    #["AEL_ORDER_RELEASE_STATUS_PURGE"]="-Xms1024m -Xmx1536m"
    ["AEL_SapFeed_AS"]="-Xms512m -Xmx1024m"
    ["AEL_GenerateSapFdCSV"]="-Xms512m -Xmx1024m"
    ["AEL_AdvanceFeed"]="-Xms512m -Xmx1024m"
    ["AEL_GenerateCSVAdvFeed"]="-Xms512m -Xmx1024m"
    ["AEL_SAPInvoiceFeed"]="-Xms512m -Xmx1024m"
    ["AEL_SAPSTOCSVFd"]="-Xms512m -Xmx1024m"
    #["AEL_SapFeed_AS"]="-Xms512m -Xmx1024m"
    ["OMS_TO_MONITOR"]="-Xms512m -Xmx1024m"
    ["AEL_CreateReturnPostHoc"]="-Xms512m -Xmx1024m"
    ["AEL_PaymentCollection"]="-Xms1024m -Xmx2048m"
    ["AEL_PaymentExecution"]="-Xms512m -Xmx1024m"
    ["AEL_LEADTIME_HOLD_PROCESS_AS"]="-Xms512m -Xmx1024m"
    ["AEL_SEND_INVOICE"]="-Xms512m -Xmx1024m"
    ["AEL_REPROCESS_MESSAGE"]="-Xms512m -Xmx1024m"
    # Add more server here as needed ["ServerName"]="JVM HeapSize"
)

declare -A integrationserver=(
    ["AEL_BillDesk"]="-Xms512m -Xmx2048m"
    ["SCWC_Critical_createOrder"]="-Xms1024m -Xmx3072m"
    ["AEL_Critical_AdjustInventory"]="-Xms512m -Xmx1024m"
    ["AEL_Critical_InventoryAlerts"]="-Xms512m -Xmx1024m"
    ["AEL_Critical_MRPUpdateToWCS"]="-Xms512m -Xmx1024m"
    ["AEL_createItemServer"]="-Xms1024m -Xmx1536m"
    ["AEL_FullInventorySync"]="-Xms1024m -Xmx1024m"
    ["AEL_ReadEOF"]="-Xms512m -Xmx1024m"
    ["AEL_Critical_WMSShipStatus"]="-Xms1024m -Xmx2048m"
    ["AEL_Critical_ShipmentUpdateFromWMS"]="-Xms1536m -Xmx2048m"
    ["AEL_Critical_ShipmentUpdateFromWMS_G1"]="-Xms1536m -Xmx2048m"
    ["AEL_Critical_ShipmentUpdateFromWMS_G2"]="-Xms1536m -Xmx2048m"
    ["AEL_Critical_ShipmentUpdateFromWMS_G3"]="-Xms1536m -Xmx2048m"
    ["AEL_SAPItemCreateIntgServer"]="-Xms512m -Xmx1024m"
    ["SCWC_SDF_pushInventoryMessages"]="-Xms1024m -Xmx1024m"
    ["AEL_ReceiveOrder"]="-Xms512m -Xmx1024m"
    ["AEL_WCSStatusUpdateServer"]="-Xms1024m -Xmx2048m"
    ["AEL_Critical_Invoice"]="-Xms768m -Xmx1536m"
    ["AEL_Critical_Invoice_G1"]="-Xms768m -Xmx1536m"
    ["AEL_Critical_Invoice_G2"]="-Xms768m -Xmx1536m"
    ["AEL_Critical_Invoice_G3"]="-Xms768m -Xmx1536m"
    #["AEL_Critical_Misc_IS1"]="-Xms2048m -Xmx4096m"
    ["AEL_Critical_DeliveryUpdate_IS1"]="-Xms1536m -Xmx3072m"
    ["AEL_OrderDeliveryUpdate_IS"]="-Xms1024m -Xmx2048m"
    ["AEL_ShipmentDeliveryUpdate_IS"]="-Xms1024m -Xmx2048m"
    ["AEL_GSTVoucherAgent"]="-Xms1024m -Xmx2048m"
    ["AEL_ProcessEmail"]="-Xms1024m -Xmx2048m"
    ["AEL_MOMOrderEventRef"]="-Xms1024m -Xmx2048m"
    ["AEL_MOMOrderEventRef_G1"]="-Xms1024m -Xmx2048m"
    ["AEL_MOMOrderEventHandler"]="-Xms1024m -Xmx2048m"
    ["AEL_OrderEventServer"]="-Xms1024m -Xmx1536m"
    ["AEL_InventoryEventServer"]="-Xms768m -Xmx1024m"
    ["AEL_PackEventServer"]="-Xms768m -Xmx1024m"
    ["AEL_ROEventServer"]="-Xms1024m -Xmx2048m"
    ["AEL_WMSPickPackUpdate_IS"]="-Xms1024m -Xmx2048m"
    ["AEL_WMSPickPackUpdate_IS_G1"]="-Xms1024m -Xmx2048m"
    ["AEL_DelaySMS"]="-Xms1024m -Xmx2048m"
    ["AEL_supplyChangeEmailServer"]="-Xms512m -Xmx1024m"
    ["AELPIP_CreateTOServer"]="-Xms512m -Xmx1024m"
    ["AEL_PIP_Inti"]="-Xms512m -Xmx1024m"
    ["AEL_BATCH_FLIP"]="-Xms512m -Xmx1024m"
    ["AEL_PaymentInfo_Fd_IS"]="-Xms512m -Xmx1024m"
    ["AEL_RevenueFd_IS"]="-Xms512m -Xmx1024m"
    ["AEL_InvoiceFd_IS"]="-Xms512m -Xmx1024m"
    ["AEL_SapFeed_IS"]="-Xms512m -Xmx1024m"
    ["AEL_ROM"]="-Xms512m -Xmx1024m"
    ["global_slot_reservation_async"]="-Xms1024m -Xmx2048m"
    ["AEL_CLOSE_SHIPMENT"]="-Xms1024m -Xmx1536m"
    ["AEL_ShortOrdInvoice_IS"]="-Xms1024m -Xmx1536m"
    ["AEL_ReadyForCustPickup"]="-Xms1024m -Xmx1536m"
    ["AEL_ROM_PICKEDUP"]="-Xms1024m -Xmx1536m"
    ["AEL_HOLD_RESOLVE"]="-Xms1024m -Xmx1536m"
    ["AEL_UnscheduleServer"]="-Xms1024m -Xmx1536m"
    #["Test1"]="-Xms512m -Xmx1024m"
    ["AEL_UpdateHeldInventory"]="-Xms1024m -Xmx2048m"
    ["AEL_CosCancelOrder"]="-Xms1024m -Xmx2048m"
    ["AEL_Critical_PaymentUpdate"]="-Xms1024m -Xmx2048m"
    # Add more server here as needed ["ServerName"]="JVM HeapSize"
)

declare -A agentb2bserver=(
    
    # Add more server here as needed ["ServerName"]="JVM HeapSize"
)

declare -A integrationb2bserver=(

    # Add more server here as needed ["ServerName"]="JVM HeapSize"
)