// LibreDcl+ Example for LibreLisp, LibrePython
//
// LibreCAD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
// as published by the Free Software Foundation.
// Please read the LICENSE file for additional information.
//

// SPDX-License-Identifier: 0BSD

demo_dlg : dialog {
  label = "DCL Demo";
  : boxed_row {
    : boxed_column {
      : text {
        alignment = centered;
        label = "Names";
        is_bold = true;
      }
      : list_box {
        key = "listbox_names";
        width = 30;
        height = 43;
      }
    }
    : boxed_column {
      : boxed_row {
        : text {
          label = "DCL File";
          is_bold = true;
        }
        : text {
          key = "text_dcl";
          label = "";
          width = 50;
        }
        : button {
          key = "button_dcl";
          label = "&Open";
          width = 10;
          fixed_width = true;
        }
      }
      : boxed_row {
        : list_box {
          key = "listbox_dcl";
          width = 100;
          height = 18;
        }
      }

      : boxed_row {
        : text {
          label = "LSP File";
          is_bold = true;
        }
        : text {
          key = "text_lsp";
          label = "";
          width = 50;
        }
        : button {
          key = "button_lsp";
          label = "O&pen";
          width = 10;
          fixed_width = true;
        }
      }
      : boxed_row {
        : list_box {
          key = "listbox_lsp";
          width = 100;
          height = 18;
        }
      }
    }
  }

  : boxed_row {
    : boxed_column {
      : button {
        alignment = left;
        key = "button_run";
        label = "&Run";
        width = 10;
        fixed_width = true;
      }
    }

    : boxed_column {
      : cancel_button {
        alignment = right;
        key = "button_exit";
        label = "E&xit";
        width = 10;
        fixed_width = true;
      }
    }
  }
}
