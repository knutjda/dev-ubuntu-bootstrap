# Oppsett av utviklingsmiljø på Ubuntu

Dette er et Ansible prosjekt for å installere et basisoppsett for utviklere på Ubuntu 16.04 VDI.

## Programvare

Følgende programvare installeres og konfigureres
* OpenJDK 8
* Docker CE
* IntelliJ
* Gradle
* Maven
* Terminator - En litt bedre terminal.
  


## Bruk

### Første gangs installasjon

Åpne et terminal vindu og kjør følgende kommando:
```
wget https://raw.githubusercontent.com/knutjda/dev-ubuntu-bootstrap/master/install.sh -O - | bash

```


### Oppgradering av eksisterende oppsett

Åpne et terminal vindu og kjør følgende kommandoer:
```
$ cd $HOME/programming/dev-ubuntu-bootstrap
$ git pull
$ ansible-playbook setup.yml
```
