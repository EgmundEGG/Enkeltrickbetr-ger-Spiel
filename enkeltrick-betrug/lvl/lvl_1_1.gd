extends Resource

var agenten_text_unten: Array[String] = [
	"Achtung, ein neues Szenario auf Ihrem Smartphone!",
	"Wieder meldet sich jemand mit einer neuen Nummer und gibt sich als Ihr Enkel aus. Das Handy wurde angeblich gestohlen.",
	"Ist das wieder ein Betrugsversuch oder diesmal wirklich Ihr Enkel?",
	"Gehen Sie ins Gespräch, stellen Sie clevere Fragen und entscheiden Sie gemeinsam mit Ihren Beratern."
]

var agenten_text_oben: Array[String] = [
	"Hallo Berater! Vorsicht, dieser Fall hat einen Twist.",
	"Nicht jede neue Nummer ist automatisch ein Betrug. Ein echtes Familienmitglied würde es verstehen, wenn man misstrauisch ist.",
	"Prüfen Sie den Chat: Geht der Absender auf Nachfragen ein? Bietet er von sich aus an, dass man seine Eltern anrufen soll?",
	"Helfen Sie dem Hauptspieler, echte Kontaktversuche von Betrug zu unterscheiden, ohne grundlos Kontakte zu blockieren!"
]

var dialog = {
	
"start": {
	"text": "Hallo Oma ❤️ ich bin's. Das ist meine neue Nummer.",
	"options": [
		{"text": "Wer ist da?", "next": "wer"},
		{"text": "Das ist bestimmt Betrug!", "next": "lose"},
		{"text": "Warum neue Nummer?", "next": "nummer"}
	]
},

"wer": {
	"text": "Dein Enkel 😊 Mein Handy wurde letzte Woche gestohlen.",
	"options": [
		{"text": "Welcher Enkel?", "next": "identitaet1"},
		{"text": "Oh nein!", "next": "nummer"},
		{"text": "Ich rufe dich an.", "next": "telefon1"}
	]
},

"nummer": {
	"text": "Ich habe gestern ein neues Handy bekommen und meine Kontakte verloren. Deshalb schreibe ich vielen Leuten gerade meine neue Nummer.",
	"options": [
		{"text": "Was gibt's denn?", "next": "anlass1"},
		{"text": "Das klingt verdächtig.", "next": "zweifel1"},
		{"text": "Kann das jemand bestätigen?", "next": "bestaetigung1"}
	]
},

"identitaet1": {
	"text": "Ich bin Lukas 😊 Wir haben doch letzte Woche zusammen deinen Apfelkuchen gegessen.",
	"options": [
		{"text": "Stimmt, Lukas.", "next": "anlass1"},
		{"text": "Das könnte jeder sagen.", "next": "identitaet2"},
		{"text": "Ich prüfe das erst.", "next": "bestaetigung1"}
	]
},

"identitaet2": {
	"text": "Kein Problem 😊 Ich verstehe das. Ich war auch mit dir auf dem Stadtfest und habe den grünen Pullover getragen, den du mir geschenkt hast.",
	"options": [
		{"text": "Das stimmt tatsächlich.", "next": "anlass1"},
		{"text": "Ich möchte trotzdem sicher sein.", "next": "bestaetigung1"},
		{"text": "Nein, das glaube ich nicht.", "next": "lose"}
	]
},

"telefon1": {
	"text": "Klar 😊 Du kannst mich gerne anrufen. Ich bin gerade im Bus und antworte vielleicht nicht sofort.",
	"options": [
		{"text": "Dann rufe ich später an.", "next": "telefon2"},
		{"text": "Okay, worum geht es?", "next": "anlass1"},
		{"text": "Das klingt nach einer Ausrede.", "next": "lose"}
	]
},

"telefon2": {
	"text": "Kein Problem. Wenn ich zuhause bin, gehe ich ran. Frag sonst auch gerne meine Eltern nach meiner neuen Nummer.",
	"options": [
		{"text": "Gut, das mache ich.", "next": "win"},
		{"text": "Erzähl erst einmal weiter.", "next": "anlass1"},
		{"text": "Nein, ich glaube dir nicht.", "next": "lose"}
	]
},

"anlass1": {
	"text": "Eigentlich wollte ich nur fragen, ob du am Wochenende Zeit hast 😊",
	"options": [
		{"text": "Wofür denn?", "next": "anlass2"},
		{"text": "Natürlich.", "next": "anlass2"},
		{"text": "Du willst bestimmt Geld.", "next": "lose"}
	]
},

"anlass2": {
	"text": "Mama hat erzählt, dass du Hilfe im Garten brauchst. Ich könnte am Samstag vorbeikommen.",
	"options": [
		{"text": "Das wäre nett.", "next": "garten1"},
		{"text": "Woher weißt du das?", "next": "garten2"},
		{"text": "Das glaube ich nicht.", "next": "lose"}
	]
},

"garten1": {
	"text": "Super 😊 Dann bringe ich auch den Akkuschrauber mit, den Opa mir geliehen hat.",
	"options": [
		{"text": "Den hat er dir wirklich geliehen.", "next": "vertrauen1"},
		{"text": "Ich frage trotzdem erst nach.", "next": "bestaetigung1"},
		{"text": "Das ist bestimmt erfunden.", "next": "lose"}
	]
},

"garten2": {
	"text": "Mama hat gestern beim Abendessen davon erzählt 😊 Deshalb dachte ich, ich kann helfen.",
	"options": [
		{"text": "Das klingt plausibel.", "next": "vertrauen1"},
		{"text": "Ich frage deine Eltern trotzdem.", "next": "bestaetigung1"},
		{"text": "Nein, das glaube ich nicht.", "next": "lose"}
	]
},

"vertrauen1": {
	"text": "Übrigens, falls du unsicher bist: Frag einfach Mama oder ruf mich direkt an. Das ist völlig okay 😊",
	"options": [
		{"text": "Danke für dein Verständnis.", "next": "vertrauen2"},
		{"text": "Dann frage ich kurz nach.", "next": "win"},
		{"text": "Nein, ich blockiere die Nummer.", "next": "lose"}
	]
},

"vertrauen2": {
	"text": "Kein Problem. Man muss heutzutage vorsichtig sein. Ich wollte eigentlich nur Bescheid geben, damit du meine neue Nummer speichern kannst.",
	"options": [
		{"text": "Okay, ich speichere die Nummer.", "next": "leichtsinnig"},
		{"text": "Ich überprüfe die Nummer zuerst.", "next": "win"},
		{"text": "Ich glaube trotzdem an Betrug.", "next": "lose"}
	]
},

"zweifel1": {
	"text": "Verstehe ich vollkommen 😊 Deshalb kannst du gerne nachfragen oder mich anrufen.",
	"options": [
		{"text": "Das klingt fair.", "next": "anlass1"},
		{"text": "Ich frage deine Eltern.", "next": "win"},
		{"text": "Nein, das ist sicher Betrug.", "next": "lose"}
	]
},

"bestaetigung1": {
	"text": "Natürlich 😊 Meine Eltern haben meine neue Nummer schon. Frag sie einfach kurz.",
	"options": [
		{"text": "Dann mache ich das.", "next": "bestaetigung2"},
		{"text": "Okay, erzähl weiter.", "next": "anlass1"},
		{"text": "Nein, ich blockiere dich.", "next": "lose"}
	]
},

"bestaetigung2": {
	"text": "Ein paar Minuten später bestätigst du die Nummer bei seinen Eltern. Die Nummer gehört tatsächlich deinem Enkel.",
	"options": [
		{"text": "Gut, dann speichere ich sie.", "next": "win"},
		{"text": "Jetzt bin ich beruhigt.", "next": "win"}
	]
},

"win": {
	"text": "✅ GUT GEMACHT!\n\nDies war kein Betrug.\n\nDu hast die Situation vernünftig geprüft. Der Absender hatte kein Interesse an Geld, Zugangsdaten oder Geheimhaltung.\n\nStatt Druck auszuüben, bot er mehrere Möglichkeiten zur Überprüfung seiner Identität an.",
	"options": []
},

"leichtsinnig": {
	"text": "⚠️ LEICHTSINNIG!\n\nEs war zwar wirklich dein Enkel, aber du hast die Nummer am Ende einfach ohne Prüfung gespeichert. Bei einem echten Betrüger wäre das sehr gefährlich gewesen!",
	"options": []
},

"lose": {
	"text": "❌ FALSCHE ENTSCHEIDUNG\n\nDies war kein Betrug.\n\nVorsicht ist wichtig, aber nicht jede neue Nummer ist automatisch ein Enkeltrick.\n\nEin wichtiges Merkmal echter Kontakte ist, dass sie Nachfragen akzeptieren und ihre Identität überprüfen lassen.",
	"options": []
}
}

var auswertung_unten = {
	"win": [
		"Klasse! Sie haben den Kontakt ruhig und systematisch überprüft.",
		"Genau so sollte man bei neuen Nummern vorgehen, selbst wenn es kein Betrug ist."
	],
	"leichtsinnig": [
		"Glück gehabt! Es war diesmal tatsächlich Ihr echter Enkel.",
		"Aber Sie haben die neue Nummer am Ende einfach akzeptiert, ohne sie z.B. bei den Eltern zu überprüfen.",
		"Genau diese Gutgläubigkeit nutzen Enkeltrick-Betrüger gnadenlos aus. Seien Sie beim nächsten Mal kritischer!"
	],
	"lose": [
		"Schade, Sie haben einen echten Kontakt blockiert.",
		"Ein gesundes Misstrauen ist super, aber Sie sollten Familienmitgliedern die Chance geben, ihre Identität zu beweisen (z.B. durch einen Anruf)."
	]
}

var auswertung_oben = {
	"win": [
		"Tolles Teamwork! Sie haben dem Spieler geholfen, die Identität vernünftig zu klären."
	],
	"leichtsinnig": [
		"Das war etwas leichtsinnig beraten!",
		"Die Gruppe hat die neue Nummer blind akzeptiert, ohne kritische Nachfragen zu stellen. Das hätte auch ein Betrüger sein können."
	],
	"lose": [
		"Da haben Sie den Spieler am Handy wohl etwas zu misstrauisch gemacht. Das war kein Betrüger."
	]
}
