#
#   888888 888888 Yb  dP 888888 88""Yb  dP"Yb  Yb  dP
#     88   88__    YbdP    88   88__dP dP   Yb  YbdP
#     88   88""    dPYb    88   88""Yb Yb   dP  dPYb
#     88   888888 dP  Yb   88   88oodP  YbodP  dP  Yb   V 1.0 for Godot 2.1.4
#
#   Copyright (C) 2018 TheRedPlanet (https://github.com/RubrumExPlaneta/)
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

extends Node2D

func _ready():
	get_node("../TextBox").display(["1 2 3 4\n1234","The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog. The quick brown fox jumps over the lazy dog.", "This text features no name, portrait or voice. How curious."], ["Dude", "Another Dude", null], ["icon.png", "icon.png", null], ["Sounds/Voice01.smp", "Sounds/Voice01.smp", null])
