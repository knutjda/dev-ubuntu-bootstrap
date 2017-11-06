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
For lokal utvikling og testing av ansible oppskriftene så brukes Docker 

### Kjøring og test av ansible playbook

Dette gjøres enklest i Docker. 

Først oppretter vi en temp fil, og lagrer filnavnet til en variabel
```
container_id=$(mktemp)
```

Hent ned Docker image som vi skal bruke:
``` 
docker pull geerlingguy/docker-ubuntu1604-ansible:latest
```

Start en instans av Docker image. ID for den kjørende containeren lagres i temp-filen vi opprettet i stad.
Stå i roten av repoet når du kjører denne kommandoen slik at volume-mappingen blir riktig.
```
docker run --detach --volume=`pwd`:/etc/ansible/roles/role_under_test:ro --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro geerlingguy/docker-ubuntu1604-ansible:latest /lib/systemd/systemd  > $container_id
```

Kjør Ansible i Docker containeren.
```
docker exec --tty "$(cat ${container_id})" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/setup.yml

```

Kjør Ansible syntax-check i Docker containeren.
```
docker exec --tty "$(cat ${container_id})" env TERM=xterm ansible-playbook /etc/ansible/roles/role_under_test/setup.yml --syntax-check

```


Når du er ferdig kan du rydde opp ved å kjøre følgende kommandoer
```
docker stop "$(cat ${container_id})"
docker rm "$(cat ${container_id})"
```




### Alternativ testing med Vagrant og Virtualbox
Det er mulig å bruke Virtualbox og Vagrant for å teste Ansible oppsettet. 

For å gjøre dette må en først: 
* Installer Virtualbox og Vagrant


#### Start opp
Dette gjøres enklest med Vagrant på følgende måte:
```
vagrant up
```

Vagrant vil da opprette en maskin i Virtualbox, starte den opp samt kjøre ansible mot den maskinen. 


#### Teste endringer
Hvis en vil gjør endringer i oppskriftene, og vil teste det på den maskinen en allerede har startet opp, så kan en gjøre det med følgende kommando:
```
vagrant provision
```

#### Rydde opp til slutt
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


## TODO
Oppgaver som bør løses

* Konfigurasjon av ca-certificate for http proxy
* Oppsett av ssh-nøkler hvis det ikke eksisterer for brukeren (ssh-keygen -t rsa -b 4096 -C "your_email@example.com")  