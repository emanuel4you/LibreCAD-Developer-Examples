// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

image_test                                      // dialog name
: dialog 
{
    label = "Image Test";                       // give it a label
    : row 
    {                                           // begin row
        : image                                 // define image tile
        {
            key = "img1";                       // give it a name
            height = 100.0;                     // and a height
            width = 100.0;                      // and now a width
            fixed_width = true;                 // fix the width
            fixed_height = true;                // fix the height
            color = red;
        }                                       // end image
        : image                                 // define image tile
        {
            key = "img2";                       // give it a name
            height = 100.0;                     // add a height
            width = 100.0;                      // and now a width
            fixed_width = true;                 // fix the width
            fixed_height = true;                // fix the height
            color = green;                      // set background color
        }                                       // end image
        : image                                 // define image tile
        {
            key = "img3";                       // give it a name
            height = 100.0;                     // add a height
            width = 100.0;                      // and now a width
            fixed_width = true;                 // fix the width
            fixed_height = true;                // fix the height
            color = blue;                       // set background color
        }                                       // end image
    }                                           // end row
    ok_cancel;                                  // predefined Ok/Cancel button
}                                               // end dialog

