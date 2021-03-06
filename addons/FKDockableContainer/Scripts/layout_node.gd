# Created by Freeknight
# Date: 2021/12/22
# Desc：
# @category:
#--------------------------------------------------------------------------------------------------
tool
extends Resource
### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------
#--- enums ----------------------------------------------------------------------------------------
#--- constants ------------------------------------------------------------------------------------
#--- public variables - order: export > normal var > onready --------------------------------------
var parent = null
#--- private variables - order: export > normal var > onready -------------------------------------
### -----------------------------------------------------------------------------------------------

### Built in Engine Methods -----------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------

### Public Methods --------------------------------------------------------------------------------
func emit_tree_changed() -> void:
	var node = self
	while node:
		node.emit_signal("changed")
		node = node.parent
# ------------------------------------------------------------------------------
# Returns a deep copy of the layout.
#
# Use this instead of `Resource.duplicate(true)` to ensure objects have the
# right script and parenting is correctly set for each node.
func clone():
	assert(false, "FIXME: implement on child")
# ------------------------------------------------------------------------------
# Returns whether there are any nodes
func empty() -> bool:
	return true
# ------------------------------------------------------------------------------
# Returns all tab names in this node
func get_names() -> PoolStringArray:
	return PoolStringArray()
### -----------------------------------------------------------------------------------------------

### Private Methods -------------------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------


