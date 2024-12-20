// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

//DCL CODING STARTS HERE
py_dcl
: dialog
{
    label = "Test Dialog No 1";
    : text
    {
        label = "This is a Test Dialog";
        alignment = centered;
    }
    : button
    {
        key = "button_python";
        label = "Exec Python";
        is_default = true;
        fixed_width = true;
        alignment = centered;
    }
    : button
    {
        key = "accept";
        label = "Close";
        fixed_width = true;
        alignment = centered;
    }
}
//DCL CODING ENDS HERE
