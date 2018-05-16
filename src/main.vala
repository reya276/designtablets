/* main.vala
 *
 * Copyright (C) 2018 Rey Angeles
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE X CONSORTIUM BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name(s) of the above copyright
 * holders shall not be used in advertising or otherwise to promote the sale,
 * use or other dealings in this Software without prior written
 * authorization.
 */
//
int main (string[] args) {
	var app = new Gtk.Application ("org.gnome.Designtablets", ApplicationFlags.FLAGS_NONE);
	app.activate.connect (() => {
	    /* Declare variables */

		var win = app.active_window;
		var header = new Gtk.HeaderBar();
        var tabletswitch = new Gtk.Switch();

		//var for the tablet model selection list
		var seltablet_list = "";
        var active_id = 0;
        var default_image = "";
		//var for pen buttons properties
		var tabletprop_button1 = "";
		var tabletprop_button2 = "";
		//var for click sensitivity and double click time and Default(reset) button
		var tabletprop_clicksens = "";
        var tabletprop_clicktime = "";
        var clicksens_adjust = "";
        var clicktime_adjust = "";
        var penclicksens_default_bt = "";

        //var for monitor list selection and Update Screens button
        var tabletprop_monitor_list = "";
        var tabletprop_updatescreen_bt = "";

        //var for Tablet Screen Entries
        var tabletscreen_entry1 = "";
        var tabletscreen_entry2 = "";
        var tabletscreen_entry3 = "";
        var tabletscreen_entry4 = "";
        //var for displaying the screen
        var tabletscreen_show = "";

        //var for Tablet hand modes
        var handmode = null;
        var lefhand = new Gtk.RadioButton(handmode);
        var righthand = new Gtk.RadioButton(handmode);

        //var for additional Tablet properties such as pressure,adv settings,express keys, default buttons
        var pressure_test = "";
        var advance_settings = "";
        var express_keys = "";
        var defaults_setting = "";

        //var for main application buttons (OK, Cancel, Apply)
        var app_ok = "";
        var app_apply = "";
        var app_cancel = "";

		//var icon = Gtk.Image.from_icon_name("app-icon", Gtk.IconSize.SMALL_TOOLBAR);
		header.set_show_close_button(true);
		header.set_title("Design Tablets");
		header.set_subtitle("An app design for non Wacom Tablets");
		//Set the Hand Mode Group
		lefhand.get_group();
		righthand.get_group();
		lefhand.set_active(true);
		righthand.set_active(false);

		//set the tablet select list to 0 and default image
        //seltablet_list.set_active(0);
        //default_image.set_from_file ("tablet_default.svg");

        //check to see if changed
        //seltablet_list.changed.connect(item_changed);
        /* Signal handler for the 'changed' signal of the seltablet_list. */

		if (win == null) {
			win = new Designtablets.Window (app);
			win.set_titlebar(header);
			win.destroy.connect(Gtk.main_quit);
		}
		win.show_all ();
	});

	return app.run (args);
}
