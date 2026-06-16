extends Resource


var dialog = {

"start": {
	"text": "📩 E-Mail eingegangen:\n\nBetreff: „Datei vom Workshop“\n\nHallo,\nwir hatten letzte Woche gemeinsam am Workshop teilgenommen.\nIch habe die Unterlagen zusammengestellt und dir hier bereitgestellt:\n\n👉 workshop-dateien24.com\n\nSchau bitte kurz drüber und gib mir Feedback.",
	"options": [
		{"text": "Link öffnen", "next": "fail"},
		{"text": "Welcher Workshop?", "next": "step1"},
		{"text": "E-Mail ignorieren", "next": "win"}
	]
},

"step1": {
	"text": "📩 Antwort:\n\nDer Workshop zur digitalen Zusammenarbeit.\nDu saßt in der dritten Reihe am Fenster.\n\nDie Unterlagen findest du weiterhin hier:\n👉 workshop-dateien24.com",
	"options": [
		{"text": "Jetzt erinnere ich mich", "next": "fail"},
		{"text": "Wer organisiert den Workshop?", "next": "step2"},
		{"text": "Ich öffne den Link trotzdem", "next": "fail"}
	]
},

"step2": {
	"text": "📩 Antwort:\n\nDas lief über einen externen Dienstleister.\nDen Namen weiß ich gerade nicht mehr.\n\nKannst du bitte schnell auf den Link schauen? Ich brauche heute noch Rückmeldung.",
	"options": [
		{"text": "Okay, ich klicke", "next": "fail"},
		{"text": "Warum die Eile?", "next": "step3"},
		{"text": "Ohne weitere Infos öffne ich nichts", "next": "win"}
	]
},

"step3": {
	"text": "📩 Antwort:\n\nDie Freigabe läuft heute ab und ich muss die Teilnehmerliste abschließen.\nDu musst dich nur kurz anmelden, dann sehe ich dein Feedback.",
	"options": [
		{"text": "Anmelden und prüfen", "next": "fail"},
		{"text": "Offizielle Kontaktinformationen verlangen", "next": "win"},
		{"text": "Link öffnen und später entscheiden", "next": "fail"}
	]
},

"win": {
	"text": "✅ RICHTIGE ENTSCHEIDUNG\n\nDies war ein Betrugsversuch.\n\nDer Absender nutzte vage Erinnerungen, erzeugte Zeitdruck und wollte dich auf eine unbekannte Webseite locken.\nDu hast kritisch nachgefragt und keine sensiblen Daten preisgegeben.",
	"options": []
},

"fail": {
	"text": "❌ FALSCHE ENTSCHEIDUNG\n\nDies war ein Betrugsversuch.\n\nDer Betrüger nutzte Social Engineering:\n• allgemeine Aussagen statt konkreter Informationen\n• Aufbau von Vertrauen durch scheinbare Erinnerungen\n• Zeitdruck\n• unbekannter Link\n\nDu hättest den Link nicht öffnen und keine Anmeldedaten eingeben sollen.",
	"options": []
}
}