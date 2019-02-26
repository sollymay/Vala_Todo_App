public class Jarvis.HeaderBar : Gtk.HeaderBar {
    construct {
        set_title("Todo App");
        set_subtitle("Because remininding is not enough");
        // set title
        // set subtitle
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
        pack_end (menu_button);
    }
}