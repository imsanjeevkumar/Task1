Install Filebeat

Filebeat is a lightweight plugin used to collect and ship log files. 
It is the most commonly used Beats module. One of Filebeat’s major 
advantages is that it slows down its pace if the Logstash service is 
overwhelmed with data.
===========================================================
Install Filebeat by running the following command:

sudo apt-get install filebeat
===========================================================
Configure Filebeat
Filebeat, by default, sends data to Elasticsearch. Filebeat can also be configured to send event data to Logstash.

1. To configure this, edit the filebeat.yml configuration file:

sudo nano /etc/filebeat/filebeat.yml
===========================================================
2. Under the Elasticsearch output section, comment out the following lines:

output.elasticsearch:
   Array of hosts to connect to.
   hosts: ["localhost:9200"]

===========================================================
Next, enable the Filebeat system module, 
which will examine local system logs:

sudo filebeat modules enable system
===========================================================
Start and Enable Filebeat

Start and enable the Filebeat service:
sudo systemctl start filebeat
sudo systemctl enable filebeat
===========================================================
Start nginx module for filebeat:

filebeat modules enable nginx
===========================================================
setup filebeat from terminal to get logs in kibana,
filebeat setup -e
===========================================================
Verify Elasticsearch Reception of Data
Finally, verify if Filebeat is shipping log files to Logstash for processing. Once processed, data is sent to Elasticsearch.

curl -XGET http://localhost:9200/_cat/indices?v
