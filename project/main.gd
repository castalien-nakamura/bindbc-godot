extends Node2D

var poet: PoetTest = null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.poet = PoetTest.new()
	print(self.poet.get_reference_count())
	self.poet.test_method()
