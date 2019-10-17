FROM atrendel/doxerlive:9-basic
ADD Makefile /var/doxerlive/
RUN make install