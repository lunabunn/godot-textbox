```python
#
#   888888 888888 Yb  dP 888888 88""Yb  dP"Yb  Yb  dP
#     88   88__    YbdP    88   88__dP dP   Yb  YbdP
#     88   88""    dPYb    88   88""Yb Yb   dP  dPYb
#     88   888888 dP  Yb   88   88oodP  YbodP  dP  Yb   V 1.0 for Godot 2.1.4
#
#   Created by TheRedPlanet (https://github.com/RubrumExPlaneta) 2018
#   Licensed under CC BY-SA 4.0 International, view LICENSE.md for additional info
#
```

This is a simple, highly customizable *JRPG-style dialogue box asset* I created for **Godot 2.1.4**. This might work on other versions of Godot, but I will only make bug fixes and such for Godot 2.1.4–please do not submit bug reports/pull requests for other versions of Godot.

## What this asset **CAN** do out of the box...
    * Text Boxes (with customizable layout)
    * Name Tags (per dialog)
    * Face Chips (or, portraits, per dialog)
    * Typing effect (with customizable speed and skip feature)
    * Shaking text (with customizable strength/speed)
    * Automatic Line Breaks

## What this asset **CANNOT** do out of the box...
    * Formatted text (bold**, italic, color, etc.)
    * Partial shaking effect (only part of text shaking)
    * Different Fonts
    * Name shaking effect
    * Questions
    * Transitions
    * Scrolling
    * ...and a lot of other things

## What do you mean, out of the box?
I say out of the box, because this asset is very easy to customize, and you can add many different features by making simple alterations to the code so that it fits your needs. (If you do decide to add new features, you will have to distribute it under the CC BY-SA 4.0 International license so that others can use it, or, even better, submit a pull request)

## Will new features be added in the future?
Maybe? I might be adding some features if and when I need them myself, but after I add all the features listed in the TO-DO list above (if I ever do), I don't really think I'll be actively adding any more features. Nevertheless–if you have suggestions, try submitting them to [https://github.com/RubrumExPlaneta/godot-textbox/issues](https://github.com/RubrumExPlaneta/godot-textbox/issues) with the `enhancement` label. Who knows, maybe I'll implement them! :)


# Examples
Here is a screenshot of [the demo project](https://github.com/RubrumExPlaneta/godot-textbox/tree/master/demo/TextBox_demo).

![](https://github.com/RubrumExPlaneta/godot-textbox/raw/master/demo/screenshot.png)

Here are some pictures of what this asset can be used to create. Please do note, however, that these text boxes weren't *actually* created with this asset.

![](https://rpgbrunch.files.wordpress.com/2014/03/persona-4-screenshot-1.jpg)

![](https://i.imgur.com/kXnm5bs.jpg)

![](http://toucharcade.com/wp-content/uploads/2014/10/Photo-2014-10-02-11-56-19.jpg)

# Download Instructions
If you want to use this in your game, simply clone the contents of [the source folder](https://github.com/RubrumExPlaneta/godot-textbox/tree/master/source) into your Godot project folder and *Instance* the `TextBox.tscn` scene to whatever scene(s) you want to use the text box in. If you want a working demo, import [the demo project](https://github.com/RubrumExPlaneta/godot-textbox/tree/master/demo/TextBox_demo) into Godot.
