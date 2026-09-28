extends CharacterBody2D

signal health_changed(new_health)
signal died

@export var speed: float = 400.0
@export var health: int = 100

func _physics_process(_delta):
    var direction = Input.get_vector(
        "move_left",
        "move_right",
        "move_up",
        "move_down"
    )

    velocity = direction * speed
    move_and_slide()

    if Input.is_action_just_pressed("player_action"):
        take_damage(10)


func take_damage(amount: int):
    if health <= 0:
        return

    health = max(health - amount, 0)

    health_changed.emit(health)

    if health == 0:
        die()

func die():
    died.emit()