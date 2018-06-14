FROM tomcat:8.5

LABEL maintainer="eliu <eliuhy@163.com>"

COPY catalina.properties context.xml conf/

ENV TZ=Asia/Shanghai

RUN set -x \
    && echo "JAVA_OPTS='-Xms512m -Xmx2048m'" > bin/setenv.sh
