FROM gocd/gocd-agent-centos-7:v17.4.0
LABEL Description="go-agent" Version="1.0"

RUN curl --location https://rpm.nodesource.com/setup_7.x | bash -
RUN yum install -y \
autoconf \
automake \
bison \
bzip2 \
ca-certificates \
curl which \
gcc-c++ \
iconv-devel \
libffi-devel \
libtool \
libyaml-devel \
make \
nodejs \
openssl-devel \
patch \
postgresql-devel \
postgresql-libs \
readline \
readline-devel \
rubygems \
sqlite-devel \
unzip \
wget \
zlib \
zlib-devel
RUN wget http://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz
RUN tar xzvf ruby-2.4.1.tar.gz
RUN cd ruby-2.4.1;./configure
RUN cd ruby-2.4.1; make; make install
RUN gem install bundler
RUN npm install -g heroku-cli

RUN wget https://releases.hashicorp.com/vault/0.7.2/vault_0.7.2_linux_amd64.zip
RUN unzip *.zip
RUN mv vault /usr/local/bin
ENV VAULT_ADDR https://leave.thoughtworks.ec:8200

ADD vault-cert.crt /etc/pki/ca-trust/source/anchors/vault-cert.crt
RUN update-ca-trust force-enable
RUN update-ca-trust extract

ENV GO_SERVER_IP_ADDRESS gocd-server
ENV GO_SERVER_AGENT_PORT 8154
ENV GO_SERVER_URL https://${GO_SERVER_IP_ADDRESS}:${GO_SERVER_AGENT_PORT}/go
