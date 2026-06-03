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
5) if server already installed mvn remove tick mark on install automatically and add path to the maven_home (path:- /usr/share/maven) 

follow same steps for creating job that was written in Create_first_job
1) after triggers we can see the build options where we can select maven invoke 
2) give goals:- clean install  
   
