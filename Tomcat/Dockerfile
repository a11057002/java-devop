FROM tomcat:9.0.43

# 設置 IP 及 User 
RUN cp -r webapps.dist/* webapps/
COPY context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY start.sh /start.sh

# 下載 ssh-server 並允許 root 登入
RUN apt-get update && apt-get install -y openssh-server vim
RUN sed -i 's/.*PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config

# 設定 root 密碼為 docker
RUN echo "root:docker"|chpasswd 
ENTRYPOINT ["/start.sh"]
CMD ["catalina.sh","run"]

