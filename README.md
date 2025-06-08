/*
---------------------------------------STAGE-GIT-CHECKOUT-----------------------------------------------------------
    ==> cleanWs() (Cleans workspace at every job)
    ==> checkout scm (It will clone git repo inside your jenkins workspace)
---------------------------------------STAGE-MAVEN-BUILD------------------------------------------------------------ 
    ==> sh 'wget https://dlcdn.apache.org/maven/maven-3/3.9.10/binaries/apache-maven-3.9.10-bin.zip'
    ==> sh 'unzip apache-maven-3.9.10-bin.zip'
    ==> sh 'rm -rf apache-maven-3.9.10-bin.zip'
    ==> sh 'chmod -R 777 apache-maven-3.9.10

    --> set Environment veriable,MAVEN_HOME and PATH once logout and login from ec2 or use (source /root/.bash_profile)
        [ vi /root/.bash_profile ] 
        



*/