extends Resource

var agenten_text_unten: Array[String] = [
	"Ein neuer Tag, eine neue Benachrichtigung. Ihr Smartphone leuchtet auf.",
	"Der DHL-Paketservice meldet sich bei Ihnen. Angeblich hängt ein Paket von Ihnen beim Zoll fest und kann nicht zugestellt werden.",
	"Erwarten Sie überhaupt ein Paket? Schauen Sie sich die Forderungen genau an, bevor Sie voreilig handeln."
]

var agenten_text_oben: Array[String] = [
	"Die Szene wechselt. Wir haben es hier mit einer angeblichen Paket-Zustellung zu tun.",
	"Betrüger nutzen oft das DHL-Logo, um Vertrauen zu wecken. Achten Sie gleich auf zwei Dinge:",
	"Gibt es einen verdächtigen Link? Und wird mit künstlichem Zeitdruck gearbeitet, um eine kleine Gebühr zu erpressen? Beraten Sie Ihren Mitspieler!"
]

var dialog = {

"start": {
	"text": "📦 DHL Paketservice:\nIhr Paket konnte nicht zugestellt werden.\nGrund: fehlende Zollfreigabe.\nBitte bestätigen Sie Ihre Daten oder zahlen Sie 2,99€, um die Zustellung fortzusetzen.",
	"options": [
		{"text": "Ich habe nichts bestellt", "next": "step1"},
		{"text": "Ich zahle die 2,99€", "next": "lose"},
		{"text": "Das klingt komisch", "next": "step_skepsis"}
	]
},

"step1": {
	"text": "📨 Systemmeldung:\nEin Paket wurde an Ihre Adresse gesendet.\nAbsender: Amazon Logistics.\nTracking: DE-7392-AX91\nStatus: Zollprüfung erforderlich.",
	"options": [
		{"text": "Ich erwarte kein Paket", "next": "step2"},
		{"text": "Vielleicht habe ich etwas vergessen", "next": "step2"},
		{"text": "Ich prüfe das bei DHL", "next": "pro_win"}
	]
},

"step2": {
	"text": "⚠️ Wichtige Information:\nOhne Zahlung von 2,99€ wird Ihr Paket in 24 Stunden zurückgesendet oder vernichtet.\nSie könnten Ihre Lieferung dauerhaft verlieren.",
	"options": [
		{"text": "Das ist ja knapp", "next": "step3"},
		{"text": "Ich will mein Paket nicht verlieren", "next": "step3"},
		{"text": "Ich ignoriere das", "next": "ignored"}
	]
},

"step3": {
	"text": "📦 DHL Hinweis:\nViele Kunden verlieren ihre Pakete, weil sie die kleine Zollgebühr nicht rechtzeitig bezahlen.\nDurchschnittlicher Verlust: 48€ Warenwert.",
	"options": [
		{"text": "Das klingt seriös", "next": "step4"},
		{"text": "Das ist bestimmt Betrug", "next": "win"},
		{"text": "Ich klicke auf den Link", "next": "lose"}
	]
},

"step_skepsis": {
	"text": "Die Nachricht wirkt offiziell.\nDHL-Logo ist vorhanden.\nLink: http://dhl-paketservice-verification.eu\nAlles sieht sehr echt aus.",
	"options": [
		{"text": "Ich öffne den Link", "next": "step_link"},
		{"text": "Die URL wirkt falsch", "next": "win"},
		{"text": "Ich gehe auf die echte DHL-Seite", "next": "pro_win"}
	]
},

"step_link": {
	"text": "🌐 Verifizierungsseite:\nBitte geben Sie zur Bestätigung ein:\n- Name\n- Adresse\n- Telefonnummer\n- Bankdaten (für 2,99€ Zollgebühr)",
	"options": [
		{"text": "Daten eingeben", "next": "lose"},
		{"text": "Abbrechen", "next": "lucky"}
	]
},

"step4": {
	"text": "⏰ LETZTE WARNUNG:\nIhr Paket wird in 15 Minuten automatisch storniert.\nZusätzliche Rücksendekosten: 19,99€.",
	"options": [
		{"text": "Ich zahle sofort", "next": "lose"},
		{"text": "Ich rufe DHL direkt an", "next": "pro_win"},
		{"text": "Ich breche ab", "next": "win"}
	]
},

"lose": {
	"text": "❌ BETRUG ERFOLGREICH\n\nDu hast die Zahlung bestätigt.\nDas Geld ist weg und dein Paket existiert nicht.\n\nDas war ein klassischer Paketbetrug.",
	"options": []
},

"win": {
	"text": "✅ BETRUG ERKANNT\n\nSehr gut!\nDu hast typische Warnzeichen erkannt:\n- Zeitdruck\n- kleine Gebühr\n- unbekannter Link\n\nDu bist sicher geblieben.",
	"options": []
},

"lucky": {
	"text": "⚠️ GLÜCK GEHABT\n\nDu hast den Vorgang noch rechtzeitig abgebrochen!\nDas Geld ist sicher, aber das Anklicken des Links war extrem riskant. So können Betrüger Schadsoftware auf dein Smartphone laden.",
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
		"Sie haben die Datenabfrage im letzten Moment abgebrochen und kein Geld verloren. Aber Vorsicht:",
		"Allein das Anklicken von Links aus solchen SMS kann gefährliche Viren auf Ihr Smartphone laden!"
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
		"Ihr Mitspieler am Handy hat den gefährlichen Link angeklickt. Da hätten Sie als Berater lauter und früher warnen müssen!"
	],
	"lose": [
		"Die Daten wurden gestohlen. Der Phishing-Angriff war leider erfolgreich.",
		"Sie müssen beim nächsten Mal sofort eingreifen, wenn das Handy nach Kreditkartendaten oder Passwörtern fragt!"
	],
	"ignored": [
		"Eine entspannte Lösung des Teams.",
		"Das Ignorieren von Spam ist völlig legitim, auch wenn die tatsächliche Begründung dafür kurz ausfällt."
	],
	"pro_win": [
		"Eine Meisterleistung der Beratung!",
		"Sie haben den Spieler angeleitet, den Link zu ignorieren und stattdessen die offizielle Route zu gehen. Das ist IT-Sicherheit in Perfektion. Hut ab!"
	]
}
