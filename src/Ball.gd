extends RigidBody2D

var strength = 0
var xValue = 0
var yValue = 0
var launchPushed = false

func _process(delta):
	if launchPushed:
		var direction = Vector2(xValue, yValue).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO, velocity)
		launchPushed = false


func _on_Launch_pressed():
	launchPushed = true
	

func _on_XValue_text_changed(new_text):
	xValue = float(new_text)


func _on_YValue_text_changed(new_text):
	yValue = float(new_text)


func _on_Strength_text_changed(new_text):
	strength = float(new_text)


func _on_Ball_body_entered(body):
	if body.is_in_group("blocks"):
		body.queue_free()
