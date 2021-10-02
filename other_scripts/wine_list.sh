#!/bin/bash
Wine_List=`
    zenity \
    --width=500 \
    --height=400 \
    --title='PlayOnGit Wine List' \
    --list --text 'What do you want to do?' \
    --radiolist --column 'Choice' \
    --column 'Action' \
    TRUE "wine-tkg-staging-6.18.r5-x86_64" \
    FALSE "wine-tkg-staging-6.17.r13-x86_64" \
    FALSE "wine-staging-6.16-1-x86_64" \
    FALSE "wine-staging-6.14-1-x86_64" \
    FALSE "wine-staging-5.21-1-x86_64" \
    FALSE "wine-staging-5.1-1-x86_64"
`

if [ "$Wine_List" = "wine-tkg-staging-6.18.r5-x86_64" ] ; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.18.r5-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.17.r13-x86_64" ] ; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.17.r13-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.16-1-x86_64" ] ; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-6.16-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.14-1-x86_64" ] ; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-6.14-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-5.21-1-x86_64" ] ; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-5.21-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-5.1-1-x86_64" ] ; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-5.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi