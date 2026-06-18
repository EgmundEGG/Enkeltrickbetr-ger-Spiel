extends Resource

var agenten_text_unten: Array[String] = [
	"Es ist ein ruhiger Nachmittag. Sie sitzen gemütlich bei einer Tasse Kaffee, als plötzlich Ihr Handy vibriert.",
	"Eine Nachricht von einer unbekannten Nummer taucht auf dem Display auf. Jemand behauptet, Ihr Enkel zu sein.",
	"Lesen Sie die Nachrichten laut vor und entscheiden Sie gemeinsam mit Ihren Beratern, wie Sie reagieren."
]

var agenten_text_oben: Array[String] = [
	"Ein neuer Fall startet. Der Spieler am Handy wird gleich von einer völlig fremden Nummer kontaktiert.",
	"Die Geschichte beginnt mit einem angeblich kaputten Handy und einer neuen Nummer. Ein klassischer Einstieg.",
	"Hören Sie gut zu. Sobald von einer dringenden Überweisung oder einem Notfall die Rede ist, müssen Sie sofort Alarm schlagen!"
]

var dialog = {

"start": {
	"text": "Hallo Oma ❤️ ich bin's... ich habe eine neue Nummer.",
	"options": [
		{"text": "Wer ist da?", "next": "wer"},
		{"text": "Oh hallo mein Schatz!", "next": "fail_early"},
		{"text": "Warum neue Nummer?", "next": "nummer"}
	]
},

"wer": {
	"text": "Ich bin dein Enkel 😊 mein Handy ist kaputt gegangen...",
	"options": [
		{"text": "Welcher Enkel?", "next": "druck1"},
		{"text": "Oh nein!", "next": "fail_early"},
		{"text": "Ich rufe dich kurz an.", "next": "good_call"}
	]
},

"nummer": {
	"text": "Mein altes Handy ist ins Wasser gefallen 😭 das ist jetzt meine neue Nummer",
	"options": [
		{"text": "Okay, was gibt's?", "next": "story"},
		{"text": "Ich glaube dir nicht.", "next": "paranoid"},
		{"text": "Ich frage deine Eltern.", "next": "win"}
	]
},

"druck1": {
	"text": "Na ich bin's doch 😅 dein Enkel... ich brauche kurz deine Hilfe",
	"options": [
		{"text": "Wie heißt du?", "next": "enttarnt"},
		{"text": "Was ist los?", "next": "story"},
		{"text": "Das ist mir suspekt.", "next": "win"}
	]
},

"story": {
	"text": "Ich habe gerade ein Problem... ich muss dringend eine Rechnung bezahlen 😓",
	"options": [
		{"text": "Was für eine Rechnung?", "next": "rechnung"},
		{"text": "Ich kann helfen.", "next": "fail_path"},
		{"text": "Warum ich?", "next": "manipulation"}
	]
},

"rechnung": {
	"text": "Es geht um 1850€... ich kann gerade nicht auf mein Konto zugreifen 😭",
	"options": [
		{"text": "Das ist viel Geld...", "next": "druck2"},
		{"text": "Ich überweise sofort.", "next": "lose"},
		{"text": "Ich prüfe das erst.", "next": "lucky"}
	]
},

"manipulation": {
	"text": "Du bist die Einzige, die mir jetzt helfen kann 😢 bitte sag niemandem etwas",
	"options": [
		{"text": "Warum geheim?", "next": "enttarnt"},
		{"text": "Okay ich helfe dir.", "next": "fail_path"},
		{"text": "Ich rufe deine Eltern an.", "next": "win"}
	]
},

"druck2": {
	"text": "Bitte Oma es ist dringend!! Ich bekomme sonst große Probleme 😭",
	"options": [
		{"text": "Okay ich zahle.", "next": "lose"},
		{"text": "Das klingt nach Betrug.", "next": "lucky"},
		{"text": "Ich komme vorbei.", "next": "enttarnt"}
	]
},

"fail_path": {
	"text": "Danke dir ❤️ ich schicke dir gleich die Kontodaten",
	"options": [
		{"text": "Alles klar.", "next": "lose"},
		{"text": "Moment mal...", "next": "lucky"},
		{"text": "Ich überprüfe das.", "next": "win"}
	]
},

"enttarnt": {
	"text": "Ähm... ich muss später schreiben...",
	"options": [
		{"text": "Das ist Betrug!", "next": "win"},
		{"text": "Ich melde das bei der Polizei.", "next": "reported"},
		{"text": "Keine Antwort mehr.", "next": "win"}
	]
},

"good_call": {
	"text": "Ähm... ich kann gerade nicht telefonieren 😅",
	"options": [
		{"text": "Dann später.", "next": "win"},
		{"text": "Komisch...", "next": "win"},
		{"text": "Das ist Betrug.", "next": "win"}
	]
},

"fail_early": {
	"text": "Oh super dass du antwortest ❤️ ich brauche dringend Hilfe!",
	"options": [
		{"text": "Natürlich!", "next": "lose"},
		{"text": "Warte mal...", "next": "story"},
		{"text": "Ich überprüfe das.", "next": "win"}
	]
},

"lose": {
	"text": "❌ Du hast Geld überwiesen... das war ein Betrug!",
	"options": []
},

"win": {
	"text": "✅ Gut gemacht! Du hast den Betrug erkannt.",
	"options": []
},

"lucky": {
	"text": "⚠️ GLÜCK GEHABT!\n\nDu hast die Überweisung im allerletzten Moment noch abgebrochen! Das war ein Betrüger. Du hast ihm anfangs viel zu schnell vertraut, aber zum Glück dein Geld behalten.",
	"options": []
},

"paranoid": {
	"text": "🛡️ SEHR VORSICHTIG\n\nDu hast direkt bei der ersten Nachricht abgeblockt. Du bist zwar sicher, hast dem Betrüger aber keine Chance gegeben, sich selbst zu verraten.",
	"options": []
},

"reported": {
	"text": "⭐ PERFEKT GELÖST!\n\nDu hast den Betrüger nicht nur entlarvt, sondern direkt signalisiert, dass du die Chatverläufe der Polizei meldest. Besser geht es nicht!",
	"options": []
}
}

var auswertung_unten = {
	"win": [
		"Hervorragend! Sie haben den Betrug rechtzeitig erkannt.",
		"Sie haben kritisch nachgefragt und keine Überweisung getätigt. Genau so schützt man sich!"
	],
	"lucky": [
		"Puh, das war denkbar knapp!",
		"Sie haben den Betrug erst im allerletzten Moment erkannt und fast Geld überwiesen.",
		"Lektion für die Zukunft: Vertrauen Sie unbekannten Nummern niemals so lange. Klären Sie die Identität sofort am Anfang!"
	],
	"lose": [
		"Das Spiel ist vorbei. Leider haben Sie das Geld überwiesen.",
		"Der Betrüger hat Zeitdruck aufgebaut ('Ich bekomme sonst große Probleme') und Sie manipuliert.",
		"Merken Sie sich: Bei Geldforderungen über Messenger immer erst persönlich anrufen!"
	],
	"paranoid": [
		"Sie haben den Kontakt direkt nach der ersten Nachricht beendet.",
		"Damit sind Sie absolut sicher, aber es hätte auch wirklich Ihr Enkel sein können.",
		"Ein kurzer Anruf zur Sicherheit schadet nie!"
	],
	"reported": [
		"Absolut vorbildlich! Das war eine Lehrbuch-Reaktion.",
		"Sie haben den Betrug entlarvt und der Hinweis auf die Polizei ist die perfekte Reaktion, um Betrüger abzuschrecken."
	]
}

var auswertung_oben = {
	"win": [
		"Klasse Beratung! Ihr Team hat die richtigen Schlüsse gezogen.",
		"Sie haben rechtzeitig erkannt, dass die angebliche Notsituation nur erfunden war."
	],
	"lucky": [
		"Da haben Sie als Team nochmal riesiges Glück gehabt!",
		"Ihr Mitspieler am Handy war extrem leichtgläubig und stand kurz vor der Überweisung.",
		"Sie müssen als Berater viel lauter und früher Alarm schlagen, wenn Unbekannte plötzlich von Geld schreiben!"
	],
	"lose": [
		"Der Betrug war erfolgreich. Das Geld ist weg.",
		"Beim nächsten Mal müssen Sie den Spieler am Handy lauter und früher warnen, wenn plötzlich von Geld die Rede ist!"
	],
	"paranoid": [
		"Ihr Team geht auf Nummer sicher. Niemand kommt hier durch!",
		"Denken Sie aber daran, dass ein paar Kontrollfragen am Anfang noch kein Sicherheitsrisiko sind."
	],
	"reported": [
		"Großartiges Teamwork!",
		"Sie haben die Ruhe bewahrt, Beweise im Chat provoziert und dann genau den richtigen Schritt gewählt."
	]
}
