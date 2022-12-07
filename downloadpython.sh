url='https://www.python.org/ftp/python/'

curl --silent "$url" |
    sed -n 's!.*href="\([0-9]\+\.[0-9]\+\.[0-9]\+\)/".*!\1!p' |
    sort -rV |
while read -r version; do
    filename="Python-$version.tgz"
    # Versions which only have alpha, beta, or rc releases will fail here.
    # Stop when we find one with a final release
    if curl --fail --silent -O "$url/$version/$filename"; then
        echo "$filename"
        break
    fi
done
