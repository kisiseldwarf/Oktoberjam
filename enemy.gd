extends CharacterBody2D

const SPEED = 50.0
const JUMP_VELOCITY = -400.0

var player_pos: Vector2 = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	var player: Node2D = get_tree().get_first_node_in_group(Groups.player)
	
	if player_pos == null:
		return
	
	var direction = Vector2(player_pos.x - self.position.x, player_pos.y - self.position.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func move(player_pos: Vector2):
	self.player_pos = player_pos
