# Created by Freeknight
# Date: 2021/12/22
# Desc：可磁性停靠分割拖拽的自适应UI面板
# @category: Category Unknown
#--------------------------------------------------------------------------------------------------
tool
extends EditorPlugin
### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------
#--- enums ----------------------------------------------------------------------------------------
#--- constants ------------------------------------------------------------------------------------
const DockableContainer = preload("./Scripts/dockable_container.gd")
const LayoutInspectorPlugin = preload("./Scripts/editor_inspector_plugin.gd")
#--- public variables - order: export > normal var > onready --------------------------------------
#--- private variables - order: export > normal var > onready -------------------------------------
var _layout_inspector_plugin
### -----------------------------------------------------------------------------------------------

### Built in Engine Methods -----------------------------------------------------------------------
func _enter_tree() -> void:
	_layout_inspector_plugin = LayoutInspectorPlugin.new()
	add_custom_type("DockableContainer", "Container", DockableContainer, null)
	add_inspector_plugin(_layout_inspector_plugin)
# ------------------------------------------------------------------------------
func _exit_tree() -> void:
	remove_inspector_plugin(_layout_inspector_plugin)
	remove_custom_type("DockableContainer")
	_layout_inspector_plugin = null
### -----------------------------------------------------------------------------------------------

### Public Methods --------------------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------

### Private Methods -------------------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------
