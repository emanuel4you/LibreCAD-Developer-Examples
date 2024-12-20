// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

con_test                                        // dialog name
: dialog 
{
    label = "Concatenation Test";               // give it a label
    ok_cancel;                                  // predifined Ok/Cancel
    : concatenation                             // define concatenation
    {
        : text_part                             // define text_part
        {
            label = "LibreLisp©";               // give it some text
            is_bold = true;
        }
        : text_part                             // define more text_part
        {
            label = "designed and created";     // some more text
            height = 10;
        }                                       // end text
        : text_part                             // define more text
        {
            label = "by LibreCAD©";             // define more text_part
            height = 10;
        }                                       // end text
    }                                           // end paragraph
}                                               // end dialog
