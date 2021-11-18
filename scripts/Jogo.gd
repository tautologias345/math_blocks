extends RigidBody


# Declare member variables here. Examples:
#export é para pegar a variável de outros arquivos
export var nodos = []
export var caminho_borda_verde = ""
export var caminho_forma = ""
export var caminho_colisao = ""
export var linha = 0
export var coluna = 0
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
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody01", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody02", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody03", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody04", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody05"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody06", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody07", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody08", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody09", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody10"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody11", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody12", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody13", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody14", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody15"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody16", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody17", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody18", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody19", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody20"])
	nodos.append_array(["/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody21", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody22", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody23", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody24", "/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/RigidBody25"])
	#primeira linha dos blocos
	var contador1 = 0
	var contador2 = 0
	var contador3 = 0
	while nodos.size() > 25:
		nodos.remove(25)
	var materiais = []
	while contador1 < 25:
		materiais.append(get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0))
		contador1 += 1
	randomize()
	materiais = shuffleList(materiais)
	contador1 = 0
	while contador1 < 25:
		get_node(get_node(nodos[contador1]).caminho_forma).set_surface_material(0, materiais[contador1])
		contador1 += 1
	contador1 = 0
	while contador1 < 25:
		if get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_simples.tres"):
			get_node(nodos[contador1]).multiplicidade = 1
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_duplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 2
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_triplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 3
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_quadruplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 4
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_quintuplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 5
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_sextuplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 6
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_septuplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 7
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_octuplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 8
		elif get_node(get_node(nodos[contador1]).caminho_forma).get_surface_material(0) == load("res://materials/mat_bloco_nonuplo.tres"):
			get_node(nodos[contador1]).multiplicidade = 9
		contador1 += 1
	contador1 = 0
	while contador1 < 25:
		if contador1 % 5 == 0:
			get_node(nodos[contador1]).x_min = 46
			get_node(nodos[contador1]).x_max = 77
			get_node(nodos[contador1]).coluna = 1
		elif contador1 % 5 == 1:
			get_node(nodos[contador1]).x_min = 100
			get_node(nodos[contador1]).x_max = 133
			get_node(nodos[contador1]).coluna = 2
		elif contador1 % 5 == 2:
			get_node(nodos[contador1]).x_min = 156
			get_node(nodos[contador1]).x_max = 187
			get_node(nodos[contador1]).coluna = 3
		elif contador1 % 5 == 3:
			get_node(nodos[contador1]).x_min = 211
			get_node(nodos[contador1]).x_max = 241
			get_node(nodos[contador1]).coluna = 4
		elif contador1 % 5 == 4:
			get_node(nodos[contador1]).x_min = 265
			get_node(nodos[contador1]).x_max = 295
			get_node(nodos[contador1]).coluna = 5
		contador1 += 1
	contador1 = 0
	while contador1 < 5:
		get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
		contador1 += 1


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


func quais_podem_selecionar():
	var contador1 = 0
	var vet = []
	while contador1 < 25:
		vet.append(false)
		contador1 += 1
	contador1 = 0
	while contador1 < 25:
		match contador1:
			0:
				if get_node(nodos[contador1]).coluna == 1 && get_node(nodos[contador1]).linha == 1 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			1:
				if get_node(nodos[contador1]).coluna == 2 && get_node(nodos[contador1]).linha == 1 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			2:
				if get_node(nodos[contador1]).coluna == 3 && get_node(nodos[contador1]).linha == 1 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			3:
				if get_node(nodos[contador1]).coluna == 4 && get_node(nodos[contador1]).linha == 1 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			4:
				if get_node(nodos[contador1]).coluna == 5 && get_node(nodos[contador1]).linha == 1 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			5:
				if get_node(nodos[contador1]).coluna == 1 && get_node(nodos[contador1]).linha == 2 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			6:
				if get_node(nodos[contador1]).coluna == 2 && get_node(nodos[contador1]).linha == 2 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			7:
				if get_node(nodos[contador1]).coluna == 3 && get_node(nodos[contador1]).linha == 2 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			8:
				if get_node(nodos[contador1]).coluna == 4 && get_node(nodos[contador1]).linha == 2 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			9:
				if get_node(nodos[contador1]).coluna == 5 && get_node(nodos[contador1]).linha == 2 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			10:
				if get_node(nodos[contador1]).coluna == 1 && get_node(nodos[contador1]).linha == 3 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			11:
				if get_node(nodos[contador1]).coluna == 2 && get_node(nodos[contador1]).linha == 3 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			12:
				if get_node(nodos[contador1]).coluna == 3 && get_node(nodos[contador1]).linha == 3 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			13:
				if get_node(nodos[contador1]).coluna == 4 && get_node(nodos[contador1]).linha == 3 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			14:
				if get_node(nodos[contador1]).coluna == 5 && get_node(nodos[contador1]).linha == 3 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			15:
				if get_node(nodos[contador1]).coluna == 1 && get_node(nodos[contador1]).linha == 4 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			16:
				if get_node(nodos[contador1]).coluna == 2 && get_node(nodos[contador1]).linha == 4 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			17:
				if get_node(nodos[contador1]).coluna == 3 && get_node(nodos[contador1]).linha == 4 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			18:
				if get_node(nodos[contador1]).coluna == 4 && get_node(nodos[contador1]).linha == 4 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			19:
				if get_node(nodos[contador1]).coluna == 5 && get_node(nodos[contador1]).linha == 4 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			20:
				if get_node(nodos[contador1]).coluna == 1 && get_node(nodos[contador1]).linha == 5 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			21:
				if get_node(nodos[contador1]).coluna == 2 && get_node(nodos[contador1]).linha == 5 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			22:
				if get_node(nodos[contador1]).coluna == 3 && get_node(nodos[contador1]).linha == 5 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			23:
				if get_node(nodos[contador1]).coluna == 4 && get_node(nodos[contador1]).linha == 5 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
			24:
				if get_node(nodos[contador1]).coluna == 5 && get_node(nodos[contador1]).linha == 5 && get_node(nodos[contador1]).pode_selecionar:
					vet[contador1] = true
		contador1 += 1
	return vet


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
		if get_node(nodos[contador]).linha == 2 && numero_linhas == 1:
			numero_linhas = 2
		if get_node(nodos[contador]).linha == 3 && numero_linhas == 2:
			numero_linhas = 3
		if get_node(nodos[contador]).linha == 4 && numero_linhas == 3:
			numero_linhas = 4
		if get_node(nodos[contador]).linha == 5 && numero_linhas == 4:
			numero_linhas = 5
		contador += 1
	return numero_linhas


func multiplicidade_total():
	var multiplicidade_total = 0
	var contador1 = 0
	while contador1 < 25:
		if get_node(nodos[contador1]).pode_selecionar:
			multiplicidade_total += get_node(nodos[contador1]).multiplicidade
		contador1 += 1
	return multiplicidade_total


func multiplicidade_minima():
	var multiplicidade_minima = 9
	var contador1 = 0
	while contador1 < 25:
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 8:
			multiplicidade_minima = 8
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 7:
			multiplicidade_minima = 7
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 6:
			multiplicidade_minima = 6
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 5:
			multiplicidade_minima = 5
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 4:
			multiplicidade_minima = 4
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 3:
			multiplicidade_minima = 3
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 2:
			multiplicidade_minima = 2
		if get_node(nodos[contador1]).pode_selecionar && get_node(nodos[contador1]).multiplicidade == 1:
			multiplicidade_minima = 1
		contador1 += 1
	return multiplicidade_minima


# chamado quando o jogador pressiona qualquer controle
func _input(event):
	var contador1 = 0
	if ((event is InputEventMouseButton && event.button_index == BUTTON_LEFT) || (event is InputEventScreenTouch && event.get_index() == 1)) && event.is_pressed() && get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text == "Você ainda pode selecionar mais blocos, pois a soma atual das multiplicidades < o número a ser removido!" && event.position.x >= self.x_min && event.position.x <= self.x_max && event.position.y >= self.y_min && event.position.y <= self.y_max && self.pode_selecionar:
		if get_node(self.caminho_borda_verde).visible:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/desseleciona um bloco.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			get_node(self.caminho_borda_verde).hide()
			while contador1 < 25:
				get_node(nodos[contador1]).numero_aneis_selecionados -= self.multiplicidade
				contador1 += 1
		else:
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/seleciona um bloco.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			get_node(self.caminho_borda_verde).show()
			while contador1 < 25:
				get_node(nodos[contador1]).numero_aneis_selecionados += self.multiplicidade
				contador1 += 1
		if numero_aneis_selecionados > numero_aneis_requerido: #caem imediatamente os blocos
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").stop()
			get_node(self.caminho_borda_verde).hide()
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/caem blocos topo.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			var contador2 = 0
			var a = true
			contador1 = 0
			while contador1 < 25:
				contador2 = 0
				while contador2 < 25:
					if get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 10.071 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador2] && get_node(nodos[contador1]).coluna == get_node(nodos[contador2]).coluna:
						get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
					elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 9.197 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador2] && get_node(nodos[contador1]).coluna == get_node(nodos[contador2]).coluna:
						get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
					elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 8.306 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador2] && get_node(nodos[contador1]).coluna == get_node(nodos[contador2]).coluna:
						get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
					elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 7.328 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador2] && get_node(nodos[contador1]).coluna == get_node(nodos[contador2]).coluna:
						get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
					elif get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 6.367 && get_node(nodos[contador1]).linha == 0 && get_node(nodos[contador1]).mode == RigidBody.MODE_STATIC && !get_node(nodos[0]).quais_podem_selecionar()[contador2] && get_node(nodos[contador1]).coluna == get_node(nodos[contador2]).coluna:
						get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
					contador2 += 1
				contador1 += 1
			contador1 = 0
			while contador1 < 25:
				if get_node(get_node(nodos[contador1]).caminho_borda_verde).visible:
					get_node(get_node(nodos[contador1]).caminho_borda_verde).hide()
				get_node(nodos[contador1]).erros += 1
				get_node(nodos[contador1]).numero_aneis_selecionados = 0
				contador1 += 1
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Que pena! Você selecionou blocos com a soma das multiplicidades > o número a ser removido! Então imediatamente o jogo adicionou mais blocos à tela!"
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/erro selecao maior que requerido.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop()
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start()
		elif numero_aneis_selecionados == numero_aneis_requerido:
			contador1 = 0
			while contador1 < 25:
				if get_node(get_node(nodos[contador1]).caminho_borda_verde).visible:
					get_node(nodos[contador1]).mode = RigidBody.MODE_STATIC
					get_node(nodos[contador1]).linha = 0
					get_node(nodos[contador1]).y_min = -12
					get_node(nodos[contador1]).y_max = -8
					get_node(get_node(nodos[contador1]).caminho_borda_verde).hide()
					get_node(nodos[contador1]).translation = Vector3(0, 0, 0)
					get_node(nodos[contador1]).pode_selecionar = false
				contador1 += 1
			contador1 = 0
			while contador1 < 25:
				get_node(nodos[contador1]).pontuacao += numero_aneis_selecionados
				contador1 += 1
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop() #para de contar os 10 segundos da queda dos blocos
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Parabéns! Você fechou a seleção dos blocos com a soma das multiplicidades = o número a ser removido! Então você removeu os blocos selecionados!"
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start() #inicia a contagem de 5 segundos da frase de resultado
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/elimina blocos selecionados.ogg")
			get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
			#removeu todos os blocos da tela para passar de fase
			contador1 = 0
			var tela_vazia = false
			while contador1 < 25:
				if get_node(nodos[contador1]).tela_vazia():
					tela_vazia = true
					break
				contador1 += 1
			if tela_vazia:
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop()
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/Result").text = "Parabéns! Você removeu todos os blocos da tela do jogo! Então você passou para a fase seguinte! O jogo agora fica um pouco mais difícil!"
				contador1 = 0
				while contador1 < 25:
					get_node(nodos[contador1]).fase += 1
					contador1 += 1
				contador1 = 0
				while contador1 < 25:
					if get_node(get_node(nodos[contador1]).caminho_colisao).translation.y == 6.367 && get_node(nodos[contador1]).linha == 0 && (get_node(nodos[contador1]).coluna == 1 || get_node(nodos[contador1]).coluna == 2 || get_node(nodos[contador1]).coluna == 3 || get_node(nodos[contador1]).coluna == 4 || get_node(nodos[contador1]).coluna == 5):
						get_node(nodos[contador1]).mode = RigidBody.MODE_RIGID
					contador1 += 1
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/TimerResult").start()
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").stream = load("res://sfx/elimina todos blocos tela passa fase.ogg")
				get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").play()
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
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").stop()
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer2/Viewport2/Jogo/TimerJogo").start()
