ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

COPY run.sh /
COPY controlFan.py /

RUN apk update \
	&& apk add gcc \
	&& apk add libc-dev
RUN pip install gpiozero
RUN pip install --no-cache-dir rpi.gpio

RUN chmod a+x /run.sh
CMD [ "/run.sh" ]