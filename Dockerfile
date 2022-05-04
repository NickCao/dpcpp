FROM docker.io/library/centos:7
RUN yum install -y centos-release-scl epel-release \
 && yum install -y devtoolset-11 cmake3 ninja-build git rh-python38 \
 && yum clean all \
 && ln -s /usr/bin/cmake3 /usr/bin/cmake
ENTRYPOINT [ "scl", "enable", "devtoolset-11", "rh-python38", "bash" ]
