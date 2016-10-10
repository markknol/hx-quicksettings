package quicksettings;
import js.html.HtmlElement;

/**
 * QuickSettings is a JavaScript library for making a quick settings panel to control code parameters.
 */
@:native("QuickSettings")
extern class QuickSettings {

  public static function create(x:Float, y:Float, ?panelTitle:String, ?parent:js.html.DOMElement):QuickSettings;

  /**
   * creates a range slider
   */
  public function addRange<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:T->Void):QuickSettings;
    
  /**
   * adds a date input. `date` String must be formatted like "YYYY-MM-DD". Or use a JS Date object
   */
  @:overload(function(title:String, date:Dynamic,callback:Dynamic->Void):QuickSettings{})
  public function addDate(title:String, date:String, callback:Dynamic->Void):QuickSettings;                   
  
  /**
   * adds a time input. `time` String must be formatted like "HH-MM" or "HH:MM:SS" in 24-hour format. Or use a JS Date object
   */
  @:overload(function(title:String, time:Dynamic,callback:Dynamic->Void):QuickSettings{})
  public function addTime(title:String, time:String, callback:Dynamic->Void):QuickSettings;
  
  /**
   * creates a number input
   */
  public function addNumber<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:Dynamic->Void):QuickSettings;
  
  /**
   * creates a color input. `color` can be "#f00", "#ff0000", "red", "rgb(255, 0, 0)", "rgba(255, 0, 0, 1)".
   */
  public function addColor(title:String, color:String, callback:String->Void):QuickSettings;

  /**
   * adds a password text field
   */
  public function addPassword(title:String, text:String, callback:String->Void):QuickSettings;   

  /**
   * creates a checkbox
   */
  public function addBoolean(title:String, value:Bool, callback:Bool->Void):QuickSettings;

  /**
   * creates an input text:String field
   */
  public function addText(title:String, text:String, callback:String->Void):QuickSettings;

  /**
   * creates a resizable text area
   */
  public function addTextArea(title:String, text:String, ?callback:String->Void):QuickSettings;

  /**
   * creates a button
   */
  public function addButton(title:String, callback:Void->Void):QuickSettings;

  /**
   * @deprecated same as add html
   * creates informational text:String
   */
  public function addInfo(title:String, text:String):QuickSettings;

  /**
   * creates a dropdown list
   */
  public function addDropDown<T>(title:String, items:Array<T>, callback:Array<T>->Void):QuickSettings;

  /**
   * creates and image element with the specified URL
   */
  public function addImage(title:String, imageURL:String):QuickSettings;

  /**
   * creates a progress bar
   */
  public function addProgressBar<T:Float>(title:String, max:T, value:T, showNumbers:Bool):QuickSettings;

  /**
   * adds a file chooser
   */
  public function addFileChooser(title:String, labelStr:String, filter:String, callback:js.html.File->Void):QuickSettings;

  /**
   * adds any arbitrary HTML element to the panel
   */
  public function addElement(title:String, htmlELement:HtmlElement):QuickSettings;

  /**
   * adds any arbitrary HTML to the panel
   */
  public function addHTML(title:String, htmlString:String):QuickSettings;

  
  public function getTime(title:String):String;
  public function getNumber<T:Float>(title:String):T;
  public function getRangeValue<T:Float>(title:String):T;
  public function getBoolean(title:String):Bool;
  public function getColor(title:String):String;
  public function getText(title:String):String;
  public function getDate(title:String):String;
  public function getInfo(title:String):String;
  public function getFile(title:String):String;
  public function getDropDownValue<T>(title:String):T;
  public function getProgressValue<T:Float>(title:String):T;
  public function getNumberValue<T:Float>(title:String):T;

  public function setTime(title:String, file:String):QuickSettings;
  public function setDate(title:String, date:String):QuickSettings;
  public function setRangeValue(title:String, value:Float):QuickSettings;
  public function setRangeParameters<T:Float>(title:String, min:T, max:T, step:T):QuickSettings;
  public function setNumberParameters<T:Float>(title:String, min:T, max:T, step:T):QuickSettings;
  public function setBoolean(title:String, value:Bool):QuickSettings;
  public function setColor(title:String, color:String):QuickSettings;
  public function setText(title:String, text:String):QuickSettings;
  public function setInfo(title:String, text:String):QuickSettings;
  public function setDropDownIndex(title:String, index:Int):QuickSettings;
  public function setImageURL(title:String, imageURL:String):QuickSettings;
  public function setProgressValue<T:Float>(title:String, value:T):QuickSettings;
  public function setNumberValue<T:Float>(title:String, value:T):QuickSettings;

  /**
   * Set the number of rows in a text area (defaults to 5).
   */
  public function setTextAreaRows(title:String, rows:Int):QuickSettings;

  /**
   * Remove control by title
   */
  public function removeControl(title:String):QuickSettings;

  /**
   * Disable control by title
   */
  public function disableControl(title:String):QuickSettings;

  /**
   * Enable control by title
   */
  public function enableControl(title:String):QuickSettings;

  /**
   * Set QuickSettings panel draggable or not
   */
  public function setDraggable(value:Bool):QuickSettings;

  /**
   * Hide QuickSettings panel
   */
  public function setCollaspible(value:Bool):QuickSettings;

  /**
   * Collapse QuickSettings panel
   */
  public function collapse():QuickSettings;

  /**
   * Expand QuickSettings panel
   */
  public function expand():QuickSettings;

  /**
   * Toggle collapsed state QuickSettings panel
   */
  public function toggleCollapsed():QuickSettings;

  /**
   * Show QuickSettings panel
   */
  public function show():QuickSettings;
  
  /**
   * Hide QuickSettings panel
   */
  public function hide():QuickSettings;

  /**
   * Toggle visibility state QuickSettings panel
   */
  public function toggleVisibility():QuickSettings;

  /**
   * Set a keyboard key that will show and hide the panel when pressed
   */
  public function setKey(char:Int):QuickSettings;

  /**
   * Set the position of the QuickSettings panel
   */
  public function setPosition(x:Float, y:Float):QuickSettings;

  /**
   * Set the size of the QuickSettings panel
   */
  public function setSize(w:Float, h:Float):QuickSettings;

  /**
   * Set the width of the QuickSettings panel
   */
  public function setWidth(w:Float):QuickSettings;

  /**
   * Set the height of the QuickSettings panel
   */
  public function setHeight(h:Float):QuickSettings;

  /**
   * Global change handler. This callback will be called whenever any change is made to any control in this panel.
   */
  public function setGlobalChangeHandler(callback:Dynamic->Dynamic):QuickSettings;

  public function bindRange<T:Float>(property:String, min:T, max:T, value:T, step:Float, object:Dynamic):QuickSettings;
  public function bindColor(property:String, color:String, object:Dynamic):QuickSettings;
  public function bindBoolean(property:String, value:Bool, object:Dynamic):QuickSettings;
  public function bindText(property:String, text:String, object:Dynamic):QuickSettings;
  public function bindDate(property:String, date:String, object:Dynamic):QuickSettings;
  public function bindTime(property:String, time:String, object:Dynamic):QuickSettings;
  public function bindDropDown<T>(property:String, items:Array<T>, object:Dynamic):QuickSettings;
}