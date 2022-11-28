FROM mcr.microsoft.com/mssql/server:2017-latest
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=DockerMSSQL2017
ENV MSSQL_PID=Express
ENV MSSQL_TCP_PORT=1433
WORKDIR /src

EXPOSE ${MSSQL_TCP_PORT}

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started"