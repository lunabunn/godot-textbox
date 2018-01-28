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

var dialogue = Array()
var portraits = Array()
export(String) var font
export(String) var name_font
export(bool) var typing_effect
export(String) var trigger
var p1
var p2
var portrait
var timer
var font_offset
var voice
var name_pos

var shake_amplitudes
var shake_wavelength_multipliers

var names
var voices

var curr_portrait

var vis_len = 0
var vis_ind = 0

func _ready():
	hide()
	font = load(font)
	name_font = load(name_font)
	font_offset = Vector2(0, font.get_height())
	p1 = get_node(String(get_path()) + "/p1").get_pos()
	p2 = get_node(String(get_path()) + "/p2").get_pos()
	portrait = get_node(String(get_path()) + "/Portrait").get_pos()
	timer = get_node(String(get_path()) + "/Timer")
	timer.connect("timeout", self, "reveal")
	voice = get_node(String(get_path()) + "/Voice")
	name_pos = get_node(String(get_path()) + "/Name").get_pos()
	set_process_input(true)
	set_fixed_process(true)

func _fixed_process(delta):
	update()

func display(_dialogue, _names=null, _portraits=null, _voices=null, _shake_amplitudes=null, _shake_wavelength_multipliers=null):
	show()
	if typing_effect:
		timer.start()
	dialogue = _dialogue
	
	if _portraits != null:
		portraits = _portraits
	else:
		portraits = Array()
		portraits.resize(dialogue.size())
	
	if (portraits[vis_ind] != null):
		curr_portrait = ImageTexture.new()
		curr_portrait.load(portraits[vis_ind])
	
	if _names != null:
		names = _names
	else:
		names = Array()
		names.resize(dialogue.size())
	
	if _voices != null:
		voices = _voices
	else:
		voices = Array()
		voices.resize(dialogue.size())
	
	var voices_setup = Array()
	for _voice in voices:
		if _voice == null:
			continue
		if voices_setup.find(_voice) == -1:
			voices_setup.append(_voice)
			voice.get_sample_library().add_sample(_voice, load(_voice))
	
	if _shake_amplitudes != null:
		shake_amplitudes = _shake_amplitudes
	else:
		shake_amplitudes = Array()
		shake_amplitudes.resize(dialogue.size())
	
	if _shake_wavelength_multipliers != null:
		shake_wavelength_multipliers = _shake_wavelength_multipliers
	else:
		shake_wavelength_multipliers = Array()
		shake_wavelength_multipliers.resize(dialogue.size())
	
	if !typing_effect:
		vis_len = dialogue[0].length()

func draw_string_extended(font, pos, string, pos2=null, shake_amplitude=0, shake_wavelength_multiplier=10, modulate=Color(1,1,1,1), clip_w=-1):
	var char
	var _pos = pos
	var temp_pos
	for char in range(string.length()):
		if string[char] == "\n":
			_pos.x = pos.x
			_pos += font_offset
		else:
			if pos2 != null:
				var temp_str = ""
				var temp_char = char
				while string[temp_char] != " " && string[temp_char] != "\n":
					temp_str += string[temp_char]
					if temp_char == string.length()-1:
						break
					else:
						temp_char += 1
				if _pos.x + font.get_string_size(temp_str).x > pos2.x:
					_pos.x = pos.x
					_pos += font_offset
			
			if shake_amplitude == 0:
				draw_string(font, _pos, string[char])
			else:
				temp_pos = _pos
				temp_pos.y -= shake_amplitude
				seed(string[char].ord_at(0) - char + _pos.x - _pos.y)
				temp_pos.y += sin((OS.get_ticks_msec() + randi()) * shake_wavelength_multiplier)*(shake_amplitude)
				draw_string(font, temp_pos, string[char], modulate, clip_w)
			_pos.x += font.get_string_size(string[char]).x

func _draw():
	if (portraits[vis_ind] != null):
		draw_texture(curr_portrait, portrait)
	if (names[vis_ind] != null):
		draw_string(name_font, name_pos + font_offset, names[vis_ind])
	var temp1
	var temp2
	if (shake_amplitudes[vis_ind] != null):
		temp1 = shake_amplitudes[vis_ind]
	else:
		temp1 = 0
	if (shake_wavelength_multipliers[vis_ind] != null):
		temp2 = shake_wavelength_multipliers[vis_ind]
	else:
		temp2 = 1
	draw_string_extended(font, p1 + font_offset, dialogue[vis_ind].substr(0, vis_len), p2 + font_offset, temp1, temp2)

func reveal():
	vis_len += 1
	if voices[vis_ind] != null && dialogue[vis_ind][vis_len-1] != " " && dialogue[vis_ind][vis_len-1] != "\n":
		var sp_voice = voice.play(voices[vis_ind])
		voice.set_pitch_scale(sp_voice, .99 + (randf()/50))
		voice.set_volume(sp_voice, .9 + (randf()/5))
	
	if vis_len == dialogue[vis_ind].length():
		timer.stop()

func _input(event):
	if event.is_action_pressed(trigger) && is_visible():
		if !typing_effect || vis_len == dialogue[vis_ind].length():
			if vis_ind+1 == dialogue.size():
				hide()
				timer.stop()
			else:
				vis_ind += 1
				vis_len = 0
				
				if (portraits[vis_ind] != null):
					curr_portrait = ImageTexture.new()
					curr_portrait.load(portraits[vis_ind])
				
				if typing_effect:
					timer.stop()
					timer.start()
				else:
					if !typing_effect:
						vis_len = dialogue[vis_ind].length()
		else:
			vis_len = dialogue[vis_ind].length()
			timer.stop()