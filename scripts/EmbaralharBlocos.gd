extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var nodos = []


# Called when the node enters the scene tree for the first time.
func _ready():
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody01", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody02", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody03", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody04", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody05"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody06", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody07", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody08", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody09", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody10"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody11", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody12", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody13", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody14", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody15"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody16", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody17", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody18", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody19", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody20"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody21", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody22", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody23", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody24", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody25"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func embaralhar_blocos():
	var contador1 = 0
	while contador1 < 25:
		if contador1 == 0:
			while get_node(nodos[contador1]).numero_aneis_requerido < get_node(nodos[contador1]).multiplicidade_minima():
				get_node(nodos[contador1]).numero_aneis_requerido = randi() % get_node(nodos[contador1]).multiplicidade_total() + 1
		else:
			get_node(nodos[contador1]).numero_aneis_requerido = get_node(nodos[contador1 - 1]).numero_aneis_requerido
		contador1 += 1
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
