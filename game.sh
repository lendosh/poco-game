#!/bin/bash

root_path=$(pwd)
user_input=$(pwd)
first_life=true
steps=0

function check_planet {

    

    if [[ $? -eq 0 && "$(pwd)" != "$previous_path" ]]; then 
        steps=$((steps + 1))
    fi

    if [[ "$steps" -eq 1 ]]; then 
        echo "You're running out of gas. Find a place where you can refill you tank!"
    fi

    if [[ "$steps" -eq 2 ]]; then 
        echo "Your gas is totally finished, the expedition is over. Send a new robot to explore galaxies!"
        cd ${root_path}
        steps=0
    fi

    

    echo "current_step: "${steps}
}

function galaxies {
    

    builtin cd "$@" && check_planet

        previous_path=$(pwd)


    if [[ "$steps" -eq 0 && "$first_life" == true]]; then 
        echo "Hello explorer! You have a new mission, send robots to find an intelligent creature."
        first_life=false
    fi

    if [[ $? -eq 0 && "$(pwd)" != "$previous_path" ]]; then 
      steps=$((steps + 1))
    fi
}

alias cd='galaxies'
