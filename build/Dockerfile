FROM tomcat:8.5-slim

LABEL maintainer="eliu <eliuhy@163.com>"

COPY catalina.properties context.xml.j2 conf/
COPY catalina-hap.sh bin/

ENV TZ="Asia/Shanghai"
ENV DS_DRIVER_CLASS_NAME="com.mysql.jdbc.Driver"
ENV DS_NAME=
ENV DS_URL=
ENV DS_USERNAME=
ENV DS_PASSWORD=
# # Initialize datasource resource in context.xml, for example:
# ENV DS_NAME="hap_demo"
# ENV DS_URL="jdbc:mysql://mysql-server:3306/hap_demo"
# ENV DS_USERNAME="hap_demo"
# ENV DS_PASSWORD="hap_demo"

RUN set -eux; \
    echo "JAVA_OPTS='-Xms512m -Xmx2048m'" > bin/setenv.sh

CMD ["catalina-hap.sh", "run"]
