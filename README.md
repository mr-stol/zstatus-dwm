1. Setting up
- Install Tcl
- Download zstatus-dwm.tcl and mark it executable
(for example, by ```chmod +x zstatus_dwm.tcl```)
- Set up X to start DWM with this script
(for example, by replacing ```dwm``` by ```/path/to/zstatus-dwm.tcl & dwm``` in ~/.xinitrc)
- Configure script (chapter 2)
- Restart X
That's all you need to do! If you have any questions/issues, you can report issue here or email me.
My Email: mr_stol@vk.com

2. Configuring script
- Any configuring means editing the script file
2.1. Changing info will be displayed
- Change list in args of ```stat_print``` call in ```stat_autoupdate```
(for example, you can replace
```stat_print $stat_bar_l [list [clock format [clock seconds] -format %I:%M%p] [stat_battery]]```
by ```stat_print $stat_bar_l [list [clock format [clock seconds] -format %H:%M]]```
to remove battery status and use 24-hour time format)
2.2  Changing appearance
- Status bar lenght may be changed by changing ```stat_bar_l``` integer value
- Separators and begin/end text of bar may be changed by changing 3rd, 1st and 2nd args of
stat_print after list of info will be displayed
(for example, you can replace begin for status bar by "```  -Q) \   ```" by replacing stat_print call
by ```stat_print $stat_bar_l [list [clock format [clock seconds] -format %I:%M%p] [stat_battery]] "  -Q) \   "```
to make girl in the status bar winking

3. Adding custom scripts
- You can add custom script to as simple as remove them in 2.3. You can write your own script in this file
or call external script by ```exec``` command (see Tcl documentation)
