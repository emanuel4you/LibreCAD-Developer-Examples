// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

imagebutton_test                        // dialog name
: dialog
{
    label = "Image Button Test";        // give it a label
    : boxed_row                         // define a boxed row
    {
        label = "Choose a Color";       // gie it a label
        : image_button                  // define image button
        {
            key = "img0";               // give it a name
            height = 26;                // define height
            width = 16;                 // define width
            fixed_width = true;         // fix the width
            allow_accept = true;        // allow double-click
        }
        : image_button
        {
            key = "img1";
            height = 26;  
            width = 16;
            fixed_width = true;
            allow_accept = true;
        }
        : image_button
        {
            key = "img2";
            height = 26;
            width = 16;
            fixed_width = true;
            allow_accept = true;
        }
        : image_button
        {
            key = "img3";
            height = 26;
            width = 16;
            fixed_width = true;
            allow_accept = true;
        }
        : image_button
        {
            key = "img4";
            height = 26;
            width = 16;
            fixed_width = true;
            allow_accept = true;
        }
        : image_button
        {
            key = "img5";
            height = 26;
            width = 16;
            fixed_width = true;
            allow_accept = true;
        }
        : image_button
        {
            key = "img6";
            height = 26;
            width = 16;
            fixed_width = true;
            allow_accept = true;
        }
        : image_button
        {
            key = "img7";
            height = 26;
            width = 16;
            fixed_width = true;
            allow_accept = true;
        }
    }                                   // end boxed row
    ok_cancel;                          // predefined OK/Cancel button
}                                       // end dialog
