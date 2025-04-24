# F1 Explorer Web App

Aquesta aplicació web ofereix una experiència visual i interactiva del món de la Fórmula 1. L'usuari pot explorar els principals equips, veure informació detallada dels pilots, i accedir a dades dels resultats de curses, comunicacions per ràdio, stints i sessions dels grans premis.

## Funcionalitats

- **Login i Registre**: Panell inicial per accedir o registrar un compte nou.
- **Pantalla Principal**: Visualització dels principals equips de F1 amb fotos. Fent clic a un equip, es mostren:
    - Nom dels pilots
    - Any de fundació de l'equip
    - Nombre de campionats guanyats
- **Navegació Superior**:
    - Resultats de curses
    - Ràdios dels equips
    - Stints dels pilots
    - Dades de grans premis.

## API Utilitzada

Aquesta aplicació consumeix dades de la següent API:

https://api.openf1.org/v1/(endpoint)

Depenent de la informació que es vol mostrar, es crida l’endpoint corresponent. Exemples:
- `/drivers`
- `/teams`
- `/races`
- `/stints`
- `/radio`

Consulta la [documentació oficial](https://api.openf1.org/docs) per a més informació.

## Requisits

- Java (JDK)
- Apache Tomcat
- Sistema operatiu Linux o entorn compatible

## Desplegament

Seguint el tutorial de Tomcat, aquí tens els passos per desplegar el projecte:

### 1. Instal·lació de Java

```bash
sudo apt install default-jdk
```
2. Comprovació de la versió de Java
```bash
java -version
```
3. Creació de l'usuari per a Tomcat
```bash
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
```
4. Instal·lació i configuració de Tomcat

    Descarrega i extreu Tomcat a /opt/tomcat.

    Crea el fitxer tomcat.service per gestionar-lo com a servei.

5. Inici i comprovació del servei
```bash
sudo systemctl daemon-reexec
sudo systemctl start tomcat
sudo systemctl status tomcat
```
6. Accés via navegador

Un cop actiu, pots accedir-hi mitjançant:

http://<IP_del_servei>:8080
