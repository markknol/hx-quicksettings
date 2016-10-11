package;

import quicksettings.QuickSettings;

import js.Browser;
import js.Browser.window;
import js.Browser.document;
import js.html.CanvasElement;

/**
 * @author Matthijs Kamstra aka[mck]
 */
class Main
{
	static function main () document.addEventListener("DOMContentLoaded", function(e) new Main());

	var panel4:QuickSettings;
	var panel5:QuickSettings;

	public function new ()
	{
		// demo/basic example
		var panel1 = QuickSettings.create(10, 10, "Panel 1")
			.addRange("Range", 0, 100, 30, 1, function(value) output("Range", value))
			.addNumber("Number", 0, 100, 50, 1, function(value) output("Number", value))
			.addColor("Color", "#ff0000", function(value) output("Color", value))
			.addBoolean("Boolean", true, function(value) output("Boolean", value))
			.addText("Text", "some text", function(value) output("Text", value))
			.addTextArea("TextArea", "a whole bunch of text can go here", function(value) output("TextArea", value))
			.addButton("Button", function() output("Button", "clicked"))
			.addHTML("Info", "Info. This is a description...");

		var canvas:CanvasElement = document.createCanvasElement();
		canvas.width = 100;
		canvas.height = 100;

		var context = canvas.getContext("2d");
		context.beginPath();
		context.fillStyle = "red";
		context.arc(50, 50, 50, 0, Math.PI * 2);
		context.fill();

		var panel2 = QuickSettings.create(250, 10, "Panel 2")
			.addDropDown("DropDown", ["one", "two", "three"], function(value) output("DropDown", value.value))
			.addImage("Image", "boyhowdy.jpg")
			.addProgressBar("ProgressBar", 100, 50)
			.addElement("Element (canvas)", canvas);

		var panel3 = QuickSettings.create(490, 10, "Panel3")
			.addHTML("HTML", "<b>bold</b> <u>underline</u> <i>italic</i><ol><li>one</li><li>two</li><li>three</li>")
			.addPassword("Password", "12345678", function(value) output("Password", value))
			.addDate("Date", "2016-07-11", function(value) output("Date", value))
			.addTime("Time", "06:03:25", function(value) output("Time", value));

		panel4 = QuickSettings.create(730, 10, "Output Panel")
			.addTextArea("Output");

		// filechooser example
		panel5 = QuickSettings.create(730, 200)
			.addFileChooser("file chooser", "pick an image...", "image/*", onFileChosen)
			.addTextArea("file info", "")
			.setTextAreaRows("file info", 10)
			.addImage("image", "");

		// parse example
		var json ='{
			"title": "Live Parse Demo",
			"x": 490,
			"y": 350,
			"draggable": true,
			"collapsible": true,
			"snapToGrid": true,
			"gridSize": 10,
			"controls": [{
				"type": "range",
				"title": "range test",
				"min": 0,
				"max": 100,
				"value": 50,
				"step": 1
			},{
				"type": "textarea",
				"title": "text area test",
				"value": "just some text"
			},{
				"type": "boolean",
				"title": "boolean test",
				"value": true
			}]
		}';
		var panel6 = QuickSettings.parse(json);

		// bind example
		var settings = QuickSettings.create(730 + 240, 10, "HTML demo")
			.addHTML("info", "Since all the previous demos were canvas-based, I just wanted to show that there's no dependency on canvas here.")
			.addHTML("info2", "Most of this is done through direct binding on the HTML objects.")
			.addHTML("info3", "The fontSize control needs a callback because we have to add a unit (px or whatever)")
			.bindText("title", document.title, document)
			.bindColor("backgroundColor", "#ffffff", document.body.style)
			.bindText("innerHTML", "Hello world", document.getElementsByTagName("h1")[0])
			.bindDropDown("fontFamily", ["serif", "sans-serif", "monospace", "cursive"], document.body.style);

		// can't bind directly, because we need to add "px" or other unit :(
		settings.addRange("fontSize", 1, 40, 16, 1, function(value) document.getElementsByTagName("p")[0].style.fontSize = value + "px");
	}

	inline function output<T>(name:String, value:T)
	{
		panel4.setText("Output", '$name: $value');
	}

	function onFileChosen(file:js.html.File)
	{
		Browser.console.log(file);
		panel5.setText("file info", 'name: ${file.name}\n\nsize: ${file.size} bytes\n\ndate: ${file.lastModifiedDate}\n\ntype: ${file.type}');
		panel5.setImageURL("image", js.html.URL.createObjectURL(file));
	}
}