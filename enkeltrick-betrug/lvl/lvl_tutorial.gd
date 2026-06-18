extends Resource

# Texte für Handy-Person
var agenten_text_unten: Array[String] = [
	"Hallo! Ich bin Ihr digitaler Berater. Schön, dass Sie hier sind.",
	"Vor Ihnen sehen Sie gleich ein simuliertes Smartphone.",
	"Ihre Aufgabe: Lesen Sie eingehende Nachrichten laut vor und entscheiden Sie, wie Sie antworten möchten.",
	"Aber Vorsicht: Nicht jede Nachricht ist echt! Ihre Mitspieler auf der anderen Seite haben wichtige Hinweise für Sie.",
	"Sprechen Sie sich gut mit Ihrem Team ab und treffen Sie gemeinsam eine Entscheidung. Viel Erfolg!"
]

# Texte für "Berater"
var agenten_text_oben: Array[String] = [
	"Hallo Berater-Team! Ihre Rolle ist für den Erfolg der Gruppe extrem wichtig.",
	"Der Spieler auf der anderen Seite bedient gleich das Handy. Er wird Ihnen die Nachrichten vorlesen.",
	"Nutzen Sie Ihr Wissen und die Hinweise, um verdächtige Auffälligkeiten in den Nachrichten zu erkennen.",
	"Hören Sie gut zu, vergleichen Sie die Nachrichten und beraten Sie den Hauptspieler bei seiner Entscheidung!"
]

var dialog = {
	"start": {
		"text": "System-Nachricht:\n\nDies ist ein kurzer Übungs-Chat. Hier lernen Sie die Steuerung kennen.\n\nBitte tippen Sie unten rechts auf die Schaltfläche 'Ich verstehe', um fortzufahren.",
		"options": [
			{"text": "Ich verstehe", "next": "win"}
		]
	},
	
	"win": {
		"text": "✅ WUNDERBAR!\n\nSie haben die Steuerung erfolgreich getestet.\nDie Gruppe kann nun über das Menü mit dem ersten echten Fall beginnen.",
		"options": []
	}
}

var auswertung_unten = {
	"win": [
		"Perfekt! Sie haben das Tutorial erfolgreich abgeschlossen.",
		"Sie wissen nun, wie die Steuerung funktioniert. Kehren Sie ins Menü zurück und starten Sie Ihren ersten Fall."
	]
}

var auswertung_oben = {
	"win": [
		"Klasse, das Tutorial ist geschafft!",
		"Machen Sie sich bereit für die erste echte Ermittlung. Hören Sie genau zu und unterstützen Sie Ihren Mitspieler. Viel Spaß!"
	]
}
