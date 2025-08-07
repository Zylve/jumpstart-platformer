extends TileMapLayer

@export var speed: float = 0.005
@export var current = self.rotation
@export var previous: float = 0
@export var target: float = PI
var limit: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	self.rotation = lerp(self.rotation, target, speed)

	if abs(self.rotation - target) < limit:
		previous = target
		target = randf_range(0, 2 * PI)
		limit = randf_range(0.05, 1.0)
		speed = randf_range(0.001, 0.01)
