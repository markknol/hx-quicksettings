package;

import quicksettings.QuickSettings;

import js.Browser;
import js.html.CanvasElement;

/**
 * @author Matthijs Kamstra aka[mck]
 */
class Main {

	var window = Browser.window;
	var document = Browser.document;

	var panel4 : QuickSettings;
	var panel5 : QuickSettings;

	public function new () {

		var panel1 = QuickSettings.create(10, 10, "Panel 1");
		panel1.addRange("Range", 0, 100, 30, 1, function(value) { output("Range", Std.string(value));});
		panel1.addNumber("Number", 0, 100, 50, 1, function(value) { output("Number", Std.string(value));});
		panel1.addColor("Color", "#ff0000", function(value) { output("Color", Std.string(value));});
		panel1.addBoolean("Boolean", true, function(value) { output("Boolean", Std.string(value));});
		panel1.addText("Text", "some text", function(value) { output("Text", Std.string(value));});
		panel1.addTextArea("TextArea", "a whole bunch of text can go here", function(value) { output("TextArea", Std.string(value));});
		panel1.addButton("Button", function() { output("Button", "clicked");});
		// panel1.addInfo("Info", "Info. This is a description...");
		panel1.addHTML("Info", "Info. This is a description...");

		var canvas : CanvasElement = cast (document.createElement("canvas"),CanvasElement);
		var context = canvas.getContext("2d");
		canvas.width = 100;
		canvas.height = 100;
		context.beginPath();
		context.fillStyle = "red";
		context.arc(50, 50, 50, 0, Math.PI * 2);
		context.fill();


		var panel2 = QuickSettings.create(250, 10, "Panel 2");
		panel2.addDropDown("DropDown", ["one", "two", "three"], function(value:Dynamic) { output("DropDown", value.value);});
		// panel2.addDropDown("DropDown", ["one", "two", "three"], function(value:Dynamic) { trace('$value'); trace(Type.typeof(value));trace(value.value);});
		panel2.addImage("Image", "boyhowdy.jpg");
		panel2.addProgressBar("ProgressBar", 100, 50);
		panel2.addElement("Element (canvas)", canvas);

		var panel3 = QuickSettings.create(490, 10, "Panel3");
		panel3.addHTML("HTML", "<b>bold</b> <u>underline</u> <i>italic</i><ol><li>one</li><li>two</li><li>three</li>");
		panel3.addPassword("Password", "12345678", function(value) { output("Password", Std.string(value));});
		panel3.addDate("Date", "2016-07-11", function(value) { output("Date", Std.string(value));});
		panel3.addTime("Time", "06:03:25", function(value) { output("Time", Std.string(value));});

		panel4 = QuickSettings.create(730, 10, "Output Panel");
		panel4.addTextArea("Output");


		panel5 = QuickSettings.create(730, 200);
        panel5.addFileChooser("file chooser", "pick an image...", "image/*", onFileChosen);
        panel5.addTextArea("file info", "");
        panel5.setTextAreaRows("file info", 10);
        panel5.addImage("image", "");

        var json =
'{
  "title": "Live Parse Demo",
  "x": 490,
  "y": 350,
  "draggable": true,
  "collapsible": true,
  "snapToGrid": true,
  "gridSize": 10,
  "controls": [
    {
      "type": "range",
      "title": "range test",
      "min": 0,
      "max": 100,
      "value": 50,
      "step": 1
    },
    {
      "type": "textarea",
      "title": "text area test",
      "value": "just some text"
    },
    {
      "type": "boolean",
      "title": "boolean test",
      "value": true
    }
  ]
}';


        var panel6 = QuickSettings.parse(json);

	}

	function output(name:String, value:String) {
		panel4.setText("Output", name + " : " + value);
	}

	function onFileChosen(file) {
        Browser.console.log(file);
        panel5.setText("file info", "name: " + file.name + "\n\nsize: " + file.size + " bytes\n\ndate: " + file.lastModifiedDate + "\n\ntype: " + file.type);
        panel5.setImageURL("image", js.html.URL.createObjectURL(cast (file, js.html.File)));
    }

	static public function main () {
		var app = new Main ();
	}
}