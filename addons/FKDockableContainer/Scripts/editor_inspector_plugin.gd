# Created by Freeknight
# Date: 2021/12/22
# Desc：
# @category: 
#--------------------------------------------------------------------------------------------------
extends EditorInspectorPlugin
### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------
#--- enums ----------------------------------------------------------------------------------------
#--- constants ------------------------------------------------------------------------------------
const DockableContainer = preload("./dockable_container.gd")
const LayoutEditorProperty = preload("./layout_editor_property.gd")
#--- public variables - order: export > normal var > onready --------------------------------------
#--- private variables - order: export > normal var > onready -------------------------------------
### -----------------------------------------------------------------------------------------------

### Built in Engine Methods -----------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------

### Public Methods --------------------------------------------------------------------------------
func can_handle(object: Object) -> bool:
	return object is DockableContainer
# ------------------------------------------------------------------------------
func parse_property(
	_object: Object, _type: int, path: String, _hint: int, _hint_text: String, _usage: int
) -> bool:
	if path == "layout":
		var editor_property = LayoutEditorProperty.new()
		add_property_editor("layout", editor_property)
	return false
### -----------------------------------------------------------------------------------------------

### Private Methods -------------------------------------------------------------------------------
### -----------------------------------------------------------------------------------------------


