# rabbitmq-mqtt-quorum

Defining mqtt and default user using env variable.

```yaml
version: '3.5'

services:        
    rabbitmq:
        image: buraketmen/rabbitmq-mqtt-quorum:latest
        hostname: rabbitmq
        networks:
            - proxy-net
        environment:
            TZ: Europe/Istanbul
            RMQ_USER: ${RABBITMQ_USERNAME} #will be used for both default user and mqtt user
            RMQ_PASS: ${RABBITMQ_PASSWORD} #will be used for both default user and mqtt user
            RABBITMQ_ERLANG_COOKIE: "your secret key"
            RABBITMQ_CONFIG_FILE: "/etc/rabbitmq/rabbitmq.conf"
        ports:
            - "1883:1883"
            - "5672:5672"
            - "15672:15672"
            - "15675:15675"
            - "61613:61613"
            - "61615:61615"
networks:
    proxy-net:
        driver: overlay
        name: proxy-net
        attachable: true
        
```
