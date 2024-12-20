// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

toggle_test //dialog name
: dialog
{
    label = "Toggle Test";
    : toggle
    {
        label = "turn me on!";
        key = "select";
    }
    ok_cancel;
}