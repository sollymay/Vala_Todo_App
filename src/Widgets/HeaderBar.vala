public class Jarvis.HeaderBar : Gtk.HeaderBar {
    construct {

        // set title removed since we will use a widget in that position instead
        // set subtitle same as with title
        set_show_close_button(true);
        // add button
        // adding the _() around a text, makes it translatable
        var add_button = new Gtk.Button.with_label("Add");
        // adding elementary os default css suggested-action styling
        add_button.get_style_context ().add_class ("suggested-action");
        // if we don't use this, then button will span all space vertically within HeaderBar
        add_button.valign = Gtk.Align.CENTER;
        // pack_start is a method from HeaderBar class that moves button to start of HeaderBar
        pack_start (add_button);
        // add icon button --> submenu (popup menu)
        var menu_button = new Gtk.Button.from_icon_name("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
        menu_button.valign = Gtk.Align.CENTER;

        var stack_switcher = new Gtk.StackSwitcher ();
        var stack = new Gtk.Stack ();
        stack_switcher.stack = stack;

        // creating the two Grids (views on top)
        var outstanding = new Gtk.Grid();
        outstanding.add (new Gtk.Label("Outstanding Page"));
        var completed = new Gtk.Grid();
        completed.add (new Gtk.Label("Complete Page"));

        stack.add_titled(outstanding, "outstanding", "Outstanding");
        stack.add_titled(completed, "completed", "Completed");

        set_custom_title (stack_switcher);
        pack_end (menu_button);
    }
}