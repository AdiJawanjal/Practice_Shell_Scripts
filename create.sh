read -p "Enter no. of files you want to create:" files

Count=1

while [ $Count -le $files ]; do
        read -p "Enter the Name of the file:" name
        touch "$name"
        Count=$((Count + 1))
done
