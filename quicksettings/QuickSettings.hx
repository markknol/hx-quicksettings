package quicksettings;
import js.html.HtmlElement;

/**
 * QuickSettings is a JavaScript library for making a quick settings panel to control code parameters.
 */
@:native("QuickSettings")
extern class QuickSettings {

  public static function create(x:Float, y:Float, panelTitle:String):QuickSettings;
  
  /**
   * creates a range slider
   */
  public function addRange<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:T->Void):Void;
  
  /**
   * adds a date input. `date` must be formatted like "YYYY-MM-DD"
   */
  public function addDate(title:String, date:String, callback:String->Void):Void;
  
  /**
   * adds a time input. `time` must be formatted like "HH-MM" or "HH:MM:SS" in 24-hour format.
   */
  public function addTime(title:String, time:String, callback:String->Void):Void;
  
  /**
   * creates a number input
   */
  public function addNumber<T:Float>(title:String, min:T, max:T, value:T, step:T, callback:T->Void):Void;
  
  /**
   * creates a color input. `color` can be "#f00", "#ff0000", "red", "rgb(255, 0, 0)", "rgba(255, 0, 0, 1)".
   */
  public function addColor(title:String, color:String, callback:String->Void):Void;
  
  /**
   * adds a password text field
   */
  public function addPassword(title:String, text:String, callback:String->Void):Void;
  
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
  public function addTextArea(title:String, text:String, callback:String->Void):Void;
  
  /**
   * creates a button
   */
  public function addButton(title:String, callback:Void->Void):Void;
  
  /**
   * creates informational text:String
   */
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
   * creates a progress bar
   */
  public function addProgressBar<T:Float>(title:String, max:T, value:T, showNumbers:Bool):Void;
  
  /**
   * adds a file chooser
   */
  public function addFileChooser(title:String, labelStr:String, filter:String, callback:Void->Void):Void;

  /**
   * adds any arbitrary HTML element to the panel
   */
  public function addElement(title:String, htmlELement:HtmlElement):Void;

  /**
   * adds any arbitrary HTML to the panel
   */
  public function addHTML(title:String, htmlString:String):Void;
  
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
  
  public function setTime(title:String, file:String):String;
  public function setDate(title:String, date:String):String;
  public function setRangeValue(title:String, value:Float):Void;
  public function setRangeParameters<T:Float>(title:String, min:T, max:T, step:T):Void;
  public function setNumberParameters<T:Float>(title:String, min:T, max:T, step:T):Void;
  public function setBoolean(title:String, value:Bool):Void;
  public function setColor(title:String, color:String):Void;
  public function setText(title:String, text:String):Void;
  public function setInfo(title:String, text:String):Void;
  public function setDropDownIndex(title:String, index:Int):Void;
  public function setImageURL(title:String, imageURL:String):Void;
  public function setProgressValue<T:Float>(title:String, value:T):Void;
  public function setNumberValue<T:Float>(title:String, value:T):Void;
  
  /**
   * Change the min, max or step of a range input.
   */
  public function setRangeParameters(title:String, min:Float, max:Float, step:Float):Void;
  
  /**
   * Set the number of rows in a text area (defaults to 5).
   */
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
  
  /**
   * Global change handler. This callback will be called whenever any change is made to any control in this panel.
   */
  public function setGlobalChangeHandler(callback:Dynamic->Dynamic):Void;
  
  public function bindRange<T:Float>(property:String, min:T, max:T, value:T, step:Float, object:Dynamic):Void;
  public function bindColor(property:String, color:String, object:Dynamic):Void;
  public function bindBoolean(property:String, value:Bool, object:Dynamic):Void;
  public function bindText(property:String, text:String, object:Dynamic):Void;
  public function bindDate(property:String, date:String, object:Dynamic):Void;
  public function bindTime(property:String, time:String, object:Dynamic):Void;
  public function bindDropDown<T>(property:String, items:Array<T>, object:Dynamic):Void;
}
