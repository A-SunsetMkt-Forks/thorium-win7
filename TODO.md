## TODO document for ideas and patches. Underneath each will be a comment with info or location of patch.

&#45; Adjust DPI from 300 to 72 for Windows .ico files.

 - Gimp and convert.exe to check ico sizes

&#45; Add native first run WebUI page

 - https://github.com/ungoogled-software/ungoogled-chromium/pull/2314/files

&#45; Update build instructions and add Mac build instructions (also merge to website)

 - https://github.com/Alex313031/thorium/blob/main/trunk.sh

&#45; Update win scripts to work seamlessly

 - https://github.com/Alex313031/thorium/tree/main/win_scripts

&#45; Re-evaluate vector icons and webui images for CR23 refresh

 - To keep .icons correct

&#45; Add new Thorium shortcuts to ThoriumOS Shortcuts App

 - For ChromeOS only: If you plan on adding a new accelerator and want it
 displayed in the Shortcuts app, please follow the instructions at: `ash/webui/shortcut_customization_ui/backend/accelerator_layout_table.h`.

### Notes

 - Do a full, manual, one by one file check rebase, to pick up any inconsistencies, and clean up code.

## .grd text replacements (search with grep), because there are a few places we want to tweak some strings.

Google recommends Thorium > Alex313031 recommends Thorium

violates the Thorium > violates the Chrome 

Chromium > Thorium
Chrome > Thorium
Google Thorium > Thorium
Thorium Web Store > Chrome Web Store (Except some UI elements like NTP)
Thorium Remote Desktop > Chrome Remote Desktop
ThoriumOS Flex > ThoriumOS
made possible by Thorium > Chromium
Experiments > Thorium Experiments
