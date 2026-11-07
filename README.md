# BeachMatch – Backend - Installatiehandleiding

## Inhoudsopgave
1. [Inleiding](#1-inleiding)
2. [Benodigdheden](#2-benodigdheden)
3. [Projectstructuur en technieken](#3-projectstructuur-en-technieken)
4. [Applicatie draaien](#4-applicatie-draaien)
5. [Overige commando's](#5-overige-commandos)
6. [Testgebruikers en rollen](#6-testgebruikers-en-rollen)

## 1. Inleiding
Dit is de backend van BeachMatch, een webapplicatie voor het vinden van het beste strand op basis van de meest actuele weer- en verkeersinformatie. Gebruikers kunnen zoeken naar stranden in heel Nederland. Door middel van het aanduiden van favoriete stranden, kan de gebruiker een persoonlijke aanbeveling zien. De aanbeveling laat zien welk strand op dat moment het prettigst is om te bezoeken. Tevens kunnen er reviews van andere strandgangers gelezen worden en kan de gebruiker zelf ook reviews plaatsen.

De backend is een REST API, gebouwd met Spring Boot. Spring boot beheert alle gegevens van de applicatie: stranden, strandkenmerken, reviews, favorieten, gebruikersprofielen en strandfoto's. De gegevens worden opgeslagen in een PostgreSQL-database. Authenticatie en autorisatie verlopen via Keycloak.

De belangrijkste functionaliteiten:
- Stranden en strandkenmerken opvragen, toevoegen, wijzigen en verwijderen
- Strandfoto's uploaden en downloaden
- Een eigen profiel aanmaken en aanpassen
- Reviews plaatsen, wijzigen en verwijderen (alleen je eigen reviews)
- Favoriete stranden opslaan en verwijderen (alleen je eigen profiel)
- Beveiliging met twee rollen: gebruiker en beheerder

GitHub-repository: [BeachMatch-Backend](https://github.com/DominiqueDersigni/BeachMatch-Backend)
De bijbehorende frontend: [BeachMatch-Frontend](https://github.com/DominiqueDersigni/BeachMatch-Frontend)

## 2. Benodigdheden

Om de backend lokaal te kunnen draaien, heb je het volgende nodig:

- **Java 21 (JDK)** – bijvoorbeeld Amazon Corretto 21 of OpenJDK 21.
- **Maven** – hoeft niet apart geïnstalleerd te worden: het project bevat een Maven Wrapper (`mvnw`).
- **PostgreSQL** – de database. Te downloaden via [postgresql.org](https://www.postgresql.org). Handig om erbij te installeren: **pgAdmin**, om de database te beheren.
- **Keycloak 26** – voor het inloggen en de rollen. Te downloaden via [keycloak.org](https://www.keycloak.org/downloads).
- **Een code-editor** – bijvoorbeeld IntelliJ IDEA.
- **Postman** – om de API te testen. De Postman-collectie staat in de hoofdmap van dit project.

## 3. Projectstructuur en technieken

```
BeachMatch/
├── src/
│   ├── main/
│   │   ├── java/nl/novi/beachmatch/
│   │   │   ├── config/          → beveiliging (SecurityConfig) en CORS-instellingen
│   │   │   ├── controllers/     → REST-endpoints: ontvangen requests en sturen responses terug
│   │   │   ├── dtos/            → request- en response-objecten per onderdeel, met validatie
│   │   │   ├── entities/        → databasemodellen (stranden, kenmerken, reviews, favorieten, gebruikers, foto's)
│   │   │   ├── enums/           → vaste waardes, zoals vervoersmiddelen
│   │   │   ├── exceptions/      → eigen foutmeldingen 
│   │   │   ├── helpers/         → hulpklassen, zoals de GlobalExceptionHandler
│   │   │   ├── mappers/         → omzetten van entities naar DTO's en andersom
│   │   │   ├── repositories/    → communicatie met de database
│   │   │   └── services/        → de businesslogica
│   │   └── resources/
│   │       ├── application.properties   → configuratie van database en Keycloak
│   │       └── data.sql                 → testdata die bij het opstarten wordt ingeladen
│   └── test/
│       ├── java/nl/novi/beachmatch/
│       │   ├── controllers/     → integratietests
│       │   └── services/        → unit tests
│       └── resources/
│           └── application-test.properties → configuratie van de testdatabase (H2)
├── .env.example                         → voorbeeld van de benodigde omgevingsvariabelen
├── keycloak-realm-export.json           → export van de Keycloak-realm met rollen en testgebruikers
├── BeachMatch.postman_collection.json   → Postman-collectie met alle endpoints
├── pom.xml                              → Maven-configuratie en dependencies
└── README.md
```

### Gebruikte technieken

- **Java 21** – programmeertaal.
- **Spring Boot 3.5** – framework voor het bouwen van de REST API.
- **Maven** – voor het beheren van dependencies en het bouwen van het project.
- **Spring Data JPA / Hibernate** – voor de communicatie met de database.
- **PostgreSQL** – relationele database.
- **Spring Security + OAuth2 Resource Server** – voor het controleren van de JWT-tokens van Keycloak.
- **Keycloak** – voor authenticatie en het beheren van gebruikers en rollen.
- **Jakarta Bean Validation** – voor het valideren van de input in de DTO's.
- **JUnit 5, Mockito en MockMvc** – voor de unit- en integratietests.
- **H2** – een in-memory database die alleen tijdens de tests wordt gebruikt.

## 4. Applicatie draaien

Volg deze stappen om de backend lokaal op te starten.

### Stap 1 – Maak de database aan
1. Start PostgreSQL en open pgAdmin.
2. Maak een nieuwe database aan met de naam `beachmatch`.

Tabellen hoef je niet zelf aan te maken: dat doet de applicatie bij het opstarten.

### Stap 2 – Start Keycloak
1. Pak Keycloak 26 uit op je computer.
2. Open een terminal in de map van Keycloak en start Keycloak op poort 9090:
   ```
   ./bin/kc.sh start-dev --http-port=9090
   ```
   Op Windows gebruik je `bin\kc.bat start-dev --http-port=9090`.
3. Ga naar `http://localhost:9090`. Start je Keycloak voor het eerst? Maak dan eerst een beheerdersaccount aan voor de Keycloak-console.

### Stap 3 – Importeer de realm
1. Log in op de Keycloak-console via `http://localhost:9090`.
2. Klik linksboven op het dropdownmenu met realms en kies **Create realm**.
3. Klik bij **Resource file** op **Browse** en kies het bestand `keycloak-realm-export.json` uit de hoofdmap van dit project.
4. Klik op **Create**.

De realm `BeachMatch` wordt nu aangemaakt, met de clients, de rollen en de testgebruikers uit hoofdstuk 6.

### Stap 4 – Open het project
Pak het ZIP-bestand uit en open de map `BeachMatch` in IntelliJ IDEA.

Werk je liever via GitHub? Dan kun je het project ook clonen:
```
git clone https://github.com/DominiqueDersigni/BeachMatch-Backend.git
```

### Stap 5 – Maak een `.env`-bestand aan
De gegevens van de database en Keycloak staan in een `.env`-bestand.
1. In de **hoofdmap** van het project (de map waar ook `pom.xml` staat) vind je het bestand `.env.example`.
2. Klik er met de rechtermuisknop op, kies **Copy** en daarna **Paste** in dezelfde map. Noem de kopie `.env`.
3. Open `.env` en vul je eigen gegevens in:
   ```
   POSTGRESQL_USERNAME=jouw-postgresql-gebruikersnaam
   POSTGRESQL_PASSWORD=jouw-postgresql-wachtwoord
   KEYCLOAK_CLIENT_SECRET=jouw-client-secret
   ```
    - De gebruikersnaam en het wachtwoord zijn die van je eigen PostgreSQL-installatie (de gebruikersnaam is meestal `postgres`).
    - Het client secret vind je in Keycloak: realm **BeachMatch** → **Clients** → **BeachMatchBackend** → tabblad **Credentials**.
4. Sla het bestand op.

> **Belangrijk:** de gegevens moeten in het bestand `.env` staan, niet in `.env.example`. De applicatie leest alleen `.env`.

Het `.env`-bestand staat in `.gitignore` en wordt daardoor niet naar GitHub gestuurd. Zo blijven de wachtwoorden privé.

### Stap 6 – Start de applicatie
Open in IntelliJ het bestand `BeachMatchApplication.java` en klik op het groene pijltje naast `main`.

Of voer in de terminal uit:
```
./mvnw spring-boot:run
```
Op Windows gebruik je `mvnw.cmd spring-boot:run`.

De backend draait nu op `http://localhost:8080`. Bij het opstarten worden de tabellen aangemaakt en wordt de testdata uit `data.sql` ingeladen.

> **Let op:** de database wordt bij elke herstart opnieuw opgebouwd (`ddl-auto=create`). Alles wat je tijdens het testen toevoegt of verwijdert, staat na een herstart weer zoals in `data.sql`.

### Stap 7 – De API testen met Postman
1. Open Postman en klik op **Import**.
2. Kies het bestand `BeachMatch.postman_collection.json` uit de hoofdmap van dit project.
3. Open de map **0. Tokens** en klik bij **Get token admin** en **Get token user (daniel)** op **Send**. De tokens worden automatisch opgeslagen.
4. Alle andere requests gebruiken deze tokens automatisch. Een token is 60 minuten geldig. Krijg je een `401 Unauthorized`? Haal dan opnieuw een token op.

## 5. Overige commando's

De tests gebruiken een aparte in-memory database (H2). PostgreSQL en Keycloak hoeven daarvoor dus niet te draaien.

| Commando | Omschrijving |
|---|---|
| `./mvnw test` | Voert alle tests uit: 10 unit tests (ReviewService en FavoriteService) en 3 integratietests (BeachController). |
| `./mvnw clean install` | Bouwt het project opnieuw op en voert daarbij ook de tests uit. |
| `./mvnw spring-boot:run` | Start de applicatie. |

Op Windows gebruik je `mvnw.cmd` in plaats van `./mvnw`.

In IntelliJ kun je de tests ook uitvoeren door met de rechtermuisknop op de map `src/test/java` te klikken en **Run 'All Tests'** te kiezen.

## 6. Testgebruikers en rollen

De applicatie kent twee rollen. De gebruikers en rollen worden beheerd in Keycloak (realm `BeachMatch`) en worden geïmporteerd via het bestand `keycloak-realm-export.json` (zie stap 3).

| Rol | Wat kan deze rol? |
|---|---|
| `ROLE_USER` | Stranden en strandkenmerken bekijken, favorieten opslaan, reviews schrijven en het eigen profiel aanpassen. |
| `ROLE_ADMIN` | Alles wat een gebruiker kan, plus stranden en strandkenmerken toevoegen, wijzigen en verwijderen, strandfoto's uploaden, alle gebruikers bekijken en het aantal favorieten per strand opvragen. |

### Testgebruikers

| Gebruikersnaam | Wachtwoord | Rol |
|----------------|------------|---|
| `admin`        | `beach123` | `ROLE_ADMIN` |
| `daniel`       | `daan123`  | `ROLE_USER` |
| `juliette`     | `juul123`  | `ROLE_USER` |
| `valerie`      | `val123`   | `ROLE_USER` |
| `gittha`       | `git123`   | `ROLE_USER` |

De rollen per endpoint staan beschreven in de API-documentatie.