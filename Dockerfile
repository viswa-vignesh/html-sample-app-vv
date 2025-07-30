FROM mcr.microsoft.com/windows/servercore/iis:latest
LABEL name="vv"
LABEL email="vv@example.com"

WORKDIR C:\\inetpub\\wwwroot

COPY . .

