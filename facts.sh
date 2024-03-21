#!/usr/bin/bash

set -e

facts=(
	"K2 is the second-highest mountain in the world at 8,611 meters (28,251 feet) above sea level."
	"The state tree of Washington is the Western Hemlock."
	"All mammals get goosebumps."
	"Queen Alexandra's Birdwing is the largest butterfly in the world: females can reach wingspans of 28cm (11 inches)."
)

# array to keep track of which facts have been viewed
# 0 is unviewed, 1 is viewed
declare -A viewed
for i in "${!facts[@]}"; do viewed[$i]=0; done

all_viewed() {
    for i in "${!viewed[@]}"; do
        if [ "${viewed[$i]}" -eq 0 ]; then
            return 1 # false: not all viewed
        fi
    done
    return 0 # true: all viewed
}

while true; do
    if all_viewed; then
        echo "All facts have been viewed. Thank you!"
        exit 0
    fi

    read -p "Do you want to hear a fact? (y/n) " answer
    case $answer in
        [Yy]* )
            while true; do
                random_index=$((RANDOM % ${#facts[@]}))
                if [ "${viewed[$random_index]}" -eq 0 ]; then
                    echo "${facts[$random_index]}"
                    viewed[$random_index]=1
                    break
                fi
            done
            ;;
        [Nn]* )
            echo "Exiting."
            exit 0
            ;;
        * )
            echo "Please respond beginning with a y for yes."
            ;;
    esac
done
