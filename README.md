# DevOps-journey

1. Started with RHEL based Linux OS, mostly using Konsol for my operations and learning, virtualisation in Oracle VM VirtualBox
2. Moved onto Bash scripting, some simple scripts which included encryption and creating random/shuffle data.
3. Doing some MySQL work and getting acquainted with RDBMS, combined with Bash, made script to generate random data using Faker tool.
4. Discovering wonderful world of Ansible for automatisation, I've made 2 virtual machines and done some playbooks which involved
NTP, cronjobs,  package installations and user management.
5. What to do after Ansible? Prometheus and Grafana, with node exporter, of course. I've made few hosts and then my node exporter scraped
system metrics from them, sent them to my server into Prometheus to stash them. Fetch them out and serve it on various dashboards in Grafana.


Things which are not included, but made small project to get myself familiar how high availability/load balancing works:
- made python app to listen on custom port and serve response when reached properly (this one is actually in python folder on GH)
- put them on 2 VM 
- configured NGINX as web service
- HAproxy as load-balancer where I used round robin balancing and created self-signed SSL certificate
- Keepalived as failover between HAproxy services


I also got myself little bit into Docker.
