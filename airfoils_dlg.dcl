// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

airfols_dlg : dialog
{
    label = "Airfoils";
    : list_box
    {
        key = "lb_airfoils";
        value = "0";
    }
    ok_cancel;
}
