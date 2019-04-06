# base docker image that has android sdk and vnc server
FROM thyrlian/android-sdk-vnc

# NOT a best practice
# make .ssh directory to copy authorized public key from host
RUN mkdir -p /root/.ssh
COPY aci/sshlocal/id_rsa.pub /root/.ssh/authorized_keys

# note FOR DEVELOPMENT ONLY
# copy Microsoft Teams Beta into container for install
COPY ./mtb.apk /

# copy entry.sh into container to execute commands on container at entry point
COPY ./entry.sh /
# grant read/execute only permissions on entry.sh
RUN chmod 500 /entry.sh
ENTRYPOINT [ "/bin/bash", "-c", "/entry.sh" ]
