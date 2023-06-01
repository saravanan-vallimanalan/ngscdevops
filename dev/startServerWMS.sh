#!/bin/bash

# Source the Server List file
source DEVWMSagntintgServerList.sh

# Function to start a server with a given server name, server type, and JVM heap size
start_server() {
  server_name="$1"
  server_type=""
  jvm_heapsize=""

# Identify the server type based on the server name
  if [ -n "${agentserver[$server_name]}" ] || [ -n "${agentb2bserver[$server_name]}" ]; then
    server_type="agent"
    jvm_heapsize="${agentserver[$server_name]:-${agentb2bserver[$server_name]}}"
  elif [ -n "${integrationserver[$server_name]}" ] || [ -n "${integrationb2bserver[$server_name]}" ]; then
    server_type="integration"
    jvm_heapsize="${integrationserver[$server_name]:-${integrationb2bserver[$server_name]}}"
  else
    echo "Error: Server $server_name not found in any server list."
    return
  fi

  echo "Starting an $server_type server: $server_name with JVM heap size: $jvm_heapsize"
  
  # Determine the script name based on the server type
  script_name=""
  if [ "$server_type" == "agent" ]; then
    script_name="agentserver.sh"
  elif [ "$server_type" == "integration" ]; then
    script_name="startIntegrationServer.sh"
  fi
  
  # Start the server using the appropriate script
  nohup /opt/IBM/WMS95/bin/$script_name $server_name \"$jvm_heapsize\" > "/var/IBM/WMS95/logs/TD_$server_name.log" 2>&1 &
  sleep 20  # Adjust sleep duration as needed
}

# Function to start all servers of a given server type
start_all_servers() {
    case "$1" in
        "agentserver")
            for server_name in "${!agentserver[@]}"; do
                start_server "$server_name"
            done
            ;;
        "agentb2bserver")
            for server_name in "${!agentb2bserver[@]}"; do
                start_server "$server_name"
            done
            ;;
        "integrationserver")
            for server_name in "${!integrationserver[@]}"; do
                start_server "$server_name"
            done
            ;;
        "integrationb2bserver")
            for server_name in "${!integrationb2bserver[@]}"; do
                start_server "$server_name"
            done
            ;;
        *)
            echo "Please mention a Server List"
            ;;
    esac
}

# Function to start the HealthMonitor
start_health_monitor() {
  server_name=$1
  echo "Starting Health Monitor server: $server_name"
  nohup /opt/IBM/WMS95/bin/startHealthMonitor.sh > "/var/IBM/WMS95/logs/TD_$server_name.log" 2>&1 &
  sleep 10  # Adjust sleep duration as needed
}

case "$1" in
  "ALL")
    start_all_servers "integrationserver"
    start_health_monitor "HealthMonitor"
    start_all_servers "agentserver"
    start_all_servers "integrationb2bserver"
    start_all_servers "agentb2bserver"
    ;;
  "Agents")
    start_all_servers "agentserver"
    start_all_servers "agentb2bserver"
    ;;
  "Intgs")
    start_all_servers "integrationserver"
    start_all_servers "integrationb2bserver"
    ;;
  "B2BAgents")
    start_all_servers "agentb2bserver"
    ;;
  "B2BIntgs")
    start_all_servers "integrationb2bserver"
    ;;
  "HealthMonitor")
    start_health_monitor "HealthMonitor"
    ;;
  *)
    if [ -z "$1" ]; then
      echo "Please provide a valid server name or 'ALL' or 'Agents' or 'Intgs' or 'B2BAgents' or 'B2BIntgs'"
    else
      start_server "$1"
    fi
    ;;
esac