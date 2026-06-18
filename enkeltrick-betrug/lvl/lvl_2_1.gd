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
		{"text": "Ich ignoriere die Nachricht sofort", "next": "ignored"},
		{"text": "Ich öffne den Link", "next": "step_link1"}
	]
},

"step1": {
	"text": "📨 Paketstatus:\n\nSendungsnummer: DE-8827-PX19\n\nIhr Paket befindet sich im regionalen Verteilzentrum.\n\nFür die erneute Zustellung müssen Ihre Daten bestätigt werden.",
	"options": [
		{"text": "Das klingt plausibel", "next": "step2"},
		{"text": "Ich prüfe die Sendungsnummer selbst auf DHL.de", "next": "pro_win"},
		{"text": "Ich klicke auf den Link", "next": "step_link1"}
	]
},

"step2": {
	"text": "⚠️ Hinweis:\n\nWenn keine Bestätigung erfolgt, wird das Paket an den Absender zurückgeschickt.\n\nBearbeitungsfrist: 12 Stunden.",
	"options": [
		{"text": "Ich will das Paket nicht verlieren", "next": "step3"},
		{"text": "Das setzt mich zu sehr unter Druck", "next": "step_skepsis1"},
		{"text": "Ich gehe auf die echte DHL Webseite", "next": "pro_win"}
	]
},

"step3": {
	"text": "📦 Zusatzinformation:\n\nÜber 90% der Kunden bestätigen ihre Daten online.\n\nDie Bearbeitung dauert weniger als eine Minute.",
	"options": [
		{"text": "Dann mache ich das schnell per Link", "next": "step_link1"},
		{"text": "Das überzeugt mich nicht", "next": "step_skepsis1"},
		{"text": "Ich rufe den Paketdienst an", "next": "pro_win"}
	]
},

"step_skepsis1": {
	"text": "Du bemerkst, dass die Nachricht sehr dringend formuliert ist.\n\nAußerdem wird kein konkreter Paketdienst genannt.",
	"options": [
		{"text": "Das ist verdächtig", "next": "step_skepsis2"},
		{"text": "Vielleicht ist das normal", "next": "step_link1"},
		{"text": "Ich suche die Sendung selbst über den Browser", "next": "pro_win"}
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
		{"text": "Abbrechen und Seite schließen", "next": "lucky"},
		{"text": "Warum werden diese Daten benötigt?", "next": "step_link_warn"}
	]
},

"step_link_warn": {
	"text": "Systemmeldung:\n\nDie Daten werden zur Identitätsprüfung benötigt.\n\nBitte fahren Sie fort.",
	"options": [
		{"text": "Okay", "next": "step_link2"},
		{"text": "Abbrechen und Seite schließen", "next": "lucky"}
	]
},

"step_link2": {
	"text": "✅ Daten bestätigt.\n\nFür die erneute Zustellung fällt eine Bearbeitungsgebühr von 1,49€ an.",
	"options": [
		{"text": "Das ist wenig Geld", "next": "step_payment"},
		{"text": "Jetzt wird es verdächtig, ich breche ab", "next": "daten_weg"},
		{"text": "Weiter zur Zahlung", "next": "step_payment"}
	]
},

"step_payment": {
	"text": "💳 Zahlungsseite\n\nBitte geben Sie Ihre Kreditkarteninformationen ein:\n\n• Kartennummer\n• Ablaufdatum\n• Sicherheitscode",
	"options": [
		{"text": "Kartendaten eingeben", "next": "step_final"},
		{"text": "Abbrechen", "next": "daten_weg"}
	]
},

"step_final": {
	"text": "⏳ Zahlung wird verarbeitet...\n\nBitte bestätigen Sie zusätzlich den Sicherheitscode Ihrer Bank.",
	"options": [
		{"text": "Code eingeben", "next": "lose"},
		{"text": "Abbrechen", "next": "daten_weg"}
	]
},

"lose": {
	"text": "❌ BETRUG ERFOLGREICH\n\nDu hast persönliche Daten und Zahlungsinformationen auf einer gefälschten Webseite eingegeben.\n\nDie Betrüger können nun deine Daten missbrauchen oder Geld abbuchen.",
	"options": []
},

"daten_weg": {
	"text": "⚠️ DATEN GELEAKT\n\nDu hast im letzten Moment vor der Überweisung abgebrochen! Das Geld ist sicher, aber die Betrüger haben jetzt deinen Namen, deine Adresse und deine Telefonnummer.",
	"options": []
},

"lucky": {
	"text": "⚠️ GLÜCK GEHABT\n\nDu hast den Vorgang rechtzeitig abgebrochen und keine Daten eingegeben. Das Anklicken des Links war jedoch bereits ein Risiko.",
	"options": []
},

"win": {
	"text": "✅ BETRUG ERKANNT\n\nSehr gut!\n\nDu hast typische Phishing-Merkmale erkannt und den Vorgang selbständig gestoppt, bevor es gefährlich wurde.",
	"options": []
},

"ignored": {
	"text": "🛡️ IGNORIERT\n\nDu hast die Nachricht einfach ignoriert. Das ist sicher, aber du hast auch nicht überprüft, ob es vielleicht doch ein echtes Paket war.",
	"options": []
},

"pro_win": {
	"text": "⭐ PROFI-VERHALTEN\n\nGenial! Statt auf den Link in der SMS zu klicken, hast du die echte Website geöffnet oder angerufen. Das ist der ultimative Schutz vor Phishing!",
	"options": []
}
}

var auswertung_unten = {
	"win": [
		"Sehr gut! Sie sind auf den falschen Paketdienst nicht hereingefallen.",
		"Kleine Gebühren und hoher Zeitdruck sind absolute Warnsignale. Sie haben Ihre Daten erfolgreich beschützt!"
	],
	"lucky": [
		"Puh, das war knapp!",
		"Sie haben die Website im letzten Moment verlassen und kein Geld verloren. Aber Vorsicht:",
		"Allein das Anklicken von Links aus solchen SMS kann gefährliche Viren auf Ihr Smartphone laden!"
	],
	"daten_weg": [
		"Teilweiser Erfolg, aber mit Folgen!",
		"Sie haben zwar kein Geld überwiesen, aber Ihre Adress- und Kontaktdaten auf einer Betrugsseite eingegeben.",
		"Rechnen Sie in nächster Zeit mit mehr Spam oder Phishing-Anrufen!"
	],
	"lose": [
		"Leider war das ein Betrug. Sie haben Ihre Zahlungsdaten an Betrüger gegeben.",
		"Der angebliche Paketdienst hat Sie mit künstlichem Zeitdruck in die Falle gelockt.",
		"Geben Sie niemals Bankdaten über Links in solchen SMS oder Mails ein!"
	],
	"ignored": [
		"Sicher ist sicher! Sie haben die Nachricht gelöscht.",
		"Noch besser wäre es gewesen, die Sendungsnummer kurz in der offiziellen DHL-App zu prüfen, um 100% sicher zu sein."
	],
	"pro_win": [
		"Herausragend! Sie haben die goldene Regel befolgt:",
		"Niemals Links in Mails klicken, sondern die offizielle Website manuell im Browser öffnen. Besser kann man es nicht machen!"
	]
}

var auswertung_oben = {
	"win": [
		"Exzellente Arbeit vom Berater-Team! Sie haben den Phishing-Versuch schnell enttarnt.",
		"Der gefälschte Link und der künstliche Druck wurden von Ihnen richtig als Betrug gedeutet."
	],
	"lucky": [
		"Da haben Sie nochmal Glück gehabt!",
		"Ihr Mitspieler am Handy hat den gefährlichen Link angeklickt. Da hätten Sie als Berater lauter warnen müssen!"
	],
	"daten_weg": [
		"Achtung, Datenverlust!",
		"Sie haben rechtzeitig vor der Bezahlung eingegriffen, aber die Adressdaten des Spielers sind jetzt in den Händen der Betrüger."
	],
	"lose": [
		"Die Daten wurden gestohlen. Der Phishing-Angriff war leider erfolgreich.",
		"Greifen Sie beim nächsten Mal sofort ein, wenn das Handy nach Kreditkartendaten fragt!"
	],
	"ignored": [
		"Eine entspannte Lösung des Teams.",
		"Das Ignorieren von Spam ist völlig legitim, auch wenn das Überprüfen der Echtheit dabei etwas zu kurz kam."
	],
	"pro_win": [
		"Eine Meisterleistung der Beratung!",
		"Sie haben den Spieler angeleitet, den Link zu ignorieren und stattdessen die offizielle Route zu gehen. Das ist IT-Sicherheit in Perfektion."
	]
}
