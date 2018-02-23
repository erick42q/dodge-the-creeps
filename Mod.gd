extends RigidBody2D

export  (int) var MIN_SPEED
export (int) var MAX_SPEED

var mod_types =  ["walk", "swim", "fly"]


func _ready():
	randomize()
	$AnimatedSprite.animation = mod_types[randi() % mod_types.size()]

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Visibility_screen_exited():
	queue_free()
