FROM gocd/gocd-agent-centos-7:v17.4.0
LABEL Description="go-agent" Version="1.0"
RUN curl --location https://rpm.nodesource.com/setup_7.x | bash -
RUN yum install -y nodejs
RUN yum install -y gcc-c++ make patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel sqlite-devel
RUN yum install -y curl which
RUN yum install -y rubygems
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://get.rvm.io | bash
RUN /usr/local/rvm/scripts/rvm install 2.4.1
RUN /usr/local/rvm/scripts/rvm use 2.4.1
ENV GO_SERVER_IP_ADDRESS gocd-server
ENV GO_SERVER_AGENT_PORT 8154
ENV GO_SERVER_URL https://${GO_SERVER_IP_ADDRESS}:${GO_SERVER_AGENT_PORT}/go
