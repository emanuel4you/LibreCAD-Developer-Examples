// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

// DCL CODING STARTS HERE
edit_test
: dialog
{
    label = "Edit Box Test";
    : edit_box
    {
        label = "Enter Your Name: ";
        mnemonic = "N";
        key = "name";
        alignment = centered;
        edit_limit = 30;
        edit_width = 30;
        password_char = "*";
    }
    : edit_box
    {
        label = "Enter Your Age: ";
        mnemonic = "A";
        key = "age";
        alignment = centered;
        edit_limit = 3;
        edit_width = 3;
        value = "";
    }
    : button
    {
        key = "accept";
        label = "&OK";
        is_default = true;
        fixed_width = true;
        alignment = centered;
    }
    : errtile
    {
        width = 34;
    }
}
// DCL CODING ENDS HERE
