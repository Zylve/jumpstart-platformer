extends Area2D

@export var game_over: CanvasLayer
@export var label: RichTextLabel
@export var time_text: RichTextLabel

var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in self.get_overlapping_bodies():
		if body is CharacterBody2D:
			game_over.visible = true
			label.visible = false
			time_text.text = "%.2f seconds!" % time
			continue
	if game_over.visible == false:
		time += delta
		label.text = "%.2f s" % time

func _on_button_pressed() -> void:
	self.get_tree().reload_current_scene()
