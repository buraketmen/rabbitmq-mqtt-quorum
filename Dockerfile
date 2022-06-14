FROM rabbitmq:3.9.15-management
USER root
ARG DEBIAN_FRONTEND=noninteractive
COPY init.sh /tmp/
COPY config /etc/rabbitmq/
RUN chmod u+x /tmp/init.sh
RUN rabbitmq-plugins enable rabbitmq_management rabbitmq_mqtt \
	rabbitmq_web_mqtt rabbitmq_amqp1_0 rabbitmq_prometheus \ 
	rabbitmq_peer_discovery_consul rabbitmq_federation \
	rabbitmq_federation_management rabbitmq_shovel rabbitmq_shovel_management

ENTRYPOINT ["/tmp/init.sh"]

CMD ["rabbitmq-server"]
