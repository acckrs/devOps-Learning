# Instalacija Java pomoću Apt-Get na Ubuntu 16.04


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

````JAVA_HOME="/usr/lib/jvm/java-8-oracle" \# ovde staviti pravu putanju```

Snimi, izadji i ponovo ucitaj fajl
```$ source /etc/environment```
   ```$echo JAVA_HOME```





