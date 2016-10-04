<img src="https://cloud.githubusercontent.com/assets/576184/9329463/0559a0fe-45b2-11e5-8724-3a606419ecbf.png" width=100 align=right /> 

### [Haxe](http://haxe.org) extern classes for [QuickSettings](https://github.com/bit101/quicksettings).

 > QuickSettings is a JavaScript library for making a quick settings panel to control code parameters.

<img src="https://github.com/bit101/quicksettings/blob/master/images/master_demo.png" />

## Usage in Haxe

Download and add the .[js](https://raw.githubusercontent.com/bit101/quicksettings/master/quicksettings.js) and .[css](https://raw.githubusercontent.com/bit101/quicksettings/master/quicksettings.css) files in your HTML file.
```html
<link rel="stylesheet" type="text/css" href="quicksettings.css">
<script type="text/javascript" src="quicksettings.js"></script>
```

In Haxe/JavaScript you can use the panel like this:
```haxe
import quicksettings.QuickSettings;

var settings:QuickSettings = QuickSettings.create(20, 20, "Settings");
```
**Enjoy!**

Read more at the original project: https://github.com/bit101/quicksettings
