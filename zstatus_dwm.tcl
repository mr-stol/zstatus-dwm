#!/usr/bin/tclsh

set stat_bar_l 32

proc stat_strresize {len str {align left}} {
	if {[string length $str] > $len} {
		return [string range $str 0 $len-3]...
	} else {
		set spacing [string repeat " " [expr $len - [string length $str]]]
		switch $align {
			left {return $str$spacing}
			right {return $spacing$str}
		}
	}
}

proc stat_print {len content_l {beginstr "  oQ) \\  "} {endstr "  "} {separator "  \\  "}} {
	set content $beginstr[join $content_l $separator]$endstr
	exec xsetroot -name [stat_strresize $len $content]
}

proc stat_battery {} {
	set status [gets [set status_f [open /sys/class/power_supply/BAT0/status]]]
	set level [gets [set level_f [open /sys/class/power_supply/BAT0/capacity]]]
	close $status_f
	close $level_f
	switch $status {
		Discharging {set icon "\[/\}"}
		Charging    {set icon "\[+\}"}
		default     {set icon "\[¯\}"}
	}
	return "$level% $icon"
}

proc stat_autoupdate {} {
	global stat_bar_l
	stat_print $stat_bar_l [list [clock format [clock seconds] -format %I:%M%p] [stat_battery]]
	after [expr 60000 - [clock milliseconds]%60000] stat_autoupdate
}

stat_autoupdate
vwait forever
