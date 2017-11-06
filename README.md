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


## Utvikling og test
For lokal utvikling og testing av ansible oppskriftene så brukes Virtualbox og Vagrant. 
* Installer Virtualbox og Vagrant


### Kjøring og test av ansible playbook
Dette gjøres enklest med Vagrant på følgende måte:
```
vagrant up
```

Vagrant vil da opprette en maskin i Virtualbox, starte den opp samt kjøre ansible mot den maskinen. 

Hvis en vil gjør endringer i oppskriftene, og vil teste det på den maskinen en allerede har startet opp, så kan en gjøre det med følgende kommando:
```
vagrant provision
```

Når en er ferdig kan en fjerne den virtuelle maskinen ved å kjøre følgende kommano:
```
vagrant destroy
```

### Test av install.sh kommandoen
Dette kan gjøres ved å starte en boks i Vagrant på følgende måte:
```
vagrant up --no-provision
```

Deretter kan en logge inn på den virtuelle maskinen med følgende kommando:
```
vagrant ssh
```

Så kan en kjøre kommandoen for "Første gangs installasjon" beskrevet lengere opp på siden. Merk at dette ikke vil teste evnt lokale endringer. 