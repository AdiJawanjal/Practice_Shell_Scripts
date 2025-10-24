name="Hi User"
while [ "$name" != "exit" ]; do
        echo "Hi, $name"
        read -p "Enter your Name:" name
done
