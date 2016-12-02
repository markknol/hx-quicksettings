package quicksettings;

import js.html.HtmlElement;
import js.html.Element;

import haxe.extern.EitherType;

/**
	QuickSettings is a JavaScript library for making a quick settings panel to control code parameters.
	
	@website: <https://github.com/bit101/quicksettings>  
	@licence: MIT  
	@version: 2.1  
**/
@:native("QuickSettings")
extern class QuickSettings
{

	/**
		Creates a new QuickSettings Panel
		@param x     {Float}    x position of panel (default 0)
		@param y     {Float}    y position of panel (default 0)
		@param title   {String}    title of panel (default "QuickSettings")
		@param parent  {HTMLElement} parent element (default document.body)
		@returns {module:QuickSettings}  New QuickSettings Panel
	**/
	public static function create(x:Float, y:Float, ?title:String, ?parent:Element):QuickSettings;

	/**
		Creates a new QuickSettings Panel from a JSON string or object.
		@param json {Object|String} The JSON string or object to parse.
		@param parent {HTMLElement} The parent element to attach the new panel to.
		@param scope {Object} The object to look for any callbacks on.
	**/
	public static function parse(json:EitherType<QSettings, String>, ?parent:Element, ?scope:Dynamic):QuickSettings;

	/**
		Destroys the panel, removing it from the document and nulling all properties.
	**/
	public function destroy():Void;

	/**
		Creates a range slider
	**/
	public function addRange<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:T->Void):QuickSettings;

	/**
		Adds a date input. `date` String must be formatted like "YYYY-MM-DD". Or use a JS Date object
	**/
	// @:overload(function(title:String, date:Dynamic,callback:Dynamic->Void):QuickSettings{})
	public function addDate(title:String, date:EitherType<String, Date>, callback:String->Void):QuickSettings;

	/**
		Adds a time input. `time` String must be formatted like "HH-MM" or "HH:MM:SS" in 24-hour format. Or use a JS Date object
		@param title {String} The title of the control.
		@param time {String|Date} A string in the format "HH:MM", "HH:MM:SS" or a Date object.
		@param callback {Function} Callback function that will be called when the value of this control changes.
	**/
	// @:overload(function(title:String, time:Dynamic,callback:Dynamic->Void):QuickSettings{})
	public function addTime(title:String, time:EitherType<String, Date>, callback:String->Void):QuickSettings;

	/**
		Adds a number control.
		@param title {String} Title of the control.
		@param min {Float} Minimum value of control.
		@param max {Float} Maximum value of control.
		@param value {Float} Initial value of control.
		@param step {Float} Size of value increments.
		@param callback {Function} Callback function to call when control value changes.
	**/
	public function addNumber<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:T->Void):QuickSettings;

	/**
		creates a color input. `color` can be "#f00", "#ff0000", "red", "rgb(255, 0, 0)", "rgba(255, 0, 0, 1)".
	**/
	public function addColor(title:String, color:String, callback:String->Void):QuickSettings;

	/**
		Adds a password input field.
		@param title {String} The title of the control.
		@param text {String} The initial text value to put in the control.
		@param callback {Function} Callback that will be called when the value of this control changes.
	**/
	public function addPassword(title:String, text:String, callback:String->Void):QuickSettings;

	/**
		creates a checkbox
	**/
	public function addBoolean(title:String, value:Bool, callback:Bool->Void):QuickSettings;

	/**
		creates an input text:String field
	**/
	public function addText(title:String, text:String, callback:String->Void):QuickSettings;

	/**
		creates a resizable text area
	**/
	public function addTextArea(title:String, ?text:String, ?callback:String->Void):QuickSettings;

	/**
		creates a button
	**/
	public function addButton(title:String, callback:Void->Void):QuickSettings;

	/**
		creates informational text:String
		deprecated. Identical to addHTML
	**/
	@:deprecated("addInfo is deprecated, use addHTML instead")
	public function addInfo(title:String, text:String):QuickSettings;

	/**
		creates a dropdown list
	**/
	public function addDropDown<T>(title:String, items:Array<T>, callback: {index:Int, value:String}->Void):QuickSettings;

	/**
		creates and image element with the specified URL
	**/
	public function addImage(title:String, imageURL:String):QuickSettings;

	/**
		creates a progress bar
	**/
	public function addProgressBar<T:Float>(title:String, max:T, value:T, ?showNumbers:Bool):QuickSettings;

	/**
		Adds a file input control to the panel.
		Filter accepts standard media types such as "image/*", "video/*", "audio/*", a file extension, such as ".doc", ".jpg", or mime types.
		Multiple filters can be added, comma separated. See standard HTML docs for file input "accept" attribute.
		@param title {String} The title of the control.
		@param lableStr {String} The initial label on the file button. Defaults to "Choose a file...".
		@param filter {String} Species what file types the chooser will accept. See below.
		@param callback {Function} Callback function that will be called when a file is chosen.
	**/
	public function addFileChooser(title:String, labelStr:String, filter:String, callback:js.html.File->Void):QuickSettings;
	// public function addFileChooser(title:String, labelStr:String, filter:String, callback:OnFileChosen->Void):Void;

	/**
		adds any arbitrary HTML element to the panel
	**/
	public function addElement(title:String, htmlELement:Element):QuickSettings;

	/**
		adds any arbitrary HTML to the panel
	**/
	public function addHTML(title:String, htmlString:String):QuickSettings;

	@:deprecated public function getInfo(title:String):String; // use getHTML instead
	public function getTime(title:String):String;
	public function getNumber<T:Float>(title:String):T;
	public function getRangeValue<T:Float>(title:String):T;
	public function getBoolean(title:String):Bool;
	public function getColor(title:String):String;
	public function getText(title:String):String;
	public function getDate(title:String):String;
	public function getHTML(title:String):String;
	public function getFile(title:String):String;
	public function getDropDownValue<T>(title:String):T;
	public function getProgressValue<T:Float>(title:String):T;
	public function getNumberValue<T:Float>(title:String):T;
	public function getValuesAsJSON(asString:String):String;

	@:deprecated public function setInfo(title:String, text:String):QuickSettings; // use getHTML instead
	public function setTime(title:String, time:String):QuickSettings;
	public function setDate(title:String, date:String):QuickSettings;
	public function setRangeValue(title:String, value:Float):QuickSettings;
	public function setRangeParameters<T:Float>(title:String, min:T, max:T, step:T):QuickSettings;
	public function setNumberParameters<T:Float>(title:String, min:T, max:T, step:T):QuickSettings;
	public function setBoolean(title:String, value:Bool):QuickSettings;
	public function setColor(title:String, color:String):QuickSettings;
	public function setText(title:String, text:String):QuickSettings;
	public function setDropDownIndex(title:String, index:Int):QuickSettings;
	public function setImageURL(title:String, imageURL:String):QuickSettings;
	public function setProgressValue<T:Float>(title:String, value:T):QuickSettings;
	public function setNumberValue<T:Float>(title:String, value:T):QuickSettings;
	public function setHTML(title:String, html:String):Void;

	/**
		Set the number of rows in a text area (defaults to 5).
		@param title {String} The control to set the number of rows on.
		@param rows {Int} The number of rows in the text area.
	**/
	public function setTextAreaRows(title:String, rows:Int):QuickSettings;
	public function setTextAreasRows(title:String, rows:Int):QuickSettings; // probably a spelling mistake

	/**
		Remove control by title
	**/
	public function removeControl(title:String):QuickSettings;

	/**
		Disable control by title
	**/
	public function disableControl(title:String):QuickSettings;

	/**
		Enable control by title
	**/
	public function enableControl(title:String):QuickSettings;

	/**
		Set QuickSettings panel draggable or not
	**/
	public function setDraggable(value:Bool):QuickSettings;

	/**
		Hide QuickSettings panel
	**/
	public function setCollaspible(value:Bool):QuickSettings;

	/**
		Collapse QuickSettings panel
	**/
	public function collapse():QuickSettings;

	/**
		Expand QuickSettings panel
	**/
	public function expand():QuickSettings;

	/**
		Toggle collapsed state QuickSettings panel
	**/
	public function toggleCollapsed():QuickSettings;

	/**
		Show QuickSettings panel
	**/
	public function show():QuickSettings;

	/**
		Hide QuickSettings panel
	**/
	public function hide():QuickSettings;

	/**
		Show a control title
	**/
	public function showTitle(name:String):QuickSettings;

	/**
		Hide a control title
	**/
	public function hideTitle(name:String):QuickSettings;

	/**
		Hide all titles
	**/
	public function hideAllTitles():QuickSettings;

	/**
		Show all titles
	**/
	public function showAllTitles():QuickSettings;

	/**
		Show a control
	**/
	public function showControl(name:String):QuickSettings;

	/**
		Hide a control
	**/
	public function hideControl(name:String):QuickSettings;

	/**
		Enable/disable snapping controls to a grid
	**/
	public function setSnapToGrid(enabled:Bool):QuickSettings;

	/**
		Set grid snap size
	**/
	public function setGridSize(size:Float):QuickSettings;

	/**
		Toggle visibility state QuickSettings panel
	**/
	public function toggleVisibility():QuickSettings;

	/**
		Set a keyboard key that will show and hide the panel when pressed
	**/
	public function setKey(char:Int):QuickSettings;

	/**
		Override most existing style properties for controls
	**/
	public function overrideStyle(title:String, styleName:String, value:String):Void;

	/**
		Set the position of the QuickSettings panel
	**/
	public function setPosition(x:Float, y:Float):QuickSettings;

	/**
		Set the size of the QuickSettings panel
	**/
	public function setSize(w:Float, h:Float):QuickSettings;

	/**
		Set the width of the QuickSettings panel
	**/
	public function setWidth(w:Float):QuickSettings;

	/**
		Set the height of the QuickSettings panel
	**/
	public function setHeight(h:Float):QuickSettings;

	/**
		Global change handler. This callback will be called whenever any change is made to any control in this panel.
	**/
	public function setGlobalChangeHandler(callback:Dynamic->Dynamic):QuickSettings;
	// public function setGlobalChangeHandler(callback:Dynamic->Void):Void;

	public function bindRange<T:Float>(property:String, min:T, max:T, value:T, step:Float, object:Dynamic):QuickSettings;
	public function bindColor(property:String, color:String, object:Dynamic):QuickSettings;
	public function bindBoolean(property:String, value:Bool, object:Dynamic):QuickSettings;
	public function bindText(property:String, text:String, object:Dynamic):QuickSettings;
	public function bindDate(property:String, date:String, object:Dynamic):QuickSettings;
	public function bindTime(property:String, time:String, object:Dynamic):QuickSettings;
	public function bindDropDown<T>(property:String, items:Array<T>, object:Dynamic):QuickSettings;
	public function bindNumber(title:String, value:String, object:Dynamic):Void;
	public function bindPassword(title:String, text:String, object:Dynamic):Void;
	public function bindTextArea(title:String, text:String, object:Dynamic):Void;
}

typedef QSettings =
{
	/** optional string, default "QuickSettings" **/
	@optional var title : String;

	/** optional number, default 0 **/
	@optional var x : Int;

	/** optional number, default 0 **/
	@optional var y : Int;

	/** optional bool,   default true **/
	@optional var draggable : Bool;

	/** optional bool,   default true **/
	@optional var collapsible : Bool;

	/** optional bool,   default false **/
	@optional var snapToGrid : Bool;

	/** optional number  default 0 **/
	@optional var gridSize : Int;

	/** optional array of control objects **/
	@optional var controls : Array<QControls>;
}

typedef QControls =
{
	/** required string **/

	var type : String;
	/** required string **/

	var title : String;
	/**
		optional value:

		- number or string for most controls.
		- bool for boolean
		- array of option labels for dropdown
		- not used for button
	**/
	@optional var value : Dynamic;

	/** optional number (range and number only) **/
	@optional var min : Int;

	/** optional number (range, number, progressbar only) **/
	@optional var max : Int;

	/** optional number (range and number only) **/
	@optional var step : Int;

	/** optional string - maps to function name on scope object, **/
	@optional var callback : Dynamic;

	/** optional string (file chooser) **/
	@optional var labelStr : String;

	/** optional string (file chooser) **/
	@optional var filter : String;
}