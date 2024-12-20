// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

radio_row_test                                          // dialog name
: dialog
{
    label = "Radio Row Test";                           // give it a label
    : radio_row                                         // define radio row
    {
        label = "Row";                                  // give it a label
        : radio_button                                  // define radio button
        {
            key = "rb1";                                // give it a name
            label = "Bolt Holes &Site";                 // give it a label
            value = "1";                                // switch it on
        }                                               // end definition
        : radio_button                                  // define radio button
        {
            key = "rb2";                                // give it a name
            label = "Bolt Holes Sho&p";                 // give it a label
        }                                               // end definition
        : radio_button                                  // define radio button
        {
            key = "rb3";                                // give it a name
            label = "Bolt Holes &Hidden";               // give it a label
        }                                               // end definition
        : radio_button                                  // define radio button
        {
            key = "rb4";                                // give it a name
            label = "Bolt Holes &Ctsnk";                // give it a label
        }                                               // end definition
    }
    ok_cancel;                                          // predefined Ok/Cancel button
}                                                       // end dialog
