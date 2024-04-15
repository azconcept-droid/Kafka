# Kafka
## Technologies
<div align="left">
    <img src="https://skillicons.dev/icons?i=docker,kafka" />
</div>

**Resources**
- [Quick start](https://kafka.apache.org/quickstart)
- [Intro to apache kafka](https://kafka.apache.org/intro)
- [Official documentation](https://kafka.apache.org/documentation/#docker)
- [Kafka crash course](https://www.youtube.com/watch?v=ZJJHm_bd9Zo) <em>Start from 44:42</em>
- [kafka docker github doc](https://github.com/apache/kafka/blob/trunk/docker/examples/README.md)
- [Apache kafka workflow](https://www.tutorialspoint.com/apache_kafka/apache_kafka_workflow.htm)
- [Non java clients api](https://cwiki.apache.org/confluence/display/KAFKA/Clients)
- [kafkajs npm module](https://kafka.js.org/docs/getting-started)
- [Youtube kafka nodejs](https://www.youtube.com/watch?v=LOLgEGet9yA&list=PLWkguCWKqN9ODj1BNk5V-aOhjvjPxSb2R&index=5)

## Getting started
1. Fork or clone this repo
```
git clone https://github.com/azconcept-droid/kafka.git
```
2. cd into this directory
```
cd kafka
```
3. Install docker
```
bash install-docker
```
## Start kafka server
### Using Single node cluster
1. Create a single node cluster using plaintext
```
# Run from root of the repo
docker compose -f plaintext/docker-compose.yml up
```
2. Create a single node cluster using ssl
```
# Run from root of the repo
docker compose -f ssl/docker-compose.yml up
```
3. Create a single node cluster using fileinput
```
# Run from root of the repo
docker compose -f fileinput/docker-compose.yml up
```
#### Start zookeeper
1. Run the command
```
# Start the ZooKeeper service
bin/zookeeper-server-start.sh config/zookeeper.properties
```
#### To produce message using client script
```
# Run from root of the repo
bin/kafka-console-producer.sh --topic test --bootstrap-server localhost:9092
```

### Using multinode cluster

## Issues

1. 
```
Connection error: getaddrinfo EAI_AGAIN kafka","retry Count":5,"retryTime":9324}{"level":"ERROR","timestamp":"2024-04-15T08:07:54.680Z","logger":"kafkajs","message":"[Connection] Connection error: getaddrinfo EAI_AGAIN kafka","broker":"kafka:9092","clientId":"my-producer","stack":"Error: getaddrinfo EAI_AGAIN kafka\n at GetAddrInfoReqWrap.onlookupall [as oncomplete] (node:dns:118:26)"}KafkaJSNonRetriableErrorCaused by: KafkaJSConnectionError: Connection error: getaddrinfo EAI_AGAIN kafka
```
2. [issue](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://stackoverflow.com/questions/49370959/getting-org-apache-kafka-common-network-invalidreceiveexception-invalid-receiv&ved=2ahUKEwjj486og5KFAxViYUEAHVmfCCEQFnoECBQQAQ&usg=AOvVaw2TVu65wPZZNnPk-EJTYliJ)
3. 
[issue](https://issues.apache.org/jira/browse/KAFKA-3746)
