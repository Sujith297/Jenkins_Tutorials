Installing jenkins in the amazon linux machine(ec2 instance c7i-flex large)

5 Steps required to install (install as a root user)
command:- sudo -i
1) install java (because jenkins works on java)
command:- yum install java-21-amazon-corretto (java version depends on the jenkins support )
2) go jenkins.io website go to download section then select desired OS ,in our case red hat enterprise and its derivatives go there get commands 
link:- https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos
3)install jenkins
command:- yum install jenkins
4) check status of jenkins
command:- systemctl status jenkins
5) start jenkins
command:- systemctl start jenkins 

Configuring Jenkins (jenkins by default runs 8080 port add this to security inbound rules of your instance)

Open any browser and open <ec2-publicip>:8080

You will see jenkins dashboard 
it asks for key token to setup 

it will show you path where key token present copy that path
command :- cat <path>

setusername and password 

Thats it 
