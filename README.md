# Vorbediungungen

### Minikube
[Minikube](https://minikube.sigs.k8s.io) ermöglicht das schnelle aufsetzen eines lokalen kubernetes cluster

### Helm
[Helm](https://helm.sh/) zum managen von Kubernetesanwendungen mittels Charts 

### Helmfile
[Helmfile](https://github.com/helmfile/helmfile) ermöglicht deklarativ das deployen von Charts

### ngrok
[ngrok](https://ngrok.com) ist ein Reverse Proxy und ermöglicht den Zugriff von externen auf APIs im Kubernetes Cluster ohne komplexe Konfigurationen

#### Hinweis zu ngrok
Ngrok startet pro referenzierten Service im Ingress automatisch AgentEndpoints und Regeln. Im "free plan" darf man aber nur 5 Policy Rules haben und darum muss als Ingress class "nginx" statt "ngrok" verwendet werden
Im generierten AgentEndpoint ist sonst ein Fehler zu sehen:
> This agent has exceeded its policy rule limit of 5. Please log into https://dashboard.ngrok.com ...

In dieser Version mit Cloudendpoint ist kein Ingress mehr nötig und Minikube wird ohne Ingress gestartet.

# Kubernetes starten und n8n deployen


## Umgebungsvariablen
Folgende Umgebungsvariablen müssen auf dem Host gesetzt sein

|Umgebungsvariable  |Beschreibung|
|-------------------|-------------|
|NGROK_DOMAIN       |Freie Domäne die man bei ngrok bekommen hat |
|NGROK_API_KEY      |Api Key von ngrok |
|NGROK_AUTHTOKEN    |Auth Token von ngrok |
|N8N_ENCRYPTION_KEY |wird zum Verschlüsseln von credentials verwendet |

## Minikube starten
```bash
./kubernetes.sh
```

## Helmfile initialisieren
```bash
helmfile init
```
## Helmfile anpassen
In der Datei [environments/default/values.yaml](environments/default/values.yaml) die Domäne hinterlegen welche bei ngrok beantragt wurde. Zum Beispiel: ```he-man.ngrok-free.app```

## Helmfile ausführen
```bash
helmfile sync
```

Da der ngrok Operator erst gestartet wird wenn alle Pods laufen, kann das deployment beim ersten Aufrug bis zu 3 Minuten dauern.

### n8n aufrufen
Die von ngrok bereitgestellte Domäne im Brwoser aufrufen

https://he-man.ngrok-free.app


