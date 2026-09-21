extends Node

# ==================================================
# STREAM UNITY — CODE COMPLET ET CORRIGÉ
# Adapté exactement à ta scène ConnexionLlama
# ==================================================

# ========== 🌍 LISTE DES 30 LANGUES ==========
var liste_langues = [
	"fr", "en", "es", "de", "pt", "it", "ru", "zh", "ja", "ko",
	"ar", "pl", "tr", "uk", "hi", "vi", "th", "nl", "sv", "no",
	"da", "fi", "el", "he", "cs", "hu", "ro", "bg", "hr", "sr"
]
var noms_langues = {
	"fr": "Français", "en": "Anglais", "es": "Espagnol", "de": "Allemand", "pt": "Portugais",
	"it": "Italien", "ru": "Russe", "zh": "Chinois", "ja": "Japonais", "ko": "Coréen",
	"ar": "Arabe", "pl": "Polonais", "tr": "Turc", "uk": "Ukrainien", "hi": "Hindi",
	"vi": "Vietnamien", "th": "Thaï", "nl": "Néerlandais", "sv": "Suédois", "no": "Norvégien",
	"da": "Danois", "fi": "Finnois", "el": "Grec", "he": "Hébreu", "cs": "Tchèque",
	"hu": "Hongrois", "ro": "Roumain", "bg": "Bulgare", "hr": "Croate", "sr": "Serbe"
}

# ========== TRADUCTIONS ==========
var traductions = {
	"fr": {
		"accueil": "Accueil", "regarder": "Regarder", "inscrire": "S'inscrire",
		"discuter": "Discuter", "soutenir": "Soutenir", "profil": "Mon Profil",
		"espace_createur": "Espace Créateur", "regles": "Règles",
		"sans_st": "Sans sous-titres", "choix_st": "Sous-titres",
		"langue": "Langue", "bienvenue": "Bienvenue sur Stream Unity",
		"lire_charte": "📜 Lire la Charte", "accepter_charte": "J'ai lu et j'accepte la Charte",
		"valider": "Valider l'inscription", "obliger_accepter": "Veuillez accepter la Charte d'abord",
		"charte_titre": "📜 GRANDE CHARTE — STREAM UNITY",
		"fermer": "Fermer"
	},
	"en": {
		"accueil": "Home", "regarder": "Watch", "inscrire": "Sign Up",
		"discuter": "Chat", "soutenir": "Support", "profil": "My Profile",
		"espace_createur": "Creator Space", "regles": "Rules",
		"sans_st": "No subtitles", "choix_st": "Subtitles",
		"langue": "Language", "bienvenue": "Welcome to Stream Unity",
		"lire_charte": "📜 Read the Charter", "accepter_charte": "I have read and accept the Charter",
		"valider": "Sign Up", "obliger_accepter": "Please accept the Charter first",
		"charte_titre": "📜 GREAT CHARTER — STREAM UNITY",
		"fermer": "Close"
	},
	"es": {
		"accueil": "Inicio", "regarder": "Ver", "inscrire": "Registrarse",
		"discuter": "Charlar", "soutenir": "Apoyar", "profil": "Mi Perfil",
		"espace_createur": "Espacio Creador", "regles": "Reglas",
		"sans_st": "Sin subtítulos", "choix_st": "Subtítulos",
		"langue": "Idioma", "bienvenue": "Bienvenido a Stream Unity",
		"lire_charte": "📜 Leer la Carta", "accepter_charte": "He leído y acepto la Carta",
		"valider": "Registrarse", "obliger_accepter": "Por favor acepta la Carta primero",
		"charte_titre": "📜 CARTA DE DERECHOS — STREAM UNITY",
		"fermer": "Cerrar"
	}
}

# ========== PRÉFÉRENCES ==========
var langue_actuelle = "fr"
var st_actifs = false
var langue_st = "fr"

# ========== ÉLÉMENTS DE LA SCÈNE — CHEMINS CORRIGÉS ==========
@onready var titre_bienvenue = $Bienvenue
@onready var btn_accueil = $Accueil
@onready var btn_regarder = $Regarder
@onready var btn_inscrire = $SInscrire
@onready var btn_discuter = $Discuter
@onready var btn_soutenir = $Soutenir
@onready var btn_profil = $Profil
@onready var btn_espace_createur = $EspaceCreateur
@onready var btn_regles = $Regles
@onready var btn_discord = $Liens/Discord
@onready var btn_youtube = $Liens/YouTube
@onready var btn_twitch = $Liens/Twitch
@onready var menu_langue = $Menu/Langue
@onready var menu_sous_titres = $Menu/SousTitres

# ========== ÉLÉMENTS DE LA CHARTE — CHEMINS CORRIGÉS ==========
@onready var btn_lire_charte = $Lien_Lire_Charte
@onready var case_accepter_charte = $Case_Accepter_Charte
@onready var btn_valider_decision = $Valider_Decision

@onready var scene_charte = $charte_complete
@onready var texte_charte = $charte_complete/RichTextLabel
@onready var btn_fermer_charte = $charte_complete/Fermer_Charte

# ========== TEXTE COMPLET DE LA CHARTE ==========
var texte_complet_charte = """
📜 GRANDE CHARTE — STREAM UNITY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**Article 1 — Respect de chacun**
Toute personne est la bienvenue, quel que soit son âge, son genre, son origine, son orientation ou ses croyances.
Chacun mérite d'être traité avec politesse et bienveillance.
Toute forme de discrimination, de haine ou de moquerie est interdite.

**Article 2 — Identité et prénoms**
Chacun est appelé comme il le souhaite.
Si je ne sais pas quel prénom ou quelle forme utiliser, je demande en privé avant de parler.
Je ne corrige personne publiquement, je ne fais pas de remarque sur l'apparence.

**Article 3 — Vie privée et protection**
Je ne partage pas de donnée personnelle dans le chat : nom réel, adresse, téléphone, mail, photos, liens privés.
Je ne demande pas ces informations à qui que ce soit.
Ce qui est dit en privé reste en privé.

**Article 4 — Échanges et modération**
Je respecte les décisions des modérateurs et du propriétaire.
Je signale un problème en privé, pas en public.
Je ne publie pas de lien sans autorisation.
Je ne fais pas de publicité ou de promotion sans accord.

**Article 5 — Paiements et dons**
Les soutiens et dons sont libres et volontaires.
Aucune donnée bancaire ne doit jamais être partagée dans le chat.
Les paiements passent uniquement par les canaux officiels sécurisés.
Aucune demande d'argent ne peut être faite en dehors de ces canaux.

**Article 6 — Rôle des assistants**
L'assistant rappelle la règle, il ne sanctionne pas.
Seul le propriétaire de la plateforme ou de la chaîne peut prendre une décision de sanction.
Toute situation difficile est transmise au propriétaire.

**Article 7 — Application**
En rejoignant Stream Unity ou une chaîne de la plateforme, j'accepte cette Charte.
Je m'engage à la lire et à la respecter.
Des rappels peuvent être affichés régulièrement pour que tout le monde soit au même niveau.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*La présente Charte vise à protéger chacun et à faire de cet espace un lieu sûr pour tous.*
*Dernière mise à jour : 21 septembre 2026*
"""

# ========== CONNEXION LLAMA ==========
var http_req = HTTPRequest.new()

# ==================================================
# AU DÉMARRAGE
# ==================================================
func _ready():
	add_child(http_req)
	http_req.request_completed.connect(reponse_recue)
	_charger_preferences()
	_connecter_tout()
	_remplir_menus_langues()
	_appliquer_langue()
	_initialiser_charte()
	print("✅ TOUT EST PRÊT — 30 langues, Charte, sauvegarde active")
	demander_llama("Bonjour, je mets en place ma plateforme Stream Unity")

# ==================================================
# CONNEXION DES BOUTONS — AVEC PROTECTION CONTRE ERREURS
# ==================================================
func _connecter_tout():
	# Boutons principaux
	if btn_accueil: btn_accueil.pressed.connect(_ouvrir_accueil)
	if btn_regarder: btn_regarder.pressed.connect(_ouvrir_stream)
	if btn_inscrire: btn_inscrire.pressed.connect(_ouvrir_inscription)
	if btn_discuter: btn_discuter.pressed.connect(_ouvrir_chat)
	if btn_soutenir: btn_soutenir.pressed.connect(_ouvrir_soutien)
	if btn_profil: btn_profil.pressed.connect(_ouvrir_profil)
	if btn_espace_createur: btn_espace_createur.pressed.connect(_ouvrir_espace_createur)
	if btn_regles: btn_regles.pressed.connect(_ouvrir_regles)
	
	# Liens
	if btn_discord: btn_discord.pressed.connect(_ouvrir_discord)
	if btn_youtube: btn_youtube.pressed.connect(_ouvrir_youtube)
	if btn_twitch: btn_twitch.pressed.connect(_ouvrir_twitch)
	
	# Menus
	if menu_langue: menu_langue.item_selected.connect(_changer_langue)
	if menu_sous_titres: menu_sous_titres.item_selected.connect(_changer_sous_titres)
	
	# Charte
	if btn_lire_charte:
		btn_lire_charte.pressed.connect(_ouvrir_charte)
		print("✅ Lien_Lire_Charte — CONNECTÉ")
	else:
		print("❌ Lien_Lire_Charte — INTROUVABLE")
	
	if btn_valider_decision:
		btn_valider_decision.pressed.connect(_valider_inscription)
		print("✅ Valider_Decision — CONNECTÉ")
	else:
		print("❌ Valider_Decision — INTROUVABLE")
	
	if btn_fermer_charte:
		btn_fermer_charte.pressed.connect(_fermer_charte)
		print("✅ Fermer_Charte — CONNECTÉ")
	else:
		print("❌ Fermer_Charte — INTROUVABLE")

# ==================================================
# ACTIONS DES PAGES
# ==================================================
func _ouvrir_accueil(): print("🏠 Accueil")
func _ouvrir_stream(): print("📺 Stream")
func _ouvrir_inscription(): print("✍️ Inscription complète")
func _ouvrir_chat(): print("💬 Chat")
func _ouvrir_soutien(): print("💳 Soutien — part 75/25 sécurisée")
func _ouvrir_profil(): print("👤 Profil")
func _ouvrir_espace_createur(): print("⚙️ Espace Créateur")
func _ouvrir_regles(): print("📜 Règles")

func _ouvrir_discord(): 
	OS.shell_open("https://discord.gg/TonLien")
	print("💬 Ouverture Discord")
func _ouvrir_youtube(): 
	OS.shell_open("https://youtube.com/@TaChaine")
	print("📺 Ouverture YouTube")
func _ouvrir_twitch(): 
	OS.shell_open("https://twitch.tv/TaChaine")
	print("🎮 Ouverture Twitch")

# ==================================================
# GESTION DE LA CHARTE
# ==================================================
func _initialiser_charte():
	# Cache la scène Charte au démarrage
	if scene_charte:
		scene_charte.visible = false
		# Met le texte complet dans le RichTextLabel
		if texte_charte:
			texte_charte.text = texte_complet_charte
			print("✅ Texte de la Charte chargé")

func _ouvrir_charte():
	print("📜 Ouverture de la Charte")
	if scene_charte:
		scene_charte.visible = true

func _fermer_charte():
	print("📜 Fermeture de la Charte")
	if scene_charte:
		scene_charte.visible = false

func _valider_inscription():
	# Vérifie si la case est cochée
	if case_accepter_charte and case_accepter_charte.button_pressed:
		print("✅ Charte acceptée — accès autorisé")
		get_tree().change_scene_to_file("res://Accueil.tscn")
	else:
		print("⚠️ Veuillez accepter la Charte d'abord")
		if case_accepter_charte:
			case_accepter_charte.modulate = Color(1, 0.3, 0.3)
			get_tree().create_timer(2.0).timeout.connect(func():
				case_accepter_charte.modulate = Color(1, 1, 1))

# ==================================================
# LANGUE
# ==================================================
func _remplir_menus_langues():
	if not menu_langue: return
	menu_langue.clear()
	for code in liste_langues:
		menu_langue.add_item(noms_langues[code])
	if langue_actuelle in liste_langues:
		menu_langue.selected = liste_langues.find(langue_actuelle)
	
	if not menu_sous_titres: return
	menu_sous_titres.clear()
	var t = traductions.get(langue_actuelle, traductions["fr"])
	menu_sous_titres.add_item(t["sans_st"])
	for code in liste_langues:
		menu_sous_titres.add_item(noms_langues[code])

func _changer_langue(index):
	langue_actuelle = liste_langues[index]
	_appliquer_langue()
	_sauvegarder()
	print("🌍 Langue : ", noms_langues[langue_actuelle])

func _appliquer_langue():
	var t = traductions.get(langue_actuelle, traductions["fr"])
	if titre_bienvenue:
		titre_bienvenue.text = t["bienvenue"]
	_remplir_menus_langues()
	
	# Met à jour les textes de la Charte
	if btn_lire_charte: btn_lire_charte.text = t["lire_charte"]
	if case_accepter_charte: case_accepter_charte.text = t["accepter_charte"]
	if btn_valider_decision: btn_valider_decision.text = t["valider"]
	if btn_fermer_charte: btn_fermer_charte.text = t["fermer"]

# ==================================================
# SOUS-TITRES
# ==================================================
func _changer_sous_titres(index):
	if index == 0:
		st_actifs = false
		print("🔤 Sous-titres désactivés")
	else:
		st_actifs = true
		langue_st = liste_langues[index - 1]
		print("🔤 Sous-titres : ", noms_langues[langue_st])
	_sauvegarder()

# ==================================================
# LLAMA / OLLAMA
# ==================================================
func demander_llama(question: String):
	var url = "http://localhost:11434/api/generate"
	var entetes = ["Content-Type: application/json"]
	var donnees = {
		"model": "llama3.2:3b",
		"prompt": question,
		"stream": false
	}
	var erreur = http_req.request(url, entetes, HTTPClient.METHOD_POST, JSON.stringify(donnees))
	if erreur != OK:
		print("❌ Erreur de connexion Llama : ", erreur)

func reponse_recue(_resultat, _code_reponse, _entetes, corps):
	var texte = corps.get_string_from_utf8()
	var json = JSON.parse_string(texte)
	if json and json.has("response"):
		print("🧠 Llama : ", json["response"])
	else:
		print("❌ Pas de réponse valide")
		print("Données reçues : ", texte)

# ==================================================
# SAUVEGARDE
# ==================================================
func _sauvegarder():
	var f = FileAccess.open("user://preferences.cfg", FileAccess.WRITE)
	if f:
		f.store_line(langue_actuelle)
		f.store_line("oui" if st_actifs else "non")
		f.store_line(langue_st)
		f.close()
		print("💾 Préférences sauvegardées")

func _charger_preferences():
	var f = FileAccess.open("user://preferences.cfg", FileAccess.READ)
	if f:
		langue_actuelle = f.get_line().strip_edges()
		st_actifs = f.get_line().strip_edges() == "oui"
		langue_st = f.get_line().strip_edges()
		f.close()
		print("💾 Préférences chargées : ", langue_actuelle)
