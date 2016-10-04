package quicksettings;
import js.html.HtmlElement;
import js.html.Element;

/**
 * QuickSettings is a JavaScript library for making a quick settings panel to control code parameters.
 */
@:native("QuickSettings")
extern class QuickSettings {

  // version 2.1

  /**
   * Static method. Creates a new QuickSettings Panel
   * @param x     {Number}    x position of panel (default 0)
   * @param y     {Number}    y position of panel (default 0)
   * @param title   {String}    title of panel (default "QuickSettings")
   * @param parent  {HTMLElement} parent element (default document.body)
   * @returns {module:QuickSettings}  New QuickSettings Panel
   */
  public static function create(x:Float, y:Float, ?title:String, ?element:Element):QuickSettings;

  /**
   * Creates a new QuickSettings Panel from a JSON string or object.
   * @param json {Object|String} The JSON string or object to parse.
   * @param parent {HTMLElement} The parent element to attach the new panel to.
   * @param scope {Object} The object to look for any callbacks on.
   */
  public static function parse(json:String, ?parent:Element, ?scope:Dynamic):QuickSettings;

  /**
   * creates a range slider
   */
  public function addRange<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:T->Void):Void;

  /**
   * Adds a number control.
   * @param title {String} Title of the control.
   * @param min {Float} Minimum value of control.
   * @param max {Float} Maximum value of control.
   * @param value {Float} Initial value of control.
   * @param step {Float} Size of value increments.
   * @param callback {Function} Callback function to call when control value changes.
   */
  public function addNumber<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:T->Void):Void;

  /**
   * creates a color input
   */
  public function addColor(title:String, color:String, callback:String->Void):Void;

  /**
   * creates a checkbox
   */
  public function addBoolean(title:String, value:Bool, callback:Bool->Void):Void;

  /**
   * creates an input text:String field
   */
  public function addText(title:String, text:String, callback:String->Void):Void;

  /**
   * creates a resizable text area
   */
  public function addTextArea(title:String, ?text:String, ?callback:String->Void):Void;

  /**
   * creates a button
   */
  public function addButton(title:String, callback:Void->Void):Void;

  /**
   * creates informational text:String
   * deprecated. Identical to addHTML
   */
  @:deprecated
  public function addInfo(title:String, text:String):Void;

  /**
   * creates a dropdown list
   */
  public function addDropDown<T>(title:String, items:Array<T>, callback:Array<T>->Void):Void;

  /**
   * creates and image element with the specified URL
   */
  public function addImage(title:String, imageURL:String):Void;

  /**
   * Adds a password input field.
   * @param title {String} The title of the control.
   * @param text {String} The initial text value to put in the control.
   * @param callback {Function} Callback that will be called when the value of this control changes.
   */
  public function addPassword(title:String, text:String, callback:String->Void):Void;

  /**
   * Adds a date input control. In some browsers this will just render as a text input field, but should still retain all other functionality.
   * @param title {String} The title of the control.
   * @param date {String|Date} A string in the format "YYYY-MM-DD" or a Date object.
   * @param callback {Function} Callback function that will be called when the value of this control changes.
   * @returns {*}
   */
  public function addDate(title:String, date:String, callback:String->Void):Void;

  /**
   * Adds a time input control. In some browsers this will just render as a text input field, but should still retain all other functionality.
   * @param title {String} The title of the control.
   * @param time {String|Date} A string in the format "HH:MM", "HH:MM:SS" or a Date object.
   * @param callback {Function} Callback function that will be called when the value of this control changes.
  */
  public function addTime(title:String, time:String, callback:String->Void):Void;

  /**
   * creates a progress bar
   */
  public function addProgressBar<T:Float>(title:String, max:T, value:T, ?showNumbers:Bool):Void;

  /**
   * Adds a file input control to the panel.
   * Filter accepts standard media types such as "image/*", "video/*", "audio/*", a file extension, such as ".doc", ".jpg", or mime types.
   * Multiple filters can be added, comma separated. See standard HTML docs for file input "accept" attribute.
   * @param title {String} The title of the control.
   * @param lableStr {String} The initial label on the file button. Defaults to "Choose a file...".
   * @param filter {String} Species what file types the chooser will accept. See below.
   * @param callback {Function} Callback function that will be called when a file is chosen.
   * @returns {module:QuickSettings}
   */
  public function addFileChooser(title:String, labelStr:String, filter:String, callback:OnFileChosen->Void):Void;

  /**
   * adds any arbitrary HTML element to the panel
   */
  public function addElement(title:String, htmlElement:Element):Void;

  /**
   * adds any arbitrary HTML to the panel
   */
  public function addHTML(title:String, htmlString:String):Void;

  // getters
  @:deprecated public function getInfo(title:String):String; // use getHTML instead
  public function getRangeValue<T:Float>(title:String):T;
  public function getBoolean(title:String):Bool;
  public function getColor(title:String):String;
  public function getText(title:String):String;
  public function getDropDownValue<T>(title:String):T;
  public function getProgressValue<T:Float>(title:String):T;
  public function getDate(title:String):String;
  public function getHTML(title:String):String;
  public function getNumberValue(title:String):String;
  public function getTime(title:String):String;
  public function getFile(title:String):String;
  public function getValuesAsJSON(asString:String):String;

  // setters
  @:deprecated public function setInfo(title:String, text:String):Void; // use getHTML instead
  public function setRangeValue(title:String, value:Float):Void;
  public function setBoolean(title:String, value:Bool):Void;
  public function setColor(title:String, color:String):Void;
  public function setText(title:String, text:String):Void;
  public function setDropDownIndex(title:String, index:Int):Void;
  public function setImageURL(title:String, imageURL:String):Void;
  public function setProgressValue<T:Float>(title:String, value:T):Void;
  public function setDate(title:String, date:String):Void;
  public function setHTML(title:String, html:String):Void;
  public function setNumberValue(title:String, value:Float):Void;
  public function setTime(title:String, time:String):Void;
  public function setNumberParameters(title:String,  min:Float, max:Float, step:Float):Void;

  /**
   * Change the min, max or step of a range input.
   */
  public function setRangeParameters(title:String, min:Float, max:Float, step:Float):Void;

  /**
   * Set the number of rows in a text area (defaults to 5).
   *
   * Sets the number of rows in a text area control.
   * @param title {String} The control to set the number of rows on.
   * @param rows {Integer} The number of rows in the text area.
   */
  public function setTextAreaRows(title:String, rows:Int):Void;
  public function setTextAreasRows(title:String, rows:Int):Void;

  /**
   * Remove control by title
   */
  public function removeControl(title:String):Void;

  /**
   * Disable control by title
   */
  public function disableControl(title:String):Void;

  /**
   * Enable control by title
   */
  public function enableControl(title:String):Void;

  /**
   * Set QuickSettings panel draggable or not
   */
  public function setDraggable(value:Bool):Void;

  /**
   * Hide QuickSettings panel
   */
  public function setCollaspible(value:Bool):Void;

  // Finally, you can override most existing style properties for controls with:
  public function overrideStyle(title:String, styleName:String, value:String):Void;

/**
 * Most controls, except for the boolean (checkbox) and button controls show a title label above the actual control. You can turn this on and off for any specific control:
 */
  public function hideTitle(title:String):Void;
  public function showTitle(title:String):Void;

  public function hideAllTitles():Void;
  public function showAllTitles():Void;

  /**
   * Collapse QuickSettings panel
   */
  public function collapse():Void;

  /**
   * Expand QuickSettings panel
   */
  public function expand():Void;

  /**
   * Toggle collapsed state QuickSettings panel
   */
  public function toggleCollapsed():Void;

  /**
   * Show QuickSettings panel
   */
  public function show():Void;

  /**
   * Hide QuickSettings panel
   */
  public function hide():Void;

  /**
   * Toggle visibility state QuickSettings panel
   */
  public function toggleVisibility():Void;

  /**
   * Set a keyboard key that will show and hide the panel when pressed
   */
  public function setKey(char:Int):Void;

  /**
   * Set the position of the QuickSettings panel
   */
  public function setPosition(x:Float, y:Float):Void;

  /**
   * Set the size of the QuickSettings panel
   */
  public function setSize(w:Float, h:Float):Void;

  /**
   * Set the width of the QuickSettings panel
   */
  public function setWidth(w:Float):Void;

  /**
   * Set the height of the QuickSettings panel
   */
  public function setHeight(h:Float):Void;

  // If the panel is draggable, you can have it snap to a grid when dropped. And you can specify the size of that grid:
  public function setSnapToGrid(bool:Bool):Void;
  public function setGridSize(number:Int):Void;

  /**
   * Global change handler. This callback will be called whenever any change is made to any control in this panel.
   */
  public function setGlobalChangeHandler(callback:Dynamic->Dynamic):Void;

  public function bindRange<T:Float>(property:String, min:T, max:T, value:T, step:Float, object:Dynamic):Void;
  public function bindColor(property:String, color:String, object:Dynamic):Void;
  public function bindBoolean(property:String, value:Bool, object:Dynamic):Void;
  public function bindText(property:String, text:String, object:Dynamic):Void;
  public function bindDropDown<T>(property:String, items:Array<T>, object:Dynamic):Void;
  public function bindDate(title:String, date:String, object:Dynamic):Void;
  public function bindNumber(title:String, value:String, object:Dynamic):Void;
  public function bindPassword(title:String, text:String, object:Dynamic):Void;
  public function bindTextArea(title:String, text:String, object:Dynamic):Void;
  public function bindTime(title:String, time:String, object:Dynamic):Void;

}

typedef OnFileChosen = {
  var type : String;
  var size : String;
  var name : String;
  var lastModifiedDate : String;
}
