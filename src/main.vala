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

int main (string[] args) {
	var app = new Gtk.Application ("org.gnome.Designtablets", ApplicationFlags.FLAGS_NONE);
	app.activate.connect (() => {
	    /* Declare variables */

		var win = app.active_window;
		var header = new Gtk.HeaderBar();
        var tabletswitch = new Gtk.Switch();

		//var for the tablet model selection list
		var seltablet_list = new Gtk.ComboBox();
        var active_id = 0;
        var default_image = new Gtk.Image();
		//var for pen buttons properties
		var tabletprop_button1 = new Gtk.ComboBox();
		var tabletprop_button2 = new Gtk.ComboBox();
		//var for click sensitivity and double click time and Default(reset) button
		var tabletprop_clicksens = new Gtk.Scale.with_range (Gtk.Orientation.VERTICAL, 0.0, 100.0, 5.0);
        var tabletprop_clicktime = new Gtk.Scale.with_range (Gtk.Orientation.VERTICAL, 0.0, 100.0, 5.0);
        var clicksens_adjust = new Gtk.Adjustment (42.0, 0.0, 100.0, 5.0, 10.0, 0.0);
        var clicktime_adjust = new Gtk.Adjustment (42.0, 0.0, 100.0, 5.0, 10.0, 0.0);
        var penclicksens_default_bt = new Gtk.Button();

        //var for monitor list selection and Update Screens button
        var tabletprop_monitor_list = new Gtk.ComboBox();
        var tabletprop_updatescreen_bt = new Gtk.Button();

        //var for Tablet Screen Entries
        var tabletscreen_entry1 = new Gtk.Entry();
        var tabletscreen_entry2 = new Gtk.Entry();
        var tabletscreen_entry3 = new Gtk.Entry();
        var tabletscreen_entry4 = new Gtk.Entry();
        //var for displaying the screen
        var tabletscreen_show = new Gtk.EventBox();

        //var for Tablet hand modes
        var handmode = null;
        var lefhand = new Gtk.RadioButton(handmode);
        var righthand = new Gtk.RadioButton(handmode);

        //var for additional Tablet properties such as pressure,adv settings,express keys, default buttons
        var pressure_test = new Gtk.Button();
        var advance_settings = new Gtk.Button();
        var express_keys = new Gtk.Button();
        var defaults_setting = new Gtk.Button();

        //var for main application buttons (OK, Cancel, Apply)
        var app_ok = new Gtk.Button();
        var app_apply = new Gtk.Button();
        var app_cancel = new Gtk.Button();

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
        seltablet_list.set_active(0);
        default_image.set_from_file ("tablet_default.svg");

        //check to see if changed
        //seltablet_list.changed.connect(item_changed);
        /* Signal handler for the 'changed' signal of the seltablet_list. */
        if (seltablet_list.get_active () != 0){
            print ("It works!");
        } else {
            static GtkWidget*
              create_image (void)
              {
                GtkWidget *image;
                GtkWidget *event_box;

                image = gtk_image_new_from_file ("myfile.png");

                event_box = gtk_event_box_new ();

                gtk_container_add (GTK_CONTAINER (event_box), image);

                g_signal_connect (G_OBJECT (event_box),
                                  "button_press_event",
                                  G_CALLBACK (button_press_callback),
                                  image);

                return image;
              }
        }
		if (win == null) {
			win = new Designtablets.Window (app);
			win.set_titlebar(header);
			win.destroy.connect(Gtk.main_quit);
		}
		win.show_all ();
	});

	return app.run (args);
}
