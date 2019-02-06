public class WelcomeView : Gtk.Grid {
  construct {
    var explanation = new Granite.Widgets.Welcome(
        _("File Integrity Checker"),
        _("Validate the integrity of your files. Recently checked file will appear here, once you have picked them for validation."));
    explanation.append("document-open", _("Validate File"), _("Pick one of your files to validate."));
    add(explanation);
      var openFileTxt = _("Open file");
      var cancelTxt = _("Cancel");
      var selectFileTxt = _("Select file");
    explanation.activated.connect((_) => {
      var chooser = new Gtk.FileChooserDialog(openFileTxt,
        null,
        Gtk.FileChooserAction.OPEN,
        cancelTxt ,Gtk.ResponseType.CANCEL,
        selectFileTxt, Gtk.ResponseType.OK,
        null);
        var response = chooser.run();
        if (response == Gtk.ResponseType.OK)
         {
             var filename = chooser.get_filename();
             debug(@"Selected file $filename!");
         }
        chooser.destroy();
    });
  }
}
