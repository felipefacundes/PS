#!/bin/bash
Wine_List=`
    zenity \
    --width=500 \
    --height=400 \
    --title='PlayOnGit Wine List' \
    --list --text 'What do you want to do?' \
    --radiolist --column 'Choice' \
    --column 'Action' \
    TRUE "wine-tkg-staging-6.20.r10-x86_64" \
    FALSE "wine-tkg-staging-6.20.r6-x86_64" \
    FALSE "wine-tkg-staging-6.20.r1-x86_64" \
    FALSE "wine-tkg-staging-6.20.r0-x86_64" \
    FALSE "wine-tkg-staging-6.19.r8-x86_64" \
    FALSE "wine-tkg-staging-6.19.r6-x86_64" \
    FALSE "wine-tkg-staging-6.18.r5-x86_64" \
    FALSE "wine-tkg-staging-6.17.r13-x86_64" \
    FALSE "wine-staging-6.16-1-x86_64" \
    FALSE "wine-staging-6.14-1-x86_64" \
    FALSE "wine-staging-6.6-1-x86_64" \
    FALSE "wine-staging-5.21-1-x86_64" \
    FALSE "wine-staging-5.1-1-x86_64" \
    FALSE "wine-staging-4.21-1-x86_64" \
    FALSE "wine-staging-4.20-1-x86_64" \
    FALSE "wine-staging-4.19-1-x86_64" \
    FALSE "wine-staging-4.16-1-x86_64" \
    FALSE "wine-staging-4.8-1-x86_64"
`

if [ "$Wine_List" = "wine-tkg-staging-6.20.r10-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.20.r10-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.20.r6-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.20.r6-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.20.r1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.20.r1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.20.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.20.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.19.r8-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.19.r8-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.19.r6-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.19.r6-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.18.r5-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.18.r5-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.17.r13-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.17.r13-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.16-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-6.16-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.14-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-6.14-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.6-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functionwine-staging-4.19-1-x86_64s/PlayOnGit_NWV.txt
    echo "wine-staging-6.6-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-5.21-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-5.21-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-5.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-5.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-4.21-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-4.21-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-4.20-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-4.20-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-4.16-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-4.16-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-4.8-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-4.8-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
