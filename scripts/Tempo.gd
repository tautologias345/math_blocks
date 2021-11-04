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
	var tem_queda = false
	var contador = 0
	while contador < 25:
		if contador in get_node(nodos[contador]).blocos_queda:
			if !get_node(nodos[contador]).linha_inteira:
				tem_queda = true
			get_node(nodos[contador]).mode = RigidBody.MODE_RIGID
		contador += 1
	contador = 0
	if !tem_queda:
		if get_node(nodos[15]).pode_selecionar && get_node(nodos[15]).linha_inteira:
			while contador < 25:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([20, 21, 22, 23, 24])
				contador += 1
		elif get_node(nodos[10]).pode_selecionar && get_node(nodos[10]).linha_inteira:
			while contador < 25:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([15, 16, 17, 18, 19])
				contador += 1
		elif get_node(nodos[5]).pode_selecionar && get_node(nodos[5]).linha_inteira:
			while contador < 25:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([10, 11, 12, 13, 14])
				contador += 1
		elif get_node(nodos[0]).pode_selecionar && get_node(nodos[0]).linha_inteira:
			while contador < 25:
				get_node(nodos[contador]).blocos_queda.clear()
				get_node(nodos[contador]).blocos_queda.append_array([5, 6, 7, 8, 9])
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você esperou 10 segundos após a última adição dos blocos na tela! Então o jogo adicionou mais blocos à tela!"
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start() #inicia a contagem dos 10 segundos

#tempo da frase de resultado de 5 segundos acaba
func _on_TimerResult_timeout():
	var contador = 0
	if get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text != "Que pena! Você encheu de blocos a tela do jogo! Então o jogo acabou! Jogue novamente quando quiser!" && get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text != "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!" && get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text != "Parabéns! Você removeu todos os blocos da tela do jogo! Então você passou para a fase seguinte! O jogo agora fica um pouco mais difícil!":
		#se todos os blocos podem ser selecionados
		contador = 0
		var tela_cheia = false
		while contador < 25:
			if get_node(nodos[contador]).telaCheia():
				tela_cheia = true
				break
			contador += 1
		if tela_cheia:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você encheu de blocos a tela do jogo! Então o jogo acabou! Jogue novamente quando quiser!"
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start()
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Parabéns! Você removeu todos os blocos da tela do jogo! Então você passou para a fase seguinte! O jogo agora fica um pouco mais difícil!":
		contador = 0
		while contador < 25:
			get_node(nodos[contador]).blocos_queda.clear()
			get_node(nodos[contador]).blocos_queda.append_array([0, 1, 2, 3, 4])
			contador += 1
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Que pena! Você encheu de blocos a tela do jogo! Então o jogo acabou! Jogue novamente quando quiser!":
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/fim tela cheia blocos.ogg")
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
		get_tree().change_scene("res://scenes/Menu.tscn")
