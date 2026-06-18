extends Resource

var agenten_text_unten: Array[String] = [
	"Sie checken gerade Ihre E-Mails. Eine neue Nachricht im Posteingang wartet auf Sie.",
	"Jemand schreibt Sie wegen eines Termins von gestern an und bittet um Unterlagen. Die Person hat jedoch vergessen, ihren Namen zu nennen.",
	"Handelt es sich um einen Betrugsversuch oder nur um einen unorganisierten Kollegen? Finden Sie es durch clevere Nachfragen heraus."
]

var agenten_text_oben: Array[String] = [
	"Achtung, Berater-Team! Ein kleiner Twist für diesen Fall.",
	"Nicht jede unklare Nachricht ist sofort ein Betrug. Manchmal tippen Leute einfach zu schnell und vergessen, sich richtig vorzustellen.",
	"Helfen Sie dem Spieler am Handy dabei, durch geschickte Rückfragen die Identität des Absenders zu klären, ohne einen echten Kontakt vor den Kopf zu stoßen."
]

var dialog = {

"start": {
	"text": "📩 E-Mail eingegangen:\n\nBetreff: „Kurz wegen gestern“\n\nHallo,\nich wollte kurz nach dem Termin gestern nachfragen.\nHast du die Unterlagen noch? Falls ja, könntest du sie mir nochmal schicken?\n\nDanke dir.",
	"options": [
		{"text": "Welche Unterlagen?", "next": "step1"},
		{"text": "Ich kenne dich nicht", "next": "abrupt"},
		{"text": "Ja ich schicke sie dir", "next": "lucky"}
	]
},

"step1": {
	"text": "📩 Antwort:\n\nOh sorry, ich hätte mich besser vorstellen sollen.\nWir haben uns gestern im Gebäude 3 bei der Gruppenarbeit gesehen.\nDu hattest die Präsentation mit den Diagrammen dabei.",
	"options": [
		{"text": "Ah jetzt erinnere ich mich", "next": "step2"},
		{"text": "Ich war dort nicht", "next": "step_wrong"},
		{"text": "Welche Gruppe war das?", "next": "step2"}
	]
},

"step2": {
	"text": "📩 Antwort:\n\nEs ging um das Projekt zur Datenauswertung.\nDu warst in der Gruppe mit dem roten Badge.\n\nFalls es einfacher ist, ich kann dir die Datei nochmal schicken.",
	"options": [
		{"text": "Okay schick sie mir", "next": "win"},
		{"text": "Ich bin mir unsicher", "next": "step3"},
		{"text": "Ich kenne das nicht", "next": "fail"}
	]
},

"step3": {
	"text": "📩 Antwort:\n\nKein Problem 👍\nIch kann dir auch kurz erklären worum es ging, wenn du willst.",
	"options": [
		{"text": "Ja gerne", "next": "win"},
		{"text": "Doch alles gut, ich erinnere mich", "next": "win"},
		{"text": "Ich breche den Kontakt ab", "next": "ignorant"}
	]
},

"step_wrong": {
	"text": "📩 Antwort:\n\nAh okay, dann habe ich dich verwechselt.\nSorry für die Störung!",
	"options": [
		{"text": "Alles gut", "next": "win"},
		{"text": "Kein Problem", "next": "win"}
	]
},

"win": {
	"text": "✅ RICHTIG ENTSCHEIDUNG\n\nDu hast korrekt erkannt, dass dies ein echter Kontakt war.\nDu hast die Kommunikation sinnvoll angenommen und geklärt.",
	"options": []
},

"fail": {
	"text": "❌ FALSCHE ENTSCHEIDUNG\n\nDu hast einen echten Kontakt abgeblockt oder abgelehnt.\n\nEs war KEIN Betrug, nur eine normale, wenn auch unklare Nachricht.",
	"options": []
},

"lucky": {
	"text": "⚠️ GLÜCK GEHABT!\n\nEs war tatsächlich ein echter Kollege. Aber einfach blind Dateien zu verschicken, war extrem leichtsinnig!",
	"options": []
},

"abrupt": {
	"text": "🛡️ ETWAS ZU HART\n\nDu hast den Kontakt sofort abgeblockt. Das ist sicher, aber im Berufsalltag oft unhöflich, da es ein echter Kollege war.",
	"options": []
},

"ignorant": {
	"text": "❌ UNHÖFLICH\n\nDer Kollege wollte dir gerade erklären, worum es geht, und du hast einfach den Kontakt abgebrochen. Da warst du zu misstrauisch!",
	"options": []
}
}

#Agent-Auswertung
var auswertung_unten = {
	"win": [
		"Gut reagiert! Sie haben durch clevere Nachfragen herausgefunden, wer da schreibt.",
		"Es war tatsächlich nur ein unorganisierter Kollege. Sie haben den Kontakt erfolgreich geklärt."
	],
	"lucky": [ 
		"Halt, Moment mal! Sie haben die Dateien einfach blind verschickt, ohne zu wissen, wer am anderen Ende ist?",
		"Sie hatten Glück, dass es wirklich ein Kollege war. Bei einem Betrüger wären Ihre Daten jetzt weg!",
		"Lektion für die Zukunft: Erst kritisch nachfragen, dann sensible Daten verschicken!"
	],
	"fail": [
		"Das war leider eine Fehlentscheidung. Sie haben einen echten Kollegen blockiert.",
		"Nicht jede kurze Nachricht ist Betrug. Achten Sie darauf, ob die Person auf Ihre Nachfragen sachlich eingeht."
	],
	"abrupt": [
		"Das war eine sehr kalte Reaktion. Sie haben sofort geblockt.",
		"Sicherheitsbewusstsein ist gut, aber ein einfaches 'Wer ist da?' hätte den Kollegen nicht direkt vor den Kopf gestoßen."
	],
	"ignorant": [
		"Schade, der Kollege wollte gerade das Missverständnis aufklären und Sie haben abgebrochen.",
		"Manchmal lohnt es sich, ein paar Textzeilen mehr zu investieren, bevor man den Stecker zieht."
	]
}

var auswertung_oben = {
	"win": [
		"Klasse Beratung! Sie haben richtig erkannt, dass hier kein klassisches Betrugsmuster vorlag.",
		"Ihre Tipps haben geholfen, den echten Kontakt zu verifizieren."
	],
	"lucky": [ 
		"Da hat Ihr Mitspieler am Handy aber extrem leichtsinnig gehandelt!",
		"Sie hätten ihn lauter warnen müssen, nicht einfach blind Dateien an Unbekannte zu schicken. Da hatten Sie als Gruppe großes Glück."
	],
	"fail": [
		"Hier waren Sie als Berater-Team vielleicht etwas zu misstrauisch.",
		"Der Absender hat keine verdächtigen Links geschickt oder Geld gefordert. Er war einfach nur unhöflich."
	],
	"abrupt": [
		"Da haben Sie den Spieler am Handy wohl etwas zu paranoid gemacht.",
		"Raten Sie beim nächsten Mal dazu, zumindest die Identität zu erfragen, bevor man den Kontakt abbricht."
	],
	"ignorant": [
		"Da haben Sie als Berater-Team überreagiert.",
		"Der Chat-Partner hat Hilfe angeboten, um die Situation zu erklären. Das ist kein typisches Betrüger-Verhalten."
	]
}
