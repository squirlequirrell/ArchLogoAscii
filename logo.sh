#!/bin/bash

# Array of ANSI color codes for text
colors=(
    "\e[1;31m"  # bold red
    "\e[1;32m"  # bold green
    "\e[1;33m"  # bold yellow
    "\e[1;34m"  # bold blue
    "\e[1;35m"  # bold magenta
    "\e[1;36m"  # bold cyan
)

# File to store the index of the last used color
color_index_file=".last_color_index"

# Read the last used color index from file or initialize to -1
if [[ -f "$color_index_file" ]]; then
    last_color_index=$(<"$color_index_file")
else
    last_color_index=-1
fi

# Increment the color index or reset if all colors have been used
if (( last_color_index + 1 >= ${#colors[@]} )); then
    next_color_index=0
else
    (( next_color_index = last_color_index + 1 ))
fi

# Save the next color index to file for the next run
echo "$next_color_index" > "$color_index_file"

# Define the ASCII art with echo statements using the next color
echo -e "${colors[next_color_index]}       /\\"
echo -e "${colors[next_color_index]}      /  \\"
echo -e "${colors[next_color_index]}     /\\   \\"
echo -e "${colors[next_color_index]}    /      \\"
echo -e "${colors[next_color_index]}   /   ,,   \\"
echo -e "${colors[next_color_index]}  /   |  |  -\\"
echo -e "${colors[next_color_index]} /_-''    ''-_\\"
echo -e "\e[0m"  # reset color to default

