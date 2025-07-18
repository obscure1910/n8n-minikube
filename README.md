# Hinweis
Dieses Projekt nutzt haupsächlich das Helmchart von [8gears](https://github.com/8gears/n8n-helm-chart) :heart:

# Vorbediungungen

### Minikube
[Minikube](https://minikube.sigs.k8s.io) ermöglicht das schnelle aufsetzen eines lokalen kubernetes cluster

### Helm
[Helm](https://helm.sh/) zum managen von Kubernetesanwendungen mittels Charts 

### Helmfile
[Helmfile](https://github.com/helmfile/helmfile) ermöglicht deklarativ das deployen von Charts

### ngrok
[ngrok](https://ngrok.com) ist ein Reverse-Proxy und Operator, der den externen Zugriff auf APIs innerhalb eines Kubernetes-Clusters ermöglicht – ganz ohne komplexe Konfigurationen

#### Hinweis zu ngrok
Ngrok erstellt für jeden referenzierten Service im Ingress automatisch AgentEndpoints und zugehörige Regeln. Im Free-Plan sind jedoch nur fünf Policy-Regeln erlaubt.
Damit der Operator keine AgentEndpoints automatisch anlegt, darf die Ingress Class nicht auf "ngrok" gesetzt sein.

Andernfalls erscheint im generierten AgentEndpoint folgender Fehler:

    This agent has exceeded its policy rule limit of 5. Please log into https://dashboard.ngrok.com ...

Wird stattdessen ein ngrok Cloud Endpoint verwendet, ist kein Ingress erforderlich, und Minikube kann ohne Ingress-Komponente gestartet werden. Für den Nutzer ist hier nichts weiter anzupassen, es ist lediglich ein Hinweis.

# Kubernetes starten und n8n deployen


## Umgebungsvariablen
Folgende Umgebungsvariablen müssen auf dem Host gesetzt sein

|Umgebungsvariable      |Beschreibung|
|-----------------------|-------------|
|NGROK_DOMAIN           |Freie Domäne die man bei ngrok bekommen hat |
|NGROK_API_KEY          |Api Key von ngrok |
|NGROK_AUTHTOKEN        |Auth Token von ngrok |
|N8N_ENCRYPTION_KEY     |wird zum Verschlüsseln von credentials verwendet |
|N8N_POSTGRESQL_USER    |Benutzername für die Datenbank |
|N8N_POSTGRESQL_PASSWORD|Passwort für die Datenbank |

## Minikube starten
```bash
./kubernetes.sh
```

## Helmfile initialisieren
```bash
helmfile init
```

## Helmfile ausführen
```bash
helmfile sync
```

__Da der ngrok Operator erst gestartet wird wenn alle Pods laufen, kann das Deployment beim ersten Aufruf bis zu 3 Minuten dauern.__

### n8n aufrufen
Die von ngrok bereitgestellte Domäne im Brwoser aufrufen

https://he-man.ngrok-free.app


