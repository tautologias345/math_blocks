extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var nodos = ["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody01", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody02", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody03", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody04", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody05", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody06", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody07", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody08", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody09", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody10", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody11", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody12", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody13", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody14", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody15", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody16", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody17", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody18", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody19", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody20", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody21", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody22", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody23", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody24", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody25"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#acaba o tempo de 10 segundos do jogo
func _on_TimerJogo_timeout():
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/caem blocos topo.ogg")
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
	var contador12 = 0
	var a = true
	var contador1 = 0
	while contador1 < 25:
		contador12 = 0
		while contador12 < 25:
			if get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 10.071 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador12] && get_node(nodos[contador1]).coluna == get_node(nodos[contador12]).coluna:
				get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
			elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 9.197 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador12] && get_node(nodos[contador1]).coluna == get_node(nodos[contador12]).coluna:
				get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
			elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 8.306 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador12] && get_node(nodos[contador1]).coluna == get_node(nodos[contador12]).coluna:
				get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
			elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 7.328 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador12] && get_node(nodos[contador1]).coluna == get_node(nodos[contador12]).coluna:
				get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
			elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 6.367 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador12] && get_node(nodos[contador1]).coluna == get_node(nodos[contador12]).coluna:
				get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
			contador12 += 1
		contador1 += 1
	contador1 = 0
	while contador1 < 25:
		get_node(nodos[contador1]).erros += 1
		contador1 += 1
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você esperou 10 segundos após a última adição dos blocos na tela! Então o jogo adicionou mais blocos à tela!"
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start() #inicia a contagem dos 10 segundos
	contador1 = 0
	while contador1 < 25:
		if get_node(nodos[contador1]).numero_aneis_requerido < 10:
			if get_node(nodos[contador1]).pontuacao < 10:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			elif get_node(nodos[contador1]).pontuacao < 100:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			else:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
		else:
			if get_node(nodos[contador1]).pontuacao < 10:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			elif get_node(nodos[contador1]).pontuacao < 100:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			else:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/Info").set_text(get_node(nodos[contador1]).info_text)
		contador1 += 1

#tempo da frase de resultado de 5 segundos acaba
func _on_TimerResult_timeout():
	var contador1 = 0
	var contador12 = 0
	if get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Parabéns! Você removeu todos os blocos da tela do jogo! Então você passou para a get_node(nodos[contador1]).fase seguinte! O jogo agora fica um pouco mais difícil!":
		contador1 = 0
		while contador1 < 25:
			while contador12 < 25:
				if get_node(get_node(nodos[contador12]).caminho_colisao).translation.y == 6.367:
					get_node(nodos[contador1]).blocos_queda.append(contador12)
				contador12 += 1
			contador1 += 1
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop()
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!"
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").start()
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Que pena! Você encheu de blocos a tela do jogo! Então o jogo acabou! Jogue novamente quando quiser!":
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/fim tela cheia blocos.ogg")
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
		get_tree().change_scene("res://scenes/Menu.tscn")
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Que pena! Você esperou 10 segundos após a última adição dos blocos na tela! Então o jogo adicionou mais blocos à tela!":
		#se todos os blocos podem ser selecionados
		contador1 = 0
		var tela_cheia = false
		while contador1 < 25:
			if get_node(nodos[contador1]).tela_cheia():
				tela_cheia = true
				break
			contador1 += 1
		if tela_cheia:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você encheu de blocos a tela do jogo! Então o jogo acabou! Jogue novamente quando quiser!"
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start()
		else:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!"
	elif get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Parabéns! Você fechou a seleção dos blocos com a soma das multiplicidades = o número a ser removido! Então você removeu os blocos selecionados!" || get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Que pena! Você selecionou blocos com a soma das multiplicidades > o número a ser removido! Então imediatamente o jogo adicionou mais blocos à tela!":
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop()
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!"
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").start()
	contador1 = 0
	while contador1 < 25:
		if get_node(nodos[contador1]).numero_aneis_requerido < 10:
			if get_node(nodos[contador1]).pontuacao < 10:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			elif get_node(nodos[contador1]).pontuacao < 100:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			else:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: 0" + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
		else:
			if get_node(nodos[contador1]).pontuacao < 10:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 00" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			elif get_node(nodos[contador1]).pontuacao < 100:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: 0" + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
			else:
				if get_node(nodos[contador1]).erros < 10:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 00" + str(get_node(nodos[contador1]).erros)
				elif get_node(nodos[contador1]).erros < 100:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: 0" + str(get_node(nodos[contador1]).erros)
				else:
					get_node(nodos[contador1]).info_text = "Número de anéis a ser removido: " + str(get_node(nodos[contador1]).numero_aneis_requerido) + "\n\n\n\nFase " + str(get_node(nodos[contador1]).fase) + "\n\nPontuação: " + str(get_node(nodos[contador1]).pontuacao) + "\n\nErros: " + str(get_node(nodos[contador1]).erros)
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/Info").set_text(get_node(nodos[contador1]).info_text)
		contador1 += 1

