public class Test : Gtk.Application {
    public Test () {
        Object (
            application_id: "com.github.sollymay.test",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate(){
        build_window();
    }
    private void build_window() {
        var window = new Gtk.ApplicationWindow(this);
        window.title = "This is my Vala Test";
        window.window_position = Gtk.WindowPosition.CENTER;
        window.set_default_size (800, 600);
        window.show_all ();
    }

}


//  int main(string[] args) {
//      Gtk.init(ref args);

//      var window = new Gtk.Window();
//      window.title = "This is my Vala Test";
//      window.border_width = 10;
//      window.window_position = Gtk.WindowPosition.CENTER;
//      window.set_default_size (350, 80);

//      window.destroy.connect(Gtk.main_quit);

//      window.show_all ();

//      Gtk.main();
//      return 0;
//  }