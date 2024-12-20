// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

spacer1_test                            // dialog name
: dialog
{
    label = "Spacer 1 Test";            // give it a label
    : button                            // define button
    {
        key = "btn1";                   // give it a name
        label = "Button 1";             // give it a label
        fixed_width = true;             // fix it's width
        alignment = centered;           // center it
    }                                   // end button
    spacer_1;                           // define space_1
    : button                            // define button
    {
        key = "btn2";                   // give it a name
        label = "Button 2";             // give it a label
        fixed_width = true;             // fix it's width
        alignment = centered;           // center it
    }                                   // end button
    ok_cancel;                          // predefined OK/Cancel button
}                                       // end dialog
