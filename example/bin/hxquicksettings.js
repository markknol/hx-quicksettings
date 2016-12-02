(function (console) { "use strict";
var HxOverrides = function() { };
HxOverrides.__name__ = true;
HxOverrides.dateStr = function(date) {
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var h = date.getHours();
	var mi = date.getMinutes();
	var s = date.getSeconds();
	return date.getFullYear() + "-" + (m < 10?"0" + m:"" + m) + "-" + (d < 10?"0" + d:"" + d) + " " + (h < 10?"0" + h:"" + h) + ":" + (mi < 10?"0" + mi:"" + mi) + ":" + (s < 10?"0" + s:"" + s);
};
var Main = function() {
	var _g = this;
	var panel1 = QuickSettings.create(10,10,"Panel 1").addRange("Range",0,100,30,1,function(value) {
		_g.panel4.setText("Output","" + "Range" + ": " + (value == null?"null":"" + value));
	}).addNumber("Number",0,100,50,1,function(value1) {
		_g.panel4.setText("Output","" + "Number" + ": " + (value1 == null?"null":"" + value1));
	}).addColor("Color","#ff0000",function(value2) {
		_g.panel4.setText("Output","" + "Color" + ": " + (value2 == null?"null":"" + value2));
	}).addBoolean("Boolean",true,function(value3) {
		_g.panel4.setText("Output","" + "Boolean" + ": " + (value3 == null?"null":"" + value3));
	}).addText("Text","some text",function(value4) {
		_g.panel4.setText("Output","" + "Text" + ": " + (value4 == null?"null":"" + value4));
	}).addTextArea("TextArea","a whole bunch of text can go here",function(value5) {
		_g.panel4.setText("Output","" + "TextArea" + ": " + (value5 == null?"null":"" + value5));
	}).addButton("Button",function() {
		_g.panel4.setText("Output","" + "Button" + ": " + "clicked");
	}).addHTML("Info","Info. This is a description...");
	var canvas;
	var _this = window.document;
	canvas = _this.createElement("canvas");
	canvas.width = 100;
	canvas.height = 100;
	var context = canvas.getContext("2d");
	context.beginPath();
	context.fillStyle = "red";
	context.arc(50,50,50,0,Math.PI * 2);
	context.fill();
	var panel2 = QuickSettings.create(250,10,"Panel 2").addDropDown("DropDown",["one","two","three"],function(value6) {
		_g.panel4.setText("Output","" + "DropDown" + ": " + (value6.value == null?"null":"" + value6.value));
	}).addImage("Image","boyhowdy.jpg").addProgressBar("ProgressBar",100,50).addElement("Element (canvas)",canvas);
	var panel3 = QuickSettings.create(490,10,"Panel3").addHTML("HTML","<b>bold</b> <u>underline</u> <i>italic</i><ol><li>one</li><li>two</li><li>three</li>").addPassword("Password","12345678",function(value7) {
		_g.panel4.setText("Output","" + "Password" + ": " + (value7 == null?"null":"" + value7));
	}).addDate("Date","2016-07-11",function(value8) {
		_g.panel4.setText("Output","" + "Date" + ": " + (value8 == null?"null":"" + value8));
	}).addTime("Time","06:03:25",function(value9) {
		_g.panel4.setText("Output","" + "Time" + ": " + (value9 == null?"null":"" + value9));
	});
	this.panel4 = QuickSettings.create(730,10,"Output Panel").addTextArea("Output");
	this.panel5 = QuickSettings.create(730,200).addFileChooser("file chooser","pick an image...","image/*",$bind(this,this.onFileChosen)).addTextArea("file info","").setTextAreaRows("file info",10).addImage("image","");
	var json = "{\r\n\t\t\t\"title\": \"Live Parse Demo\",\r\n\t\t\t\"x\": 490,\r\n\t\t\t\"y\": 350,\r\n\t\t\t\"draggable\": true,\r\n\t\t\t\"collapsible\": true,\r\n\t\t\t\"snapToGrid\": true,\r\n\t\t\t\"gridSize\": 10,\r\n\t\t\t\"controls\": [{\r\n\t\t\t\t\"type\": \"range\",\r\n\t\t\t\t\"title\": \"range test\",\r\n\t\t\t\t\"min\": 0,\r\n\t\t\t\t\"max\": 100,\r\n\t\t\t\t\"value\": 50,\r\n\t\t\t\t\"step\": 1\r\n\t\t\t},{\r\n\t\t\t\t\"type\": \"textarea\",\r\n\t\t\t\t\"title\": \"text area test\",\r\n\t\t\t\t\"value\": \"just some text\"\r\n\t\t\t},{\r\n\t\t\t\t\"type\": \"boolean\",\r\n\t\t\t\t\"title\": \"boolean test\",\r\n\t\t\t\t\"value\": true\r\n\t\t\t}]\r\n\t\t}";
	var panel6 = QuickSettings.parse(json);
	var settings = QuickSettings.create(970,10,"HTML demo").addHTML("info","Since all the previous demos were canvas-based, I just wanted to show that there's no dependency on canvas here.").addHTML("info2","Most of this is done through direct binding on the HTML objects.").addHTML("info3","The fontSize control needs a callback because we have to add a unit (px or whatever)").bindText("title",window.document.title,window.document).bindColor("backgroundColor","#ffffff",window.document.body.style).bindText("innerHTML","Hello world",window.document.getElementsByTagName("h1")[0]).bindDropDown("fontFamily",["serif","sans-serif","monospace","cursive"],window.document.body.style);
	settings.addRange("fontSize",1,40,16,1,function(value10) {
		window.document.getElementsByTagName("p")[0].style.fontSize = value10 + "px";
	});
};
Main.__name__ = true;
Main.main = function() {
	window.document.addEventListener("DOMContentLoaded",function(e) {
		new Main();
	});
};
Main.prototype = {
	onFileChosen: function(file) {
		window.console.log(file);
		this.panel5.setText("file info","name: " + file.name + "\n\nsize: " + file.size + " bytes\n\ndate: " + Std.string(file.lastModifiedDate) + "\n\ntype: " + file.type);
		this.panel5.setImageURL("image",URL.createObjectURL(file));
	}
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str2 = o[0] + "(";
				s += "\t";
				var _g1 = 2;
				var _g = o.length;
				while(_g1 < _g) {
					var i1 = _g1++;
					if(i1 != 2) str2 += "," + js_Boot.__string_rec(o[i1],s); else str2 += js_Boot.__string_rec(o[i1],s);
				}
				return str2 + ")";
			}
			var l = o.length;
			var i;
			var str1 = "[";
			s += "\t";
			var _g2 = 0;
			while(_g2 < l) {
				var i2 = _g2++;
				str1 += (i2 > 0?",":"") + js_Boot.__string_rec(o[i2],s);
			}
			str1 += "]";
			return str1;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) str += ", \n";
		str += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
};
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; }
String.__name__ = true;
Array.__name__ = true;
Date.__name__ = ["Date"];
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
