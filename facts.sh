set -e

fact_dir="facts" # Local directory containing fact files
fact_files=() # Array to store the paths to the fact files
for fact_file in "$fact_dir"/*; do
    fact_files+=("$fact_file")
done

facts=() # Array to store the contents of the fact files
# Read the contents of each fact file into a facts array, the name of the file is the teller of the fact
# and should be formattedd as "name: fact". Each file should contain only one line.
for fact_file in "${fact_files[@]}"; do
    # strip the file name from the path
    teller=$(basename "$fact_file")
    line=$(head -n 1 "$fact_file")
    facts+=("$teller: $line")
done
# array to keep track of which facts have been viewed
# 0 is unviewed, 1 is viewed
viewed=()
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
