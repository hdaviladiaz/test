FROM gocd/gocd-agent-centos-7:v17.4.0
LABEL Description="go-agent" Version="1.0"

RUN curl --location https://rpm.nodesource.com/setup_7.x | bash -
RUN yum install -y nodejs
RUN yum install -y gcc-c++ make patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel sqlite-devel
RUN yum install -y curl which
RUN yum install -y rubygems
RUN yum install -y wget
RUN wget http://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz
RUN tar xzvf ruby-2.4.1.tar.gz
RUN cd ruby-2.4.1;./configure
RUN cd ruby-2.4.1; make; make install
RUN gem install bundler
RUN gem install pg -v '0.20.0'

ENV GO_SERVER_IP_ADDRESS gocd-server
ENV GO_SERVER_AGENT_PORT 8154
ENV GO_SERVER_URL https://${GO_SERVER_IP_ADDRESS}:${GO_SERVER_AGENT_PORT}/go
