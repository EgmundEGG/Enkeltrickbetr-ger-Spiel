extends Resource


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
		{"text": "Ich glaube dir nicht.", "next": "win"},
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
		{"text": "Ich prüfe das erst.", "next": "win"}
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
		{"text": "Das klingt nach Betrug.", "next": "win"},
		{"text": "Ich komme vorbei.", "next": "enttarnt"}
	]
},

"fail_path": {
	"text": "Danke dir ❤️ ich schicke dir gleich die Kontodaten",
	"options": [
		{"text": "Alles klar.", "next": "lose"},
		{"text": "Moment mal...", "next": "enttarnt"},
		{"text": "Ich überprüfe das.", "next": "win"}
	]
},

"enttarnt": {
	"text": "Ähm... ich muss später schreiben...",
	"options": [
		{"text": "Das ist Betrug!", "next": "win"},
		{"text": "Ich melde das.", "next": "win"},
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
}
}
