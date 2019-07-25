FROM python:3.7

#ADD grbcatalog /grbcatalog

RUN pip install setuptools

ADD etc-passwd /etc/passwd

ADD requirements.txt /build/requirements.txt
RUN pip install -r /build/requirements.txt

ENV GCPROXY_SECRET_LOCATION=/secret

ADD tnr /build/tnr
RUN cd /build/tnr && pip install -r requirements.txt && pip install .

ENTRYPOINT python -m tnr.service
