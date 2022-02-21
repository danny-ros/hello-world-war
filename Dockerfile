FROM tomcat

COPY /opt/tomcat/.jenkins/workspace/Module 5/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
