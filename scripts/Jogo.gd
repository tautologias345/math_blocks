extends RigidBody


# Declare member variables here. Examples:
#export é para pegar a variável de outros arquivos
export var nodos = []
export var caminho_borda_verde = ""
export var caminho_forma = ""
export var linha = 0
export var coluna = 0
export var blocos_queda = []
export var pode_selecionar = false
export var x_min = 0 #posição horizontal mínima do ponteiro do mouse
export var x_max = 0 #posição horizontal máxima do ponteiro do mouse
export var y_min = 0 #posição vertical mínima do ponteiro do mouse
export var y_max = 0 #posição vertical máxima do ponteiro do mouse
export var multiplicidade = 0
var numero_aneis_requerido = 1
var numero_aneis_selecionados = 0
var fase = 1
var pontuacao = 0
var erros = 0
var info_text = "" #alterar a informação do jogo com a formatação adequada

# entra na cena
# Called when the node enters the scene tree for the first time.
func _ready():
	#primeira linha dos blocos
	var contador = 0
	while contador < 25:
		get_node(nodos[contador]).blocos_queda.append_array([0, 1, 2, 3, 4])
		contador += 1
	contador = 0
	while contador < 25:
		if contador in get_node(nodos[contador]).blocos_queda:
			get_node(nodos[contador]).mode = RigidBody.MODE_RIGID
		contador += 1
	var materiais = []
	contador = 0
	while contador < 25:
		materiais.append(get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0))
		contador += 1
	randomize()
	materiais = shuffleList(materiais)
	contador = 0
	while contador < 25:
		get_node(get_node(nodos[contador]).caminho_forma).set_surface_material(0, materiais[contador])
		contador += 1
	contador = 0
	while contador < 25:
		if get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_simples.tres"):
			get_node(nodos[contador]).multiplicidade = 1
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_duplo.tres"):
			get_node(nodos[contador]).multiplicidade = 2
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_triplo.tres"):
			get_node(nodos[contador]).multiplicidade = 3
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_quadruplo.tres"):
			get_node(nodos[contador]).multiplicidade = 4
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_quintuplo.tres"):
			get_node(nodos[contador]).multiplicidade = 5
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_sextuplo.tres"):
			get_node(nodos[contador]).multiplicidade = 6
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_septuplo.tres"):
			get_node(nodos[contador]).multiplicidade = 7
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_octuplo.tres"):
			get_node(nodos[contador]).multiplicidade = 8
		elif get_node(get_node(nodos[contador]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_nonuplo.tres"):
			get_node(nodos[contador]).multiplicidade = 9
		contador += 1
	contador = 0
	while contador < 25:
		if contador % 5 == 0:
			get_node(nodos[contador]).x_min = 46
			get_node(nodos[contador]).x_max = 77
			get_node(nodos[contador]).coluna = 1
		elif contador % 5 == 1:
			get_node(nodos[contador]).x_min = 100
			get_node(nodos[contador]).x_max = 133
			get_node(nodos[contador]).coluna = 2
		elif contador % 5 == 2:
			get_node(nodos[contador]).x_min = 156
			get_node(nodos[contador]).x_max = 187
			get_node(nodos[contador]).coluna = 3
		elif contador % 5 == 3:
			get_node(nodos[contador]).x_min = 211
			get_node(nodos[contador]).x_max = 241
			get_node(nodos[contador]).coluna = 4
		elif contador % 5 == 4:
			get_node(nodos[contador]).x_min = 265
			get_node(nodos[contador]).x_max = 295
			get_node(nodos[contador]).coluna = 5
		contador += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	if numero_aneis_requerido < 10:
		if pontuacao < 10:
			if erros < 10:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: 00%d\n\nErros: 00%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			elif erros < 100:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: 00%d\n\nErros: 0%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			else:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: 00%d\n\nErros: %d" % [numero_aneis_requerido, fase, pontuacao, erros]
		elif pontuacao < 100:
			if erros < 10:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: 0%d\n\nErros: 00%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			elif erros < 100:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: 0%d\n\nErros: 0%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			else:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: 0%d\n\nErros: %d" % [numero_aneis_requerido, fase, pontuacao, erros]
		else:
			if erros < 10:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: %d\n\nErros: 00%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			elif erros < 100:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: %d\n\nErros: 0%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			else:
				info_text = "Número de anéis a ser removido: 0%d\n\nFase %d\n\nPontuação: %d\n\nErros: %d" % [numero_aneis_requerido, fase, pontuacao, erros]
	else:
		if pontuacao < 10:
			if erros < 10:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: 00%d\n\nErros: 00%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			elif erros < 100:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: 00%d\n\nErros: 0%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			else:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: 00%d\n\nErros: %d" % [numero_aneis_requerido, fase, pontuacao, erros]
		elif pontuacao < 100:
			if erros < 10:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: 0%d\n\nErros: 00%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			elif erros < 100:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: 0%d\n\nErros: 0%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			else:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: 0%d\n\nErros: %d" % [numero_aneis_requerido, fase, pontuacao, erros]
		else:
			if erros < 10:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: %d\n\nErros: 00%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			elif erros < 100:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: %d\n\nErros: 0%d" % [numero_aneis_requerido, fase, pontuacao, erros]
			else:
				info_text = "Número de anéis a ser removido: %d\n\nFase %d\n\nPontuação: %d\n\nErros: %d" % [numero_aneis_requerido, fase, pontuacao, erros]
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/Info").set_text(info_text)

# ordena um vetor aleatoriamente
func shuffleList(list):
	var shuffledList = [] 
	var indexList = range(list.size())
	for i in range(list.size()):
		var x = randi()%indexList.size()
		shuffledList.append(list[indexList[x]])
		indexList.remove(x)
	return shuffledList


#verifica se todas as linhas selecionáveis são inteiras
func linhas_inteiras():
	var contador = 0
	var quantidade_linha_quatro = 0
	var quantidade_linha_tres = 0
	var quantidade_linha_dois = 0
	var quantidade_linha_um = 0
	while contador < 25:
		if get_node(nodos[contador]).linha == 5 && get_node(nodos[contador]).pode_selecionar:
			return false
		contador += 1
	contador = 0
	while contador < 25:
		if get_node(nodos[contador]).linha == 4 && get_node(nodos[contador]).pode_selecionar:
			if quantidade_linha_quatro < 5:
				quantidade_linha_quatro += 1
		contador += 1
	contador = 0
	while contador < 25:
		if get_node(nodos[contador]).linha == 3 && get_node(nodos[contador]).pode_selecionar:
			if quantidade_linha_tres < 5:
				quantidade_linha_tres += 1
		contador += 1
	contador = 0
	while contador < 25:
		if get_node(nodos[contador]).linha == 2 && get_node(nodos[contador]).pode_selecionar:
			if quantidade_linha_dois < 5:
				quantidade_linha_dois += 1
		contador += 1
	contador = 0
	while contador < 25:
		if get_node(nodos[contador]).linha == 1 && get_node(nodos[contador]).pode_selecionar:
			if quantidade_linha_um < 5:
				quantidade_linha_um += 1
		contador += 1
	return (quantidade_linha_quatro == 5 && quantidade_linha_tres == 5 && quantidade_linha_dois == 5 && quantidade_linha_um == 5) || (quantidade_linha_quatro == 0 && quantidade_linha_tres == 5 && quantidade_linha_dois == 5 && quantidade_linha_um == 5) || (quantidade_linha_quatro == 0 && quantidade_linha_tres == 0 && quantidade_linha_dois == 5 && quantidade_linha_um == 5) || (quantidade_linha_quatro == 0 && quantidade_linha_tres == 0 && quantidade_linha_dois == 0 && quantidade_linha_um == 5)


func tela_cheia():
	if get_node(nodos[0]).pode_selecionar && get_node(nodos[1]).pode_selecionar && get_node(nodos[2]).pode_selecionar && get_node(nodos[3]).pode_selecionar && get_node(nodos[4]).pode_selecionar:
		if get_node(nodos[5]).pode_selecionar && get_node(nodos[6]).pode_selecionar && get_node(nodos[7]).pode_selecionar && get_node(nodos[8]).pode_selecionar && get_node(nodos[9]).pode_selecionar:
			if get_node(nodos[10]).pode_selecionar && get_node(nodos[11]).pode_selecionar && get_node(nodos[12]).pode_selecionar && get_node(nodos[13]).pode_selecionar && get_node(nodos[14]).pode_selecionar:
				if get_node(nodos[15]).pode_selecionar && get_node(nodos[16]).pode_selecionar && get_node(nodos[17]).pode_selecionar && get_node(nodos[18]).pode_selecionar && get_node(nodos[19]).pode_selecionar:
					if get_node(nodos[20]).pode_selecionar && get_node(nodos[21]).pode_selecionar && get_node(nodos[22]).pode_selecionar && get_node(nodos[23]).pode_selecionar && get_node(nodos[24]).pode_selecionar:
						return true
	return false


func tela_vazia():
	if !get_node(nodos[0]).pode_selecionar && !get_node(nodos[1]).pode_selecionar && !get_node(nodos[2]).pode_selecionar && !get_node(nodos[3]).pode_selecionar && !get_node(nodos[4]).pode_selecionar:
		if !get_node(nodos[5]).pode_selecionar && !get_node(nodos[6]).pode_selecionar && !get_node(nodos[7]).pode_selecionar && !get_node(nodos[8]).pode_selecionar && !get_node(nodos[9]).pode_selecionar:
			if !get_node(nodos[10]).pode_selecionar && !get_node(nodos[11]).pode_selecionar && !get_node(nodos[12]).pode_selecionar && !get_node(nodos[13]).pode_selecionar && !get_node(nodos[14]).pode_selecionar:
				if !get_node(nodos[15]).pode_selecionar && !get_node(nodos[16]).pode_selecionar && !get_node(nodos[17]).pode_selecionar && !get_node(nodos[18]).pode_selecionar && !get_node(nodos[19]).pode_selecionar:
					if !get_node(nodos[20]).pode_selecionar && !get_node(nodos[21]).pode_selecionar && !get_node(nodos[22]).pode_selecionar && !get_node(nodos[23]).pode_selecionar && !get_node(nodos[24]).pode_selecionar:
						return true
	return false


func numero_linhas():
	var contador = 0
	var numero_linhas = 1
	while contador < 25:
		if get_node(nodos[contador]).linha == 2:
			numero_linhas = 2
		if get_node(nodos[contador]).linha == 3:
			numero_linhas = 3
		if get_node(nodos[contador]).linha == 4:
			numero_linhas = 4
		if get_node(nodos[contador]).linha == 5:
			numero_linhas = 5
		contador += 1
	return numero_linhas


# chamado quando o jogador pressiona qualquer controle
func _input(event):
	if event is InputEventMouseButton && event.is_pressed() && event.button_index == BUTTON_LEFT && get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!" && event.position.x >= self.x_min && event.position.x <= self.x_max && event.position.y >= self.y_min && event.position.y <= self.y_max && self.pode_selecionar:
		if get_node(self.caminho_borda_verde).visible:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/desseleciona um bloco.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			get_node(self.caminho_borda_verde).hide()
			numero_aneis_selecionados -= self.multiplicidade
		else:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/seleciona um bloco.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			get_node(self.caminho_borda_verde).show()
			numero_aneis_selecionados += self.multiplicidade
		if numero_aneis_selecionados > numero_aneis_requerido: #caem imediatamente os blocos
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").stop()
			get_node(self.caminho_borda_verde).hide()
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
			erros += 1
			numero_aneis_selecionados = 0
			numero_aneis_requerido = randi() % 28 + 1 #número aleatório de 1 a 28
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você selecionou blocos com a soma das multiplicidades > o número a ser removido! Então imediatamente o jogo adicionou mais blocos à tela!"
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/erro selecao maior que requerido.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start()
		elif numero_aneis_selecionados == numero_aneis_requerido:
			if get_node(self.caminho_borda_verde).visible:
				self.mode = RigidBody.MODE_STATIC
				self.linha = 0
				get_node(self.caminho_borda_verde).hide()
				self.translation = Vector3(0, 0, 0)
				self.pode_selecionar = false
			var contador = 0
			while contador < 25:
				get_node(nodos[contador]).blocos_queda.clear()
				contador += 1
			contador = 0
			var contador_queda1 = 0
			while contador < 25:
				if self == get_node(nodos[contador]):
					contador_queda1 = contador
					break
				contador += 1
			var contador_queda2 = contador_queda1 + 1
			var contador_queda3 = contador_queda2
			while contador_queda2 < 25:
				if get_node(nodos[contador_queda2]).coluna == self.coluna && get_node(nodos[contador_queda2]).pode_selecionar:
					get_node(nodos[contador_queda2]).pode_selecionar = false
					get_node(nodos[contador_queda2]).mode = RigidBody.MODE_RIGID
				contador_queda2 += 1
			contador_queda2 = contador_queda3
			var contador_queda4 = 0
			while !linhas_inteiras() && contador_queda2 < 25:
				if get_node(nodos[contador_queda2]).coluna == self.coluna && !get_node(nodos[contador_queda2]).pode_selecionar:
					contador_queda4 = 0
					while contador_queda4 < 25:
						if !(contador_queda2 in get_node(nodos[contador_queda4]).blocos_queda):
							get_node(nodos[contador_queda4]).blocos_queda.append(contador_queda2)
						contador_queda4 += 1
				contador_queda2 += 1
			pontuacao += numero_aneis_selecionados
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop() #para de contar os 10 segundos da queda dos blocos
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Parabéns! Você fechou a seleção dos blocos com a soma das multiplicidades = o número a ser removido! Então você removeu os blocos selecionados!"
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start() #inicia a contagem de 5 segundos da frase de resultado
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/elimina blocos selecionados.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			numero_aneis_selecionados = 0
			numero_aneis_requerido = randi() % 28 + 1
			#removeu todos os blocos da tela para passar de fase
			contador = 0
			var tela_vazia = false
			while contador < 25:
				if get_node(nodos[contador]).tela_vazia():
					tela_vazia = true
					break
				contador += 1
			if tela_vazia:
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop()
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Parabéns! Você removeu todos os blocos da tela do jogo! Então você passou para a fase seguinte! O jogo agora fica um pouco mais difícil!"
				fase += 1
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start()
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/elimina todos blocos tela passa fase.ogg")
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()

#se o bloco está colidido com o bloco diretamente abaixo ou com o chão
func _on_RigidBody_body_entered(body):
	if (body != get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/StaticBody1") && body.coluna == self.coluna) || body == get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/StaticBody1"):
		self.pode_selecionar = true
		if body == get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/StaticBody1"):
			self.y_min = 374
			self.y_max = 405
			self.linha = 1 
		elif body.linha == 1:
			self.y_min = 333
			self.y_max = 367
			self.linha = 2
		elif body.linha == 2:
			self.y_min = 294
			self.y_max = 329
			self.linha = 3
		elif body.linha == 3:
			self.y_min = 255
			self.y_max = 291
			self.linha = 4
		elif body.linha == 4:
			self.y_min = 216
			self.y_max = 253
			self.linha = 5
