extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pagina_instrucoes = 1 #variável com valor inicial


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func pagina_posterior_instrucoes():
	$SFX.stream = load("res://sfx/menu creditos idioma instrucoes.ogg")
	$SFX.play()
	if pagina_instrucoes >= 10: #valor máximo da página 10
		pagina_instrucoes = 10
	else:
		pagina_instrucoes += 1
	match pagina_instrucoes: # pega o texto da página de instruções
		1:
			$Label_Instrucoes.set_text("Clique em um bloco para selecioná-lo. Clique no bloco selecionado para desselecioná-lo.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_selecao.webm")
			$VideoPlayer.play()
		2:
			$Label_Instrucoes.set_text("A multiplicidade de um bloco é quantos anéis aparecem nele.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_multiplicidade.webm")
			$VideoPlayer.play()
		3:
			$Label_Instrucoes.set_text("Quando você seleciona um bloco, o número de anéis selecionados é somado com a multiplicidade do bloco.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_soma.webm")
			$VideoPlayer.play()
		4:
			$Label_Instrucoes.set_text("Quando você desseleciona um bloco, o número de anéis selecionados é subtraído com a multiplicidade do bloco.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_diferenca.webm")
			$VideoPlayer.play()
		5:
			$Label_Instrucoes.set_text("Você precisa selecionar blocos em que a soma dos anéis selecionados seja igual ao número de anéis requerido no canto superior esquerdo.")
			if $VideoPlayer.stream != load("res://instructions_video/bloco_eliminado.webm"):
				$VideoPlayer.stream = load("res://instructions_video/bloco_eliminado.webm")
				$VideoPlayer.play()
		6:
			$Label_Instrucoes.set_text("Quando essa soma corresponder à requisição, todos os blocos selecionados serão eliminados.")
			if $VideoPlayer.stream != load("res://instructions_video/bloco_eliminado.webm"):
				$VideoPlayer.stream = load("res://instructions_video/bloco_eliminado.webm")
				$VideoPlayer.play()
		7:
			$Label_Instrucoes.set_text("Quando eliminar todos os blocos da tela, você passará de fase, tornando o jogo um pouco mais difícil.")
			if $VideoPlayer.stream != load("res://instructions_video/bloco_eliminado.webm"):
				$VideoPlayer.stream = load("res://instructions_video/bloco_eliminado.webm")
				$VideoPlayer.play()
		8:
			$Label_Instrucoes.set_text("Fique atento a número par, ímpar, primo e composto.")
			if $VideoPlayer.stream != load("res://instructions_video/bloco_eliminado.webm"):
				$VideoPlayer.stream = load("res://instructions_video/bloco_eliminado.webm")
				$VideoPlayer.play()
		9:
			$Label_Instrucoes.set_text("Também fique atento às frases de resultado, que indicarão se o número de anéis selecionados é < (menor que), = (igual a) ou > (maior que) o número de anéis requerido.")
			if $VideoPlayer.stream != load("res://instructions_video/bloco_eliminado.webm"):
				$VideoPlayer.stream = load("res://instructions_video/bloco_eliminado.webm")
				$VideoPlayer.play()
		10:
			$Label_Instrucoes.set_text("Isso irá te ajudar! Bom jogo!!")
			$VideoPlayer.stream = null


func pagina_anterior_instrucoes():
	$SFX.stream = load("res://sfx/menu creditos idioma instrucoes.ogg")
	$SFX.play()
	if pagina_instrucoes <= 1: #valor mínimo da página 1
		pagina_instrucoes = 1
	else:
		pagina_instrucoes -= 1
	match pagina_instrucoes: # pega o texto da página de instruções
		1:
			$Label_Instrucoes.set_text("Clique em um bloco para selecioná-lo. Clique no bloco selecionado para desselecioná-lo.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_selecao.webm")
			$VideoPlayer.play()
		2:
			$Label_Instrucoes.set_text("A multiplicidade de um bloco é quantos anéis aparecem nele.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_multiplicidade.webm")
			$VideoPlayer.play()
		3:
			$Label_Instrucoes.set_text("Quando você seleciona um bloco, o número de anéis selecionados é somado com a multiplicidade do bloco.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_soma.webm")
			$VideoPlayer.play()
		4:
			$Label_Instrucoes.set_text("Quando você desseleciona um bloco, o número de anéis selecionados é subtraído com a multiplicidade do bloco.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_diferenca.webm")
			$VideoPlayer.play()
		5:
			$Label_Instrucoes.set_text("Você precisa selecionar blocos em que a soma dos anéis selecionados seja igual ao número de anéis requerido no canto superior esquerdo.")
			$VideoPlayer.stream = load("res://instructions_video/bloco_eliminado.webm")
			$VideoPlayer.play()
		6:
			$Label_Instrucoes.set_text("Quando essa soma corresponder à requisição, todos os blocos selecionados serão eliminados.")
		7:
			$Label_Instrucoes.set_text("Quando eliminar todos os blocos da tela, você passará de fase, tornando o jogo um pouco mais difícil.")
		8:
			$Label_Instrucoes.set_text("Fique atento a número par, ímpar, primo e composto.")
		9:
			$Label_Instrucoes.set_text("Também fique atento às frases de resultado, que indicarão se o número de anéis selecionados é < (menor que), = (igual a) ou > (maior que) o número de anéis requerido.")
		10:
			$Label_Instrucoes.set_text("Isso irá te ajudar! Bom jogo!!")
			$VideoPlayer.stream = null


func _on_Button_Voltar_button_up():
	$SFX.stream = load("res://sfx/menu creditos idioma instrucoes.ogg")
	$SFX.play()
	get_tree().change_scene("res://scenes/Menu.tscn")
