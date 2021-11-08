extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var nodos = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

#func _process(delta):
#	pass


#acaba o tempo de 10 segundos do jogo
func _on_TimerJogo_timeout():
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/caem blocos topo.ogg")
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
	var contador = 0
	while contador < 25:
		if get_node(nodos[contador]).pode_selecionar && get_node(nodos[contador]).linhas_inteiras():
			if get_node(nodos[contador]).linha == 4:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([20, 21, 22, 23, 24])
			elif get_node(nodos[contador]).linha == 3:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([15, 16, 17, 18, 19])
			elif get_node(nodos[contador]).linha == 2:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([10, 11, 12, 13, 14])
			elif get_node(nodos[contador]).linha == 1:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([5, 6, 7, 8, 9])
		contador += 1
	contador = 0
	while contador < 25:
		if contador in get_node(nodos[contador]).blocos_queda:
			get_node(nodos[contador]).mode = RigidBody.MODE_RIGID
		contador += 1
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você esperou 10 segundos após a última adição dos blocos na tela! Então o jogo adicionou mais blocos à tela!"
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start() #inicia a contagem dos 10 segundos

#tempo da frase de resultado de 5 segundos acaba
func _on_TimerResult_timeout():
	var contador = 0
	if get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Parabéns! Você removeu todos os blocos da tela do jogo! Então você passou para a fase seguinte! O jogo agora fica um pouco mais difícil!":
		contador = 0
		while contador < 25:
			get_node(nodos[contador]).blocos_queda.clear()
			get_node(nodos[contador]).blocos_queda.append_array([0, 1, 2, 3, 4])
			contador += 1
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Que pena! Você encheu de blocos a tela do jogo! Então o jogo acabou! Jogue novamente quando quiser!":
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/fim tela cheia blocos.ogg")
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
		get_tree().change_scene("res://scenes/Menu.tscn")
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Que pena! Você esperou 10 segundos após a última adição dos blocos na tela! Então o jogo adicionou mais blocos à tela!":
		#se todos os blocos podem ser selecionados
		contador = 0
		var tela_cheia = false
		while contador < 25:
			if get_node(nodos[contador]).tela_cheia():
				tela_cheia = true
				break
			contador += 1
		if tela_cheia:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você encheu de blocos a tela do jogo! Então o jogo acabou! Jogue novamente quando quiser!"
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start()
		else:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!"
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Parabéns! Você fechou a seleção dos blocos com a soma das multiplicidades = o número a ser removido! Então você removeu os blocos selecionados!" || get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Que pena! Você selecionou blocos com a soma das multiplicidades > o número a ser removido! Então imediatamente o jogo adicionou mais blocos à tela!":
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop()
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!"
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").start()

