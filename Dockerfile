FROM maven:3.8.2-openjdk-8 as buildstage 
WORKDIR /eben
RUN chmod -R 777 eben
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build_stage /eben/target/hello-world-war-null.war /usr/local/tomcat/webapps/
