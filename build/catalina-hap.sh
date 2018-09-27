#!/bin/bash

# Configure datasource if user specify env variables properly
if [[ ! -z ${DS_NAME} ]]; then
    escaped_password=$(echo ${DS_PASSWORD} | sed 's~\~~\\\~~g')
    cat ${CATALINA_HOME}/conf/context.xml.j2 \
        | sed "s~{{DS_DRIVER_CLASS_NAME}}~${DS_DRIVER_CLASS_NAME}~g" \
        | sed "s~{{DS_NAME}}~${DS_NAME}~g" \
        | sed "s~{{DS_URL}}~${DS_URL}~g" \
        | sed "s~{{DS_USERNAME}}~${DS_USERNAME}~g" \
        | sed "s~{{DS_PASSWORD}}~${escaped_password}~g" \
        > ${CATALINA_HOME}/conf/context.xml
fi

"${CATALINA_HOME}/bin/catalina.sh" "$@"
