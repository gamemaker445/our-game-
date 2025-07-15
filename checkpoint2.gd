extends Area2D

@export var checkpoint_id: int = 0

signal checkpoint_activated(checkpoint_id, position)

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "player":  # Make sure only player triggers the checkpoint
		emit_signal("checkpoint_activated", checkpoint_id, global_position)
		# Optional: play animation or sound
