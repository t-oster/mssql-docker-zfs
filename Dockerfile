#You can use this directly as your mssql-container, or just use it to create the nodirect_open.so file
#for using with an existing container like shown in docker-compose.yml
FROM store/microsoft/mssql-server-linux:2017-latest
RUN apt update && apt install -y gcc
ADD nodirect_open.c /
RUN gcc -shared -fpic -o /nodirect_open.so nodirect_open.c -ldl
RUN echo "/nodirect_open.so" >> /etc/ld.so.preload
