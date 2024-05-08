extends Node2D
@onready var bala=preload("res://bullet.tscn")
@onready var hplabel =$HP
@onready var levellabel =$Level
@onready var timelabel =$Time
@onready var scorelabel = $Score
var level=1
var score = 0
func _ready():
	levellabel.hide()
	get_node("You lost").hide()
func _process(delta):
	var texto = "HP: " + str(Game.playerHP)
	hplabel.text=texto
	timelabel.text=str(int(get_node("Timer2").time_left))
	scorelabel.text=str(score)
	if Game.playerHP<=0:
		$Timer.wait_time=999.0
		get_node("You lost").show()
		await get_tree().create_timer(4).timeout
		get_tree().change_scene_to_file("res://main.tscn")
	score+=1
		
	


func _on_timer_timeout():
	var balatemp = bala.instantiate()
	var a = randi_range(0,1)
	var b = randi_range(0,1)
	if (a==0) and (b==0):
		balatemp.position=Vector2(randi_range(0,1920),0)
	if (a==0) and (b==1):
		balatemp.position=Vector2(randi_range(0,1920),1080)
	if (a==1) and (b==0):
		balatemp.position=Vector2(0,randi_range(0,1080))
	if (a==1) and (b==1):
		balatemp.position=Vector2(1920,randi_range(0,1080))
		
	add_child(balatemp)


func _on_timer_2_timeout():
	var pachanga = true
	levellabel.show()
	level +=1
	var texto2="Level "+str(level)
	levellabel.text=texto2
	if pachanga==true:
		Bullet.speed=Bullet.speed*1.1
		get_node("Timer").wait_time=get_node("Timer").wait_time-(get_node("Timer").wait_time*.3)
		pachanga=false
	await get_tree().create_timer(2).timeout
	levellabel.hide()
	
