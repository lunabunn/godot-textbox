extends Node2D

func _ready():
	get_node("../TextBox").display(["1 2 3 4\n1234","The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.", "This text features no name, portrait or voice. How curious."], ["Dude", "Another Dude", null], ["icon.png", "icon.png", null], ["Sounds/Voice01.smp", "Sounds/Voice01.smp", null])
