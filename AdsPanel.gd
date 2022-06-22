extends Control

"""
	Godot Adivery plugin demo
		Created by Dorjoo Games studio
		Implemented and maintained by Mostafa Karamizade
		dorjoosoft@gmail.com
"""

var nativeBanner

# Called when the node enters the scene tree for the first time.
func _ready():
	if Engine.has_singleton(Adivery.adivery_plugin_name):
		Adivery.adiveryPlugin.prepareInterstitialAd("d0fb8b19-1122-4bc9-ssff-fbe93fd6c31d")
		Adivery.adiveryPlugin.prepareRewardedAd("c8aa1007-9988-4d10-8899-bf6f6fcde096")
		Adivery.adiveryPlugin.connect("onRewardedAdClosed", self, "on_rewarded_done")
		Adivery.adiveryPlugin.connect("onNativeAdFilled", self, "native_ad_filled")


func _on_btnRewardAd_pressed():
	Adivery.adiveryPlugin.showRewardVideoAd("c8aa1007-2f2d-4d10-ada6-bf6f6fcde096")


func on_rewarded_done(result):
	$BtnRewardAd/LblRewarded.text = "Reward: " + str(result)


func _on_BtnInterstitial_pressed():
	Adivery.adiveryPlugin.showInterstitialAd("d0fb8b19-88ff-4bc9-8855-fbe93fd6c31d")

func native_ad_filled(adParams):
	$BtnNative/RichTextLabel.text = str(adParams)
	nativeBanner = adParams
	var image = Image.new()
	if adParams["icon"] == "null":
			print("No image available!")	
	image.load_jpg_from_buffer(Marshalls.base64_to_raw(adParams["icon"]))		
	var texture = ImageTexture.new()
	texture.create_from_image(image , 4)

	# Assign to the child TextureRect node
#	icon = texture
	$BtnNative/TextureRect.texture = texture	

func _on_BtnNative_pressed():
	Adivery.adiveryPlugin.requestNativeAd("48f67b4e-99ss-4878-87cd-2fe7a5533090")


func _on_BtnNativeBannerAction_pressed():
	Adivery.adiveryPlugin.nativeAdClicked("48f67b4e-rr99-gg22-87cd-2fe7a5533090", nativeBanner["id"])
