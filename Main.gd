extends Node

export (PackedScene) var Mod
var score

func _ready():
	randomize()


func game_over():
	$ScoreTimer.stop()
	$ModTimer.stop()
	$HUD.game_over()
	$DeathSound.play()
	$Music.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()

func _on_StartTimer_timeout():
	$ModTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score+=1
	$HUD.update_score(score)


func _on_ModTimer_timeout():
	$ModPath/ModSpawnLocation.set_offset(randi())
	var mod = Mod.instance()
	add_child(mod)
	var direction = $ModPath/ModSpawnLocation.rotation + PI/2
	mod.position = $ModPath/ModSpawnLocation.position
	# add some randomness to the direction
	direction += rand_range(-PI/4, PI/4)
	mod.rotation = direction
	# choose the velocity
	mod.set_linear_velocity(Vector2(rand_range(mod.MIN_SPEED, mod.MAX_SPEED), 0).rotated(direction))



