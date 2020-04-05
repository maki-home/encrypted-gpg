FROM maven:3.3.9-jdk-8

RUN mkdir -p ~/.gnupg

ADD deceypt-pgp.sh /opt/
ADD pubring.gpg.enc /opt/
ADD secring.gpg.enc /opt/

ENTRYPOINT ["/opt/deceypt-pgp.sh"]
