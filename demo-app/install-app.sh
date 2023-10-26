export JAVA_HOME=/usr/local/opt/openjdk@17
mvn clean install
mvn spring-boot:run

##To delete AppService Plan, Run below->
##az appservice plan delete --name --resource-group