## Korisne komande za tomcat 

* Da bi mogli da koristimo `jar` komandu, moramo da instaliramo JDK:
`apt-get install default-jdk`

* Kreiranje war fajla (Web application ARchive) od foldera u kome se nalazi web sajt  se moze uraditi ovako:
```
cd /path/to/folder/
jar -cvf ime_war_fajla.war *
```
* Da bi videli sadrzaj war fajla, mozemo izvrsiti:
`jar tvf ime_war_fajla.war`

* Podesavanje porta na kome slusa tomcat se radi u fajlu `$CATLINA_HOME/conf/server.xml`:
`<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />`