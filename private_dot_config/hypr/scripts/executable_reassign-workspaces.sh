#!/bin/bash

# Assign workspaces 1-10 to primary external monitor
for i in {1..10}; do
    hyprctl dispatch workspace "$i" >/dev/null 2>&1
    hyprctl dispatch moveworkspacetomonitor "$i" "desc:Acer Technologies CB282K 0x0311F292" >/dev/null 2>&1
done

# Assign workspaces 11-15 to secondary external monitor
for i in {11..15}; do
    hyprctl dispatch workspace "$i" >/dev/null 2>&1
    hyprctl dispatch moveworkspacetomonitor "$i" "desc:Hewlett Packard HP E222 6CM6400XMZ" >/dev/null 2>&1
done

# Focus workspace 11 on secondary monitor
hyprctl dispatch workspace 11 >/dev/null 2>&1

# Focus workspace 1 on primary monitor
hyprctl dispatch workspace 1 >/dev/null 2>&1

notify-send "Workspaces Reassigned" "Workspaces 1-10 → Primary Monitor\nWorkspaces 11-15 → Secondary Monitor"

