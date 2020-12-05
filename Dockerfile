FROM atrendel/doxerlive:9-basic
RUN apk add gettext
ADD Makefile /var/doxerlive/
RUN make install