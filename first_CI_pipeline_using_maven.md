Building our frist ci_pipeline using maven for java project

prerequisites for maven :
installation:
command:- yum install maven -y

java lifecycle 
1)code (mvn archetype:generate)
2)complie (mvn compile)
3)test (mvn test)
4)package (mvn package)
5)install (mvn install)
6)clean (mvn clean)

setting up maven in server using tools:- 
1) go to jenkins managae
2) select tools
3) select maven
4) give it a name(maven and its version) and save
5) if server already installed mvn (command:- yum install maven -) remove tick mark on install automatically and add path to the maven_home (path:- /usr/share/maven)
6) update pom.xml file according to java version (done by developer) 

follow same steps for creating job that was written in Create_first_job
1) after triggers we can see the build options where we can select maven invoke 
2) give goals:- clean install

CD pipeline:-
1)create new ec2 instance where we have install tomcat for that use tomcat.sh script (read script carefully for username and password)
2)install Deploy to container plugin in manage jenkins -> plugins -> available plugins 

3)configure post build actions
<img width="1345" height="779" alt="image" src="https://github.com/user-attachments/assets/c1fddb8b-b231-4061-ab8e-e63ac79486b3" />

4) open ec2-public_ip:8080, go to manager app give username and password and check your deployment over there


   
