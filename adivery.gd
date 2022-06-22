extends Node

# ----- Adivery plugin signels ---
#"on_rewarded_done"
#"on_opened"
#"on_closed"
#"on_expiring"
#"on_no_ad_available"
#"on_error"
#"on_no_network"
#"native_ad_filled"

var adiveryPlugin
var adivery_plugin_name = "GodotAdiveryPlugin"


func _ready():
	if Engine.has_singleton(adivery_plugin_name):
		adiveryPlugin = Engine.get_singleton(adivery_plugin_name)
		adiveryPlugin.initPlugin()
	else:
		print("Could not load plugin: ", adivery_plugin_name)
	

