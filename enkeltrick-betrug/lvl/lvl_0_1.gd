extends Resource

var agenten_text_unten: Array[String] = [
	"Ein neuer Fall wartet auf Sie! Sie erhalten eine E-Mail von einem angeblichen Kontakt.",
	"Die Person behauptet, mit Ihnen auf einem Workshop gewesen zu sein, und schickt einen Link für die Unterlagen.",
	"Waren Sie wirklich auf diesem Workshop? Lesen Sie die E-Mail laut vor und prüfen Sie gemeinsam, ob Sie den Link öffnen sollten."
]

var agenten_text_oben: Array[String] = [
	"Aufgepasst, Berater-Team! Dieser Fall sieht nach Social Engineering aus.",
	"Betrüger nutzen oft vage Informationen (z. B. 'dritte Reihe am Fenster'), um künstliches Vertrauen aufzubauen.",
	"Achten Sie darauf: Baut der Absender Zeitdruck auf, damit ein unbekannter Link angeklickt wird?",
	"Hören Sie genau zu und warnen Sie den Spieler am Handy, bevor er unüberlegt auf den Link drückt!"
]

var dialog = {

"start": {
	"text": "📩 E-Mail eingegangen:\n\nBetreff: „Datei vom Workshop“\n\nHallo,\nwir hatten letzte Woche gemeinsam am Workshop teilgenommen.\nIch habe die Unterlagen zusammengestellt und dir hier bereitgestellt:\n\n👉 workshop-dateien24.com\n\nSchau bitte kurz drüber und gib mir Feedback.",
	"options": [
		{"text": "Dateien blind herunterladen", "next": "fail"},
		{"text": "Welcher Workshop?", "next": "step1"},
		{"text": "E-Mail sofort ignorieren", "next": "paranoid"}
	]
},

"step1": {
	"text": "📩 Antwort:\n\nDer Workshop zur digitalen Zusammenarbeit.\nDu saßt in der dritten Reihe am Fenster.\n\nDie Unterlagen findest du weiterhin hier:\n👉 workshop-dateien24.com",
	"options": [
		{"text": "Dann melde ich mich dort an", "next": "fail"},
		{"text": "Wer organisiert den Workshop?", "next": "step2"},
		{"text": "Link prüfen, aber nicht anmelden", "next": "lucky"}
	]
},

"step2": {
	"text": "📩 Antwort:\n\nDas lief über einen externen Dienstleister.\nDen Namen weiß ich gerade nicht mehr.\n\nKannst du bitte schnell auf den Link schauen? Ich brauche heute noch Rückmeldung.",
	"options": [
		{"text": "Okay, ich logge mich ein", "next": "fail"},
		{"text": "Warum die Eile?", "next": "step3"},
		{"text": "Ohne weitere Infos öffne ich nichts", "next": "win"}
	]
},

"step3": {
	"text": "📩 Antwort:\n\nDie Freigabe läuft heute ab und ich muss die Teilnehmerliste abschließen.\nDu musst dich nur kurz anmelden, dann sehe ich dein Feedback.",
	"options": [
		{"text": "Anmelden und prüfen", "next": "fail"},
		{"text": "Offizielle Kontaktinformationen verlangen", "next": "win"},
		{"text": "Link öffnen, aber Anmeldung abbrechen", "next": "lucky"}
	]
},

"win": {
	"text": "✅ RICHTIGE ENTSCHEIDUNG\n\nDies war ein Betrugsversuch.\n\nDer Absender nutzte vage Erinnerungen, erzeugte Zeitdruck und wollte dich auf eine unbekannte Webseite locken.\nDu hast kritisch nachgefragt und keine sensiblen Daten preisgegeben.",
	"options": []
},

"paranoid": {
	"text": "🛡️ SICHER, ABER UNAUFGEKLÄRT\n\nDu hast die Mail sofort ignoriert. Du bist zwar sicher, aber hast nicht versucht herauszufinden, ob es ein echter Kollege war.",
	"options": []
},

"lucky": {
	"text": "⚠️ GLÜCK GEHABT\n\nDu hast den Link geöffnet, dich aber im letzten Moment nicht angemeldet. Das hätte böse enden können, da manchmal schon der Klick gefährlich ist!",
	"options": []
},

"fail": {
	"text": "❌ FALSCHE ENTSCHEIDUNG\n\nDies war ein Betrugsversuch.\n\nDer Betrüger nutzte Social Engineering:\n• allgemeine Aussagen statt konkreter Informationen\n• Aufbau von Vertrauen durch scheinbare Erinnerungen\n• Zeitdruck\n• unbekannter Link\n\nDu hast dem Betrüger deine Daten übergeben.",
	"options": []
}
}

var auswertung_unten = {
	"win": [
		"Hervorragend! Sie haben die fehlenden Details hinterfragt.",
		"Als der Absender nur vage blieb, haben Sie den Kontakt beendet. Perfekt gehandelt!"
	],
	"lucky": [
		"Das war haarscharf! Sie haben den Link angeklickt, aber zum Glück keine Daten eingegeben.",
		"Bedenken Sie: Bei gezielten Angriffen reicht manchmal schon der Klick auf den Link, um Schadsoftware zu installieren."
	],
	"paranoid": [
		"Sie haben die E-Mail sofort ignoriert. Das ist absolut sicher.",
		"Im Berufsalltag wäre ein kurzes, kritisches Nachfragen jedoch vielleicht etwas vernünftiger gewesen, falls es doch ein echter Kontakt war."
	],
	"fail": [
		"Leider falsch! Sie haben sich auf der Seite angemeldet und dem Betrüger vertraut.",
		"Die vagen Erinnerungen ('dritte Reihe am Fenster') waren ein gezielter psychologischer Trick."
	]
}

var auswertung_oben = {
	"win": [
		"Super Teamwork! Sie haben den Social-Engineering-Trick schnell entlarvt.",
		"Vage Behauptungen bauen künstliches Vertrauen auf. Sie haben das durchschaut."
	],
	"lucky": [
		"Ihr Mitspieler hat einfach auf den Link gedrückt!",
		"Da müssen Sie als Berater viel schneller eingreifen. Ein unbedachter Klick kann im Firmennetzwerk fatal sein."
	],
	"paranoid": [
		"Sicher ist sicher! Aber als Berater-Team hätten Sie dem Spieler raten können, zumindest einmal kritisch nachzufragen."
	],
	"fail": [
		"Der Betrug war erfolgreich. Der Spieler hat seine Daten eingegeben.",
		"Achten Sie beim nächsten Mal auf fehlende Namen und vage Beschreibungen, um solche Mails zu entlarven!"
	]
}
