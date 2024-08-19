extends Node2D

var mouse_position = 0
var is_figure_chosen = 1

var field_max = 256
var cell_size = 64

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#mouse_position = get_local_mouseposition()
	#fill_chosen_cell()
	pass

#func fill_chosen_cell():
	#if(!is_figure_chosen):
		#$filler.visible = false
		#return
	#var coord_x = round(mouse_position[0] / cell_size - 0.5)
	#var coord_y = round(mouse_position[1] / cell_size - 0.5)
	#if((coord_x < -4 || coord_x > 3) || ((coord_y < -4 || coord_y > 3))):
		#$filler.visible = false
		#return
	#$filler.visible = true
	#$filler.position.x = coord_x * cell_size
	#$filler.position.y = coord_y * cell_size
	
	
	
	
