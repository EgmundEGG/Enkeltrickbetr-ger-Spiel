extends Resource

var agenten_text_unten: Array[String] = [
	"Ein neuer Fall! Sie erhalten eine dringende Nachricht von einem Paketdienst.",
	"Angeblich fehlen Adressdaten für eine Zustellung und Sie müssen sofort handeln.",
	"Bevor Sie auf irgendwelche Links tippen, lesen Sie die Nachricht laut vor und schauen Sie, was Ihr Berater-Team dazu sagt."
]

var agenten_text_oben: Array[String] = [
	"Berater-Team, Ihr Einsatz! Hier haben wir es mit einem klassischen Paket-Phishing-Versuch zu tun.",
	"Achten Sie auf die roten Flaggen: Fehlt der konkrete Name des Paketdienstes? Wird starker Zeitdruck aufgebaut (z.B. 'nur noch 12 Stunden')?",
	"Und ganz wichtig: Ist der Link in der Nachricht verdächtig?",
	"Warnen Sie den Hauptspieler unbedingt davor, auf der verlinkten Seite persönliche Daten oder Kreditkarteninfos einzugeben!"
]

var dialog = {

"start": {
	"text": "📦 Paketdienst:\n\nIhr Paket konnte heute nicht zugestellt werden.\n\nGrund: Unvollständige Adressdaten.\n\nBitte wählen Sie innerhalb von 12 Stunden eine neue Zustelloption aus.",
	"options": [
		{"text": "Ich erwarte tatsächlich ein Paket", "next": "step1"},
		{"text": "Ich ignoriere die Nachricht", "next": "win"},
		{"text": "Ich öffne den Link", "next": "step_link1"}
	]
},

"step1": {
	"text": "📨 Paketstatus:\n\nSendungsnummer: DE-8827-PX19\n\nIhr Paket befindet sich im regionalen Verteilzentrum.\n\nFür die erneute Zustellung müssen Ihre Daten bestätigt werden.",
	"options": [
		{"text": "Das klingt plausibel", "next": "step2"},
		{"text": "Ich prüfe die Sendungsnummer selbst", "next": "win"},
		{"text": "Ich klicke auf den Link", "next": "step_link1"}
	]
},

"step2": {
	"text": "⚠️ Hinweis:\n\nWenn keine Bestätigung erfolgt, wird das Paket an den Absender zurückgeschickt.\n\nBearbeitungsfrist: 12 Stunden.",
	"options": [
		{"text": "Ich will das Paket nicht verlieren", "next": "step3"},
		{"text": "Das setzt mich unter Druck", "next": "step_skepsis1"},
		{"text": "Ich gehe auf die echte Webseite", "next": "win"}
	]
},

"step3": {
	"text": "📦 Zusatzinformation:\n\nÜber 90% der Kunden bestätigen ihre Daten online.\n\nDie Bearbeitung dauert weniger als eine Minute.",
	"options": [
		{"text": "Dann mache ich das schnell", "next": "step_link1"},
		{"text": "Das überzeugt mich nicht", "next": "step_skepsis1"},
		{"text": "Ich rufe den Paketdienst an", "next": "win"}
	]
},

"step_skepsis1": {
	"text": "Du bemerkst, dass die Nachricht sehr dringend formuliert ist.\n\nAußerdem wird kein konkreter Paketdienst genannt.",
	"options": [
		{"text": "Das ist verdächtig", "next": "step_skepsis2"},
		{"text": "Vielleicht ist das normal", "next": "step_link1"},
		{"text": "Ich suche die Sendung selbst", "next": "win"}
	]
},

"step_skepsis2": {
	"text": "Die Nachricht enthält diesen Link:\n\nhttps://paket-neuzustellung-verifikation.com\n\nDer Link sieht offiziell aus, gehört aber nicht zu einem bekannten Paketdienst.",
	"options": [
		{"text": "Link trotzdem öffnen", "next": "step_link1"},
		{"text": "URL prüfen", "next": "step_url"},
		{"text": "Nachricht löschen", "next": "win"}
	]
},

"step_url": {
	"text": "Nach genauer Prüfung fällt auf:\n\n• ungewöhnliche Domain\n• kein Firmenname\n• zusätzliche Wörter wie 'verifikation'\n\nDies sind typische Merkmale von Phishing-Webseiten.",
	"options": [
		{"text": "Dann war es Betrug", "next": "win"},
		{"text": "Vielleicht trotzdem echt", "next": "step_link1"}
	]
},

"step_link1": {
	"text": "🌐 Zustellportal\n\nBitte bestätigen Sie:\n\n• Name\n• Adresse\n• Telefonnummer\n\nDanach können Sie eine neue Zustellung auswählen.",
	"options": [
		{"text": "Daten eingeben", "next": "step_link2"},
		{"text": "Abbrechen", "next": "win"},
		{"text": "Warum werden diese Daten benötigt?", "next": "step_link_warn"}
	]
},

"step_link_warn": {
	"text": "Systemmeldung:\n\nDie Daten werden zur Identitätsprüfung benötigt.\n\nBitte fahren Sie fort.",
	"options": [
		{"text": "Okay", "next": "step_link2"},
		{"text": "Das beantwortet meine Frage nicht", "next": "win"}
	]
},

"step_link2": {
	"text": "✅ Daten bestätigt.\n\nFür die erneute Zustellung fällt eine Bearbeitungsgebühr von 1,49€ an.",
	"options": [
		{"text": "Das ist wenig Geld", "next": "step_payment"},
		{"text": "Jetzt wird es verdächtig", "next": "win"},
		{"text": "Weiter", "next": "step_payment"}
	]
},

"step_payment": {
	"text": "💳 Zahlungsseite\n\nBitte geben Sie Ihre Kreditkarteninformationen ein:\n\n• Kartennummer\n• Ablaufdatum\n• Sicherheitscode",
	"options": [
		{"text": "Kartendaten eingeben", "next": "step_final"},
		{"text": "Abbrechen", "next": "win"}
	]
},

"step_final": {
	"text": "⏳ Zahlung wird verarbeitet...\n\nBitte bestätigen Sie zusätzlich den Sicherheitscode Ihrer Bank.",
	"options": [
		{"text": "Code eingeben", "next": "lose"},
		{"text": "Abbrechen", "next": "win"}
	]
},

"lose": {
	"text": "❌ BETRUG ERFOLGREICH\n\nDu hast persönliche Daten und Zahlungsinformationen auf einer gefälschten Webseite eingegeben.\n\nDie Betrüger können nun deine Daten missbrauchen oder Geld abbuchen.\n\nWarnzeichen waren:\n• unbekannter Paketdienst\n• künstlicher Zeitdruck\n• verdächtige URL\n• zusätzliche Gebühren\n• Abfrage sensibler Zahlungsdaten",
	"options": []
},

"win": {
	"text": "✅ BETRUG ERKANNT\n\nSehr gut!\n\nDu hast typische Phishing-Merkmale erkannt:\n• Zeitdruck\n• unklare Absenderangaben\n• verdächtige Links\n• Forderung persönlicher Daten\n• Zahlungsaufforderung\n\nStatt auf den Link zu klicken hast du die Informationen unabhängig überprüft.",
	"options": []
}
}
