extends Node2D

@export var color : String # По стандарту White
var first_move_flag = 1
var step_y = -64
var step_x = 64
var pawn_png = preload("res://assets/test/pawn.png")
var pawn_hover_png = preload("res://assets/test/pawn_hover.png")
var enemies : Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(color == "Black"):
		step_y = -step_y
		pawn_png = preload("res://assets/test/pawn_black.png")
		pawn_hover_png = preload("res://assets/test/pawn_black_hover.png")
		$pawnTexture.texture = pawn_png
		$move_0.position.y += 2 * step_y
		$move_1.position.y += 4 * step_y
		$attack_0.position.y += 2 * step_y
		$attack_1.position.y += 2 * step_y
	elif(color != "White"):
		print("Error: Non assigned color for " + $".".to_string())
		free()
		
	# Для блокировки хода
	if($".".color == get_parent().get_parent().turn):
		get_parent().move_child($".",0)
		$".".process_mode = 0
	else:
		$".".process_mode = 4
		
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func switch_turn(flag):
	if(flag == "Black"):
		get_parent().get_parent().turn = "White"
	elif(flag == "White"):
		get_parent().get_parent().turn = "Black"	
	else:
		print("Error: Incorrect flag")
	
	for i in get_parent().get_children():
		if(i.color == get_parent().get_parent().turn):
			get_parent().move_child($".",0)
			i.process_mode = 0
		else:
			i.process_mode = 4
	
	pass

func switch_moves(flag):
	if(flag == "enable"):
		$move_0.visible = true
		if(first_move_flag):
			$move_1.visible = true
	elif(flag == "disable"):
		$move_0.visible = false
		if(first_move_flag):
			$move_1.visible = false

func switch_attacks(flag):
	if(flag == "enable"):
		for i in get_parent().get_children():
			#print(i.global_position.x, ' ', i.global_position.y, ' - ', $attack_0.global_position.x, ' ', $attack_0.global_position.y)
			if(i.global_position.x == $attack_0.global_position.x && i.global_position.y == $attack_0.global_position.y):
				$attack_0.visible = true
				enemies.append(i)
			if(i.global_position.x == $attack_1.global_position.x && i.global_position.y == $attack_1.global_position.y):
				$attack_1.visible = true
				enemies.append(i)
	elif(flag == "disable"):
		$attack_0.visible = false
		$attack_1.visible = false
	pass

func _on_pawn_button_pressed() -> void:
	switch_moves("enable")
	switch_attacks("enable")
	pass # Replace with function body.

func _on_move_0_button_pressed() -> void:
	switch_moves("disable")
	switch_attacks("disable")
	switch_turn($".".color)
	$".".position.y = $".".position.y + (1 * step_y)
	first_move_flag = 0
	pass # Replace with function body.


func _on_move_1_button_pressed() -> void:
	switch_moves("disable")
	switch_attacks("disable")
	switch_turn($".".color)
	$".".position.y = $".".position.y + (2 * step_y)
	first_move_flag = 0
	pass # Replace with function body.

func _on_pawn_button_mouse_entered() -> void:
	$pawnTexture.texture = pawn_hover_png
	pass # Replace with function body.

func _on_pawn_button_mouse_exited() -> void:
	$pawnTexture.texture = pawn_png
	pass # Replace with function body.


func _on_attack_0_button_pressed() -> void:
	switch_moves("disable")
	switch_attacks("disable")
	switch_turn($".".color)
	for enemy in enemies:
		if(enemy.global_position.x == $attack_0.global_position.x && enemy.global_position.y == $attack_0.global_position.y):
			enemy.free()
	enemies.clear()
	$".".position.x = $".".position.x - (1 * step_x)
	$".".position.y = $".".position.y + (1 * step_y)
	pass # Replace with function body.


func _on_attack_1_button_pressed() -> void:
	switch_moves("disable")
	switch_attacks("disable")
	switch_turn($".".color)
	for enemy in enemies:
		if(enemy.global_position.x == $attack_1.global_position.x && enemy.global_position.y == $attack_1.global_position.y):
			enemy.free()
	enemies.clear()
	$".".position.x = $".".position.x + (1 * step_x)
	$".".position.y = $".".position.y + (1 * step_y)
	pass # Replace with function body.
