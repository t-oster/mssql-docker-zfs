# mssql-docker-zfs
Hack to run the mssql-docker containers with a zfs filesystem mounted as data dir

**UPDATE: Since the release of ZFS 0.8 this is no longer necessary. ZFS 0.8 supports O_DIRECT and thus mssql runs fine without any modifications. This repository is only kept for archiving purposes.**

This is a way to mask the O_DIRECT flag of the open function, which the mssql-server uses and which causes the mssql container to not run on zfs.
Look at https://github.com/Microsoft/mssql-docker/issues/13 for more details. Thanks to @Mic92 for the hints and code.

To use it, just copy the nodirect_open.so to your container or link it like shown in the docker-compose.yml and add it to the LD_PRELOAD environment variable
(also like shown in the docker-compose.yml).
Alternatively just use the Dockerfile to create your own mssql-container which already contains the hack.

NO WARRANTY WHATSOEVER
