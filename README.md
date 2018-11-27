### Supported tags and respective **``Dockerfile``** links
- `8.5-hap-v1.0.1` [(Dockerfile)](https://github.com/eliu/docker-tomcat/blob/master/8.5-hap/Dockerfile)
- `8.5-hap-v1.0.0`
- `8.5-hap`

### Base image: 
- `tomcat:8.5-slim`

### Features:
- Set `jarsToSkip` as `*.jar` to avoid Excpetions during deployment
- Add **setenv.sh** to make tweaks to JAVA_OPTS

### Environment Variables
Since `8.5-hap-v1.0.0`, the following environment variables are supported:

| Variable             | Meaning           | e.g                                     |
| -------------------- | ----------------- | --------------------------------------- |
| DS_DRIVER_CLASS_NAME | Driver Class Name | com.mysql.jdbc.Driver                   |
| DS_NAME              | Datasource Name   | hap_demo                                |
| DS_URL               | Connect URL       | jdbc:mysql://mysql-server:3306/hap_demo |
| DS_USERNAME          | Connect User Name | hap_demo                                |
| DS_PASSWORD          | Connect Password  | hap_demo                                |
> Driver Class Reference: [初始化数据库表结构及基础数据](http://eco.hand-china.com/doc/hap/latest/dev_guide/01.getting_start/06_project_create.html#%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E6%8D%AE%E5%BA%93%E8%A1%A8%E7%BB%93%E6%9E%84%E5%8F%8A%E5%9F%BA%E7%A1%80%E6%95%B0%E6%8D%AE)

The variables listed above will be used in `context.xml` as follows:

```xml
<Resource auth="Container" type="javax.sql.DataSource"
        driverClassName="{{DS_DRIVER_CLASS_NAME}}" 
        url="{{DS_URL}}" 
        name="jdbc/{{DS_NAME}}" 
        username="{{DS_USERNAME}}" 
        password="{{DS_PASSWORD}}"/>
```

### Instructions

Launch tomcat server for HAP:

```
docker run -d --name tomcat \
    -p 8080:8080 \
    -v /path/to/hap/core/target/core.war:/usr/local/tomcat/webapps/core.war \
    --link redis:redis \
    --link rabbitmq:rabbitmq \
    --env-file /path/to/env-file.properties \
    eliu/tomcat:8.5-hap-v1.0.1
```

the content of `env-file.properties` might be something like this:

```properties
DS_DRIVER_CLASS_NAME=oracle.jdbc.driver.OracleDriver
DS_NAME=hap_dev
DS_USERNAME=username
DS_PASSWORD=password
DS_URL=jdbc:oracle:thin:@127.0.0.1:1521/service_name
```

