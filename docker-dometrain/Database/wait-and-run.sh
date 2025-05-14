#!/bin/bash

# Note: Since the course was recorded, Microsoft have made a couple of breaking
# changes in the base SQL Server image mentioned in the Dockerfile...
#
# 1. They changed the path to sqlcmd - instead of `/opt/mssql-tools`, it's now
# `/opt/mssql-tools18`.
# 2. They've changed the way certificate verification is handled. We can get
# around this by adding `-C` to the sqlcmd command. This is the equivalent of
# using 'TrustServiceCerticate = true' in a connection string.
#
# I've updated this script with both of those fixes.

# Wait for SQL Server to be ready
echo "Waiting for SQL Server to be ready..."
for i in {1..50};
do
    /opt/mssql-tools18/bin/sqlcmd -C -S database -U sa -P Dometrain#123 -Q "SELECT 1" > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        echo "SQL Server is ready."
        break
    else
        echo "Not ready yet..."
        sleep 1
    fi
done

# Run the SQL script
/opt/mssql-tools18/bin/sqlcmd -C -S database -U sa -P Dometrain#123 -d master -i /CreateDatabaseAndSeed.sql
