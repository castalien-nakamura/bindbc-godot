extends Node2D

var poet: PoetClass = null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.poet = PoetClass.new()
	print(self.poet.get_reference_count())
