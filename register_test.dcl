// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

register_test                                       // dialog name
: dialog 
{
    label = "Register Test (LibreDclPlus© only)";   // give it a label
    : register                                      // register tile (LibreDCL+)
    {
        : tab
        {                                           // define tab
            key = "tab1";                           // give it a name
            label = "ok_cancel";                    // give it a label
            ok_cancel;                              // predefined OK/Cancel button
        }                                           // end definition
        : tab
        {                                           // define tab
            key = "tab2";                           // give it a name
            label = "ok_cancel_help";               // give it a label
            ok_cancel_help;                         // predefined OK/Cancel/Help button
        }                                           // end definition
        : tab
        {                                           // define tab
            key = "tab3";                           // give it a name
            label = "ok_cancel_help_info";          // give it a label
            ok_cancel_help_info;                    // predefined OK/Cancel/Help/Info button
        }                                           // end definition
        : tab
        {                                           // define tab
            key = "tab4";                           // give it a name
            label = "ok_cancel_help_errtile";       // give it a label
            value = "1";                            // switch it on
            ok_cancel_help_errtile;                 // predefined OK/Cancel/Help/Errtile button
        }                                           // end definition
    }
}                                                   // end dialog
