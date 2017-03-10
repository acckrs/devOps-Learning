FROM tomcat

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME
FROM tomcat

ADD tomcat-users.xml CATALINA_HOME/conf/
ADD manager.xml CATALINA_HOME/conf/Catalina/localhost/
ADD acckrs.war CATALINA_HOME/webapps/
