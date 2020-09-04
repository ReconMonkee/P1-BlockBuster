extends RigidBody2D

var strength = 0
var xValue = 0
var yValue = -1
var launchPushed = 0
var newXValue = 0


func _process(delta):
	if launchPushed == 1:
		var direction = Vector2(newXValue, yValue).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO, velocity)
		launchPushed +=1


func _on_Launch_pressed():
	launchPushed += 1
	$Arrow.hide()
	


func _on_XValue_text_changed(new_text):
	xValue = float(new_text)/180
	if xValue > 1:
		xValue = 1
	if xValue < -1:
		xValue = -1
		


func _on_Strength_text_changed(new_text):
	strength = float(new_text)


func _on_Ball_body_entered(body):
	if body.is_in_group("blocks"):
		body.queue_free()
		print("Block Busted!!")
	if body.is_in_group("Floor"):
		linear_velocity = Vector2 (0,0)
		angular_velocity = 0
		launchPushed = 0

func _on_Set_pressed():
	newXValue = xValue
	$CollisionShape2D.rotation_degrees = 0
	$Arrow.rotation_degrees = 0
	rotation_degrees = 0
	$Arrow.show()
	$Arrow.rotate(newXValue)
