
// in order to call another class, here we are using MyApp (which is a window instance of
// the window. MyApp is used here so that vala can reference the namespace here and there)
public class Jarvis.Window : Gtk.ApplicationWindow {
    // we added the Glib.Settings on top to be able to use it globally within the method
    public GLib.Settings settings;
    public Window (Application application) {
        Object (
            application: application
        );
    }

    construct {
        //  title = "This is my Vala Test";
        window_position = Gtk.WindowPosition.CENTER;
        set_default_size (800, 600);

        settings = new GLib.Settings ("com.github.sollymay.jarvis");
        move (settings.get_int("pos-x"), settings.get_int("pos-y"));
        resize (settings.get_int("window-width"), settings.get_int("window-height"));

        delete_event.connect (e => {
            return before_destroy ();
        });

        var headerbar = new Jarvis.HeaderBar();
        set_titlebar (headerbar);
        show_all ();
    }
    // this method is a custom method we use to intercept the destroy signal (do something before the app is closed)
    public bool before_destroy () {
        int width, height, x, y;

        get_size(out width, out height);
        get_position(out x, out y);

        settings.set_int("pos-x", x);
        settings.set_int("pos-y", y);
        settings.set_int("window-width", width);
        settings.set_int("window-height", height);

        return false;
    }
}