# Created by Freeknight
# Date: 2021/12/22
# Desc：
# @category:
#--------------------------------------------------------------------------------------------------
tool
extends "./layout_node.gd"
### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------
#--- enums ----------------------------------------------------------------------------------------
enum Direction {
	HORIZONTAL,
	VERTICAL,
}
#--- constants ------------------------------------------------------------------------------------
const LayoutPanel = preload("./layout_panel.gd")
#--- public variables - order: export > normal var > onready --------------------------------------
export(Direction) var direction = Direction.HORIZONTAL setget set_direction, get_direction
export(float, 0, 1) var percent = 0.5 setget set_percent, get_percent
export(Resource) var first = LayoutPanel.new() setget set_first, get_first
export(Resource) var second = LayoutPanel.new() setget set_second, get_second
#--- private variables - order: export > normal var > onready -------------------------------------
var _direction = Direction.HORIZONTAL
var _percent = 0.5
var _first
var _second
### -----------------------------------------------------------------------------------------------

### Built in Engine Methods -----------------------------------------------------------------------
func _init() -> void:
	resource_name = "Split"
### -----------------------------------------------------------------------------------------------

### Public Methods --------------------------------------------------------------------------------
func clone():
	var new_split = get_script().new()
	new_split._direction = _direction
	new_split._percent = _percent
	new_split.first = _first.clone()
	new_split.second = _second.clone()
	return new_split
# ------------------------------------------------------------------------------
func set_first(value) -> void:
	if value == null:
		_first = LayoutPanel.new()
	else:
		_first = value
	_first.parent = self
	emit_tree_changed()
# ------------------------------------------------------------------------------
func get_first():
	return _first
# ------------------------------------------------------------------------------
func set_second(value) -> void:
	if value == null:
		_second = LayoutPanel.new()
	else:
		_second = value
	_second.parent = self
	emit_tree_changed()
# ------------------------------------------------------------------------------
func get_second():
	return _second
# ------------------------------------------------------------------------------
func set_direction(value: int) -> void:
	if value != _direction:
		_direction = value
		emit_tree_changed()
# ------------------------------------------------------------------------------
func get_direction() -> int:
	return _direction
# ------------------------------------------------------------------------------
func set_percent(value: float) -> void:
	var clamped_value = clamp(value, 0, 1)
	if not is_equal_approx(_percent, clamped_value):
		_percent = clamped_value
		emit_tree_changed()
# ------------------------------------------------------------------------------
func get_percent() -> float:
	return _percent
# ------------------------------------------------------------------------------
func get_names() -> PoolStringArray:
	var names = _first.get_names()
	names.append_array(_second.get_names())
	return names
# ------------------------------------------------------------------------------
func empty() -> bool:
	return _first.empty() and _second.empty()
# ------------------------------------------------------------------------------
func is_horizontal() -> bool:
	return _direction == Direction.HORIZONTAL
# ------------------------------------------------------------------------------
func is_vertical() -> bool:
	return _direction == Direction.VERTICAL
### -----------------------------------------------------------------------------------------------

### Private Methods -------------------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------
