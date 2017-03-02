1. Install Java 8
2. install Git
3. Install Tomcat 9
4. Download Jenkins.war
5. Deploy Jenkins.war
6. Install relevant plugins za Jenkins

## 1. Instalacija Jave 


### Instalacija defaultnog JRE/JDK


Prvo, updejtujemo index paketa.

  ```  $ sudo apt-get update```

Onda, instaliramo Javu. Konkretno, u ovom slučaju instaliramo Java Runtime Environment (JRE).

  ```  $ sudo apt-get-install default-jre```

### Podesavanje Jave

Na serveru moze biti vise Java instalacija. U tom slucaju se moze konfigurisati koja je verzija defaultna pomocu komande ```update-alternatives``` koja podesava koji sybolic linkovi se koriste za razlicite komande.

```sudo update-alternatives --config java```

U outputu mozemo izabrati broj za verziju koju zelimo da koristimo. Ovo vazi i za druge java commande kao sto su kompajler(```javac```) generator dokumentacije (```javadoc```) isl.

### Podesavanje JAVA_HOME Environment Variable

Da bi podesili JAVA_HOME varijablu, iz outputa ```update-variables``` iskopiramo putanju do instalacionog foldera u ```/etc/environment```  dokument:

```JAVA_HOME="/usr/lib/jvm/java-8-oracle" \# ovde staviti pravu putanju```

Snimi, izadji i ponovo ucitaj fajl
```$ source /etc/environment```
   ```$ echo JAVA_HOME```

## 2. Instalacija Git-a

```apt-get install git```

## 3. Instalacija i podesavanje Tomcat 9 

### Instalacija Tomcat 9 

```cd /opt/``` 

```apt-get install wget```

```wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz```

```tar xzf apache-tomcat-9.0.0.M17.tar.gz```

Iz sigurnosnih razloga, nije dobro da pokrecemo Tomcat kao root, pa cemo napraviti novog sistemskog usera:

```useradd -r tomcat9 --shell /bin/false```

Napravi symbolic link  Tomcat foldera u  /opt/tomcat-latest podesi odgovarajuci ownership:
```ln -s apache-tomcat-9.0.0.M6 tomcat-latest```
```chown -hR tomcat9: tomcat-latest apache-tomcat-9.0.0.M6```

Tomcat se moze startovati i zaustaviti iz /opt/tomcat-latest/bin foldera pomocu bash  skripti
```
./opt/tomcat-latest/bin/startup.sh
``` 

### Podesavanje tomcat-users.xml

Sada treba da damo username i pass za Apache Tomcat role (pre toga zaustavimo tomcat9)

```
./opt/tomcat-latest/bin/shutdown.sh
vi /home/edureka/tomcat9/conf/tomcat-users.xml
```

```
<tomcat-users>
<pre><role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <role rolename="manager-jmx"/>
  <role rolename="manager-status"/>
  <role rolename="admin-gui"/>
  <role rolename="admin-script"/>
  <user username="admin" password="password!" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui,admin-script"/>
  </tomcat-users>
```
Sada ponovo startujemo tomcat9 i pristupimo mu iz browsera po portu (localhost:8880) koji smo definisali uz pomoc -p parametra u docker run id -p 8880:8080 komandi

Svaka web aplikacija koja je deplojovana, ima context.xml fajl koji se nalazi u ```/conf/Catalina/localhost```  (po defaultu) i ima isto ime kao web app.
Kako bi mogli da pristupamo Tomcat 9 Manager aplikaciji (da bi mogli da uradimo deploy Jankins.war paketa) treba izmeniti ```manager.xml``` fajl i definisati pravilo da zelimo da dozvolimo remote access
U ovom primeru dozvoljavamo pristup svim IP adresama:
```
<Context privileged="true" antiResourceLocking="false" 
         docBase="${catalina.home}/webapps/manager">
    <Valve className="org.apache.catalina.valves.RemoteAddrValve" allow="^.*$" />
</Context>
```





