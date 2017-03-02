# Instalacija Java pomoću Apt-Get na Ubuntu 16.04


## Instalacija defaultnog JRE/JDK


Prvo, updejtujemo index paketa.

  ```  $ sudo apt-get update```

Onda, instaliramo Javu. Konkretno, u ovom slučaju instaliramo Java Runtime Environment (JRE).

  ```  $ sudo apt-get-install default-jre```

## Managing Java

Na serveru moze biti vise Java instalacija. U tom slucaju se moze konfigurisati koja je verzija defaultna pomocu komande ```update-alternatives``` koja podesava koji sybolic linkovi se koriste za razlicite komande.
```sudo update-alternatives --config java```










> Written with [StackEdit](https://stackedit.io/).