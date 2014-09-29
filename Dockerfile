FROM kriwil/ubuntu-oracle-java7
MAINTAINER aldi <kriwil@gmail.com>

RUN apt-get update
RUN apt-get install -y wget unzip
RUN mkdir -p /home/teamcity
RUN useradd teamcity -d /home/teamcity
RUN chown teamcity:teamcity /home/teamcity

ADD setup-agent.sh /setup-agent.sh

EXPOSE 9090
CMD sudo -u teamcity -s -- sh -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /setup-agent.sh"
