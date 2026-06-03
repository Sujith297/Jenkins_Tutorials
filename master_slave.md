master_slave concept used to divide pipelines according to the dev test prod uat or services 

master divide pipelines to other slaves

how to setup this 

master instance have jenkins no need of git 

slaves have java and git 

we need to add new node on jenkins manages have option for nodes 

create new node 
1) give label dev or test etc
2) select option only label matches
3) select connect with slave ssh where we provide hostname our private ip credentials username ec2-username password entire text in .pem

then in configure job  select restrict build option and label flow same ci/cd pipeline process
