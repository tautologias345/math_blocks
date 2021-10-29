extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var db_bgm = 0 #volume da música de fundo
var db_sfx = 0 #volume dos efeitos sonoros

# Called when the node enters the scene tree for the first time.
func _ready():
	if self == get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXVolume"):
		self.add_item("1,0000", 1) #efeitos sonoros com volume 16/16
		self.add_item("0,9275", 2)
		self.add_item("0,8750", 3)
		self.add_item("0,8125", 4)
		self.add_item("0,7500", 5)
		self.add_item("0,6875", 6)
		self.add_item("0,6250", 7)
		self.add_item("0,5625", 8)
		self.add_item("0,5000", 9)
		self.add_item("0,4375", 10)
		self.add_item("0,3750", 11)
		self.add_item("0,3125", 12)
		self.add_item("0,2500", 13)
		self.add_item("0,1875", 14)
		self.add_item("0,1250", 15)
		self.add_item("0,0625", 16)
		self.add_item("0,0000", 17) #efeitos sonoros com volume 0/16
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").set_volume_db(db_sfx)
	elif self == get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/BGMVolume"):
		self.add_item("1,0000", 1) #música de fundo com volume 16/16
		self.add_item("0,9275", 2)
		self.add_item("0,8750", 3)
		self.add_item("0,8125", 4)
		self.add_item("0,7500", 5)
		self.add_item("0,6875", 6)
		self.add_item("0,6250", 7)
		self.add_item("0,5625", 8)
		self.add_item("0,5000", 9)
		self.add_item("0,4375", 10)
		self.add_item("0,3750", 11)
		self.add_item("0,3125", 12)
		self.add_item("0,2500", 13)
		self.add_item("0,1875", 14)
		self.add_item("0,1250", 15)
		self.add_item("0,0625", 16)
		self.add_item("0,0000", 17) #música de fundo com volume 0/16
		get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/BGMStream").set_volume_db(db_bgm)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#seleciona o volume da música de fundo
func _on_BGMVolume_item_selected(index):
	match get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/BGMVolume").get_item_id(index): #pegar o ID do item pelo índice do vetor
		1:
			db_bgm = 0
		2:
			db_bgm = -5
		3:
			db_bgm = -10
		4:
			db_bgm = -15
		5:
			db_bgm = -20
		6:
			db_bgm = -25
		7:
			db_bgm = -30
		8:
			db_bgm = -35
		9:
			db_bgm = -40
		10:
			db_bgm = -45
		11:
			db_bgm = -50
		12:
			db_bgm = -55
		13:
			db_bgm = -60
		14:
			db_bgm = -65
		15:
			db_bgm = -70
		16:
			db_bgm = -75
		17:
			db_bgm = -80 #volume nulo
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer3/Viewport3/FundoDir/BGMStream").set_volume_db(db_bgm)

#seleciona o volume dos efeitos sonoros
func _on_SFXVolume_item_selected(index):
	match get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXVolume").get_item_id(index):
		1:
			db_sfx = 0
		2:
			db_sfx = -5
		3:
			db_sfx = -10
		4:
			db_sfx = -15
		5:
			db_sfx = -20
		6:
			db_sfx = -25
		7:
			db_sfx = -30
		8:
			db_sfx = -35
		9:
			db_sfx = -40
		10:
			db_sfx = -45
		11:
			db_sfx = -50
		12:
			db_sfx = -55
		13:
			db_sfx = -60
		14:
			db_sfx = -65
		15:
			db_sfx = -70
		16:
			db_sfx = -75
		17:
			db_sfx = -80
	get_node("/root/ViewportTriplo/CanvasLayer/GridContainer/ViewportContainer1/Viewport1/FundoEsq/SFXStream").set_volume_db(db_sfx)
