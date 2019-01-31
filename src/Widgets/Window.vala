
// in order to call another class, here we are using MyApp (which is a window instance of
// the window. MyApp is used here so that vala can reference the namespace here and there)
public class Jarvis.Window : Gtk.ApplicationWindow {
    public Window (Application application) {
        Object (
            application: application
        );
    }

    construct {
        title = "This is my Vala Test";
        window_position = Gtk.WindowPosition.CENTER;
        set_default_size (800, 600);

        var settings = new GLib.Settings ("com.github.sollymay.jarvis");
        move (settings.get_int("pos-x"), settings.get_int("pos-y"));
        show_all ();
    }
}