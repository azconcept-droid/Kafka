# Kafka
## Technologies
<div align="left">
    <img src="https://skillicons.dev/icons?i=docker,kafka" />
</div>

**Resources**
- [Intro to apache kafka](https://kafka.apache.org/intro)
- [Official documentation](https://kafka.apache.org/documentation/#docker)
- [kafka docker github doc](https://github.com/apache/kafka/blob/trunk/docker/examples/README.md)
- [Apache kafka workflow](https://www.tutorialspoint.com/apache_kafka/apache_kafka_workflow.htm)

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
$ docker compose -f docker/plaintext/docker-compose.yml up
```
2. Create a single node cluster using ssl
```
# Run from root of the repo
$ docker compose -f docker/ssl/docker-compose.yml up
```
3. Create a single node cluster using fileinput
```
# Run from root of the repo
$ docker compose -f docker/fileinput/docker-compose.yml up
```
#### To produce message using client script
# Run from root of the repo
$ bin/kafka-console-producer.sh --topic test --bootstrap-server localhost:9092

### Using multinode cluster

[issue](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://stackoverflow.com/questions/49370959/getting-org-apache-kafka-common-network-invalidreceiveexception-invalid-receiv&ved=2ahUKEwjj486og5KFAxViYUEAHVmfCCEQFnoECBQQAQ&usg=AOvVaw2TVu65wPZZNnPk-EJTYliJ)

[issue](https://issues.apache.org/jira/browse/KAFKA-3746)
