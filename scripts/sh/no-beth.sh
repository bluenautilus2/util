
gradle() {
    if [[ $@ == "build" ]]; then
        echo "NO BETH" 
    else
        command ./gradlew "$@"
    fi
}
