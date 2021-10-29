extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_Button_Voltar_button_up():
	$SFX.stream = load("res://sfx/menu creditos idioma instrucoes.ogg") #carrega o efeito sonoro
	$SFX.play() #toca o efeito sonoro
	get_tree().change_scene("res://scenes/Menu.tscn") #muda a cena


func _on_Button_Jogar_button_up():
	get_tree().change_scene("res://scenes/ViewportTriplo.tscn")


func _on_Button_Creditos_button_up():
	$SFX.stream = load("res://sfx/menu creditos idioma instrucoes.ogg")
	$SFX.play()
	get_tree().change_scene("res://scenes/Créditos.tscn")


func _on_Button_Instrucoes_button_up():
	$SFX.stream = load("res://sfx/menu creditos idioma instrucoes.ogg")
	$SFX.play()
	get_tree().change_scene("res://scenes/Instruções.tscn")
