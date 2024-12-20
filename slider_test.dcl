// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

slider_test                                             // dialog name
: dialog
{
    label = "slider";                                   // give it a label
    : edit_box                                          // define edit box
    {
         key = "eb1";                                   // give it a name
         label = "Slot &Length (O/All Slot)";           // give it a label
         edit_width = 6;                                // 6 characters only
    }                                                   // end edit box
    : slider                                            // define slider
    {
        key = "myslider";                               // give it a name
        max_value = 100;                                // upper value
        min_value = 0;                                  // lower value
        value = "50";                                   // initial value
        width = 10;                                     // initial value
        big_increment = 1;                              // initial value
    }                                                   // end slider
    ok_cancel;                                          // predefined Ok/Cancel button
}                                                       // end dialog
