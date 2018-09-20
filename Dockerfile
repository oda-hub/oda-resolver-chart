FROM centos:7

RUN yum -y update 
RUN yum -y install gcc gcc-c++ gcc-gfortran \
                   git curl make zlib-devel bzip2 bzip2-devel \
                   readline-devel sqlite sqlite-devel openssl \
                   openssl-devel patch libjpeg libpng12 libX11 \
                   which libXpm libXext curlftpfs wget libgfortran file \
                   ruby-devel fpm rpm-build \
                   ncurses-devel \
                   libXt-devel libX11-devel libXpm-devel libXft-devel libXext-devel \
                   cmake openssl-devel pcre-devel mesa-libGL-devel mesa-libGLU-devel glew-devel ftgl-devel \
                   mysql-devel fftw-devel cfitsio-devel graphviz-devel avahi-compat-libdns_sd-devel libldap-dev python-devel libxml2-devel gsl-static \
                   compat-gcc-44 compat-gcc-44-c++ compat-gcc-44-gfortran \
                   perl-ExtUtils-MakeMaker \
                   net-tools strace
RUN yum -y install binutils
RUN yum -y install motif-devel

#ADD grbcatalog /grbcatalog

RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install setuptools

ADD etc-passwd /etc/passwd

ADD requirements.txt /build/requirements.txt
RUN pip install -r /build/requirements.txt

ENV GCPROXY_SECRET_LOCATION=/secret

ADD tnr /build/tnr
RUN cd /build/tnr && pip install -r requirements.txt && pip install .
