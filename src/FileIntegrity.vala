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

  public FileIntegrity(){
    Object(
      application_id: "net.bugabinga.eos.FileIntegrity",
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  protected override void activate(){
    var main_window = new Gtk.ApplicationWindow(this);
    main_window.default_width = 400;
    main_window.default_height = 350;
    main_window.title = _("Validate integrity of your files");
    main_window.window_position = Gtk.WindowPosition.CENTER;

    var scrollBox = new Gtk.ScrolledWindow(null,null);
    main_window.add(scrollBox);

    var listBox = new Gtk.ListBox();
    scrollBox.add(listBox);

    //sample content to test list box
    for(var i = 0; i < 1500; ++i){
       listBox.add(new Gtk.Label(_(@"Element Nr. $i")));
    }

    main_window.show_all();
  }

  public static int main(string[] command_line_arguments){
    return new FileIntegrity().run(command_line_arguments);
  }
}
