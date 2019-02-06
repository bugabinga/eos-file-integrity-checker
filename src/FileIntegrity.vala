/*
 * Copyright (c) 2011-2019 bugabinga.net (https://bugabinga.net)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Oliver Jan Krylow <oliver@bugabinga.net>
 */

public class FileIntegrity: Gtk.Application
{
  private AppState state = AppState() {
    active_view = WELCOME,
    selected_file = null
  };

  public FileIntegrity(){
    Object(
      application_id: "net.bugabinga.eos.FileIntegrity",
      flags: ApplicationFlags.FLAGS_NONE
      );
  }

  protected override void activate(){
    var main_window = new Gtk.ApplicationWindow(this);
    main_window.default_width = 800;
    main_window.default_height = 600;
    main_window.window_position = Gtk.WindowPosition.CENTER;
    var header = new Gtk.HeaderBar();
    header.set_title(_("Validate integrity of your files"));
    header.set_has_subtitle(false);
    header.set_show_close_button(true);
    header.set_visible(true);
    var fileChooserButton = new Gtk.FileChooserButton(_("Choose file…"),
    Gtk.FileChooserAction.OPEN);
    fileChooserButton.file_set.connect(()=>{
      debug("File %s was selected",
            fileChooserButton.get_filename());
    });
    header.pack_start(fileChooserButton);
    var viewToggleButtons = new Gtk.ButtonBox(Gtk.Orientation.HORIZONTAL);
    viewToggleButtons.set_layout(Gtk.ButtonBoxStyle.EXPAND);
    var recentsButton = new Gtk.ToggleButton.with_label(_("Recent"));
    var downloadsButton = new Gtk.ToggleButton.with_label(_("Downloads"));
    viewToggleButtons.add(recentsButton);
    viewToggleButtons.add(downloadsButton);
    header.pack_end(viewToggleButtons);
    main_window.set_titlebar(header);
    var scrollBox = new Gtk.ScrolledWindow(null,null);
    main_window.add(scrollBox);
    var welcome = new WelcomeView();
    scrollBox.add(welcome);
    main_window.show_all();
  }

  public static int main(string[] command_line_arguments){
    return new FileIntegrity().run(command_line_arguments);
  }
}
