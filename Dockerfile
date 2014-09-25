FROM java
RUN apt-get install -y gcc curl
ADD jgroups.jar /jgroups.jar
ADD run.sh /run.sh
RUN chmod +x /run.sh
CMD ["send"]
ENTRYPOINT ["/run.sh"]
