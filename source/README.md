```python
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
```

# Cheat Sheet

## `display(_dialogue, _names=null, _portraits=null, _voices=null, _shake_amplitudes=null, _shake_wavelength_multipliers=null)`

`_dialogue` : An array containing each string of the dialogue.

`_names` : Optional, defaults to an array filled with `null`. An array containing the speaker's name for each string of the dialogue. Will show no name when this is `null`.

`_portraits` : Optional, defaults to an array filled with `null`. An array containing the path to the portrait (relative to res://) for each string of the dialogue. Will show no portrait when this is `null`.

`_voices` : Optional, defaults to an array filled with `null`. An array containing the path to the voice (relative to res://) for each string of the dialogue. Typing will be silent when this is `null`.

`_shake_amplitudes` : Optional, defaults to an array filled with `null`. An array containing the amplitude of the sine wave used for the shaking effect for each string of the dialogue. Text will not shake (the amplitude of the sine wave will be 0) when this is `null`.

`_shake_wavelength_multipliers` : Optional, defaults to an array filled with `null`. An array containing what number to multiply the wavelength of the sine wave used for the shaking effect by, for each string of the dialogue. The wavelenth of the sine wave used for the shake effect will not be altered (be multiplied by 1) when this is `null`.

## Script Variables

**Font** : The directory to the font for the dialogue.

**Name Font** : The directory to the font for the names. Will give an error when you try to use names without specifying this!

**Typing Effect** : Whether or not the typing effect is activated.

**Trigger** : The `Action` that will trigger (proceed with the dialog) the TextBox (the "z" key in many modern JRPG's).


## Layout Customization

You can move the child nodes of the TextBox scene to customize the layout of the textbox. Here is the list of those child nodes.

**p1** : A `Position2D` node. Change this to change the left-top corner of the text.

**p2** : A `Position2D` node. Change this to change the left-top corner of the text.

**Timer** : A `Timer` node. Change the Wait Time here to change the speed of the typing effect. Don't touch anything else unless you know what you're doing.

**Voice** : A `SamplePlayer` node that plays the voice. You probably won't ever need to touch this.

**Portrait** : A `Position2D` node. Change this to change the position of the portrait.

**Name** : A `Position2D` node. Change this to change the position of the name.
