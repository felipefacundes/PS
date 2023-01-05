#!/bin/bash
Wine_List=`
    zenity \
    --width=500 \
    --height=400 \
    --title='PlayOnGit Wine List' \
    --list --text 'What do you want to do?' \
    --radiolist --column 'Choice' \
    --column 'Action' \
    TRUE "wine-staging-7.22-x86_64" \
    FALSE "wine-staging-7.12-x86_64" \
    FALSE "wine-ge-custom-7.20.GE.1-1-x86_64" \
    FALSE "wine-staging-7.11-x86_64" \
    FALSE "wine-staging-7.10-x86_64" \
    FALSE "wine-staging-7.9-x86_64" \
    FALSE "wine-staging-7.8-x86_64" \
    FALSE "wine-ge-custom-7.16.GE.1-1-x86_64" \
    FALSE "wine-ge-custom-7.6.GE.1-1-x86_64" \
    FALSE "wine-ge-custom-7.1.GE.1-1-x86_64" \
    FALSE "wine-tkg-staging-7.0.r0-x86_64" \
    FALSE "wine-staging-7.0-x86_64" \
    FALSE "wine-tkg-staging-7.0rc6.r0-x86_64" \
    FALSE "wine-ge-custom-7.0rc6.GE.1-1-x86_64" \
    FALSE "wine-staging-7.0rc5-x86_64" \
    FALSE "wine-tkg-staging-7.0rc4.r3-x86_64" \
    FALSE "wine-staging-7.0rc3-x86_64" \
    FALSE "wine-ge-custom-7.0rc3.GE.1-1-x86_64" \
    FALSE "wine-tkg-staging-7.0rc2.r0-x86_64" \
    FALSE "wine-ge-custom-7.0rc2.GE.1-1-x86_64" \
    FALSE "wine-staging-7.0rc2.r0-x86_64" \
    FALSE "wine-tkg-staging-7.0rc1.r0-x86_64" \
    FALSE "wine-staging-7.0rc1.r0-x86_64" \
    FALSE "wine-staging-6.23-1-x86_64" \
    FALSE "wine-6.23-1-x86_64" \
    FALSE "wine-tkg-staging-6.22.r8-x86_64" \
    FALSE "wine-tkg-staging-6.22.r0-x86_64" \
    FALSE "wine-tkg-staging-6.22.r0-whfx-x86_64" \
    FALSE "wine-staging-6.22-1-x86_64" \
    FALSE "wine-tkg-staging-6.21.r10-whfx-x86_64" \
    FALSE "wine-tkg-staging-6.21.r8-x86_64" \
    FALSE "wine-ge-custom-6.21.GE.1-1-x86_64" \
    FALSE "wine-tkg-staging-6.21.r1-x86_64" \
    FALSE "wine-tkg-staging-6.21.r0-x86_64" \
    FALSE "wine-staging-6.21-1-x86_64" \
    FALSE "wine-tkg-staging-6.20.r10-x86_64" \
    FALSE "wine-tkg-staging-6.20.r6-x86_64" \
    FALSE "wine-ge-custom-6.20.GE.1-1-x86_64" \
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
    FALSE "wine-staging-4.8-1-x86_64" \
    FALSE "wine-staging-4.1-1-x86_64"
`

if [ "$Wine_List" = "wine-staging-7.22-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.22-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.12-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.12-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-7.20.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-7.20.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.11-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.11-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.10-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.10-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.9-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.9-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.8-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.8-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-7.16.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-7.16.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-7.6.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-7.6.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-7.1.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-7.1.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-7.0.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-7.0.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-7.0rc6.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-7.0rc6.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-7.0rc6.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-7.0rc6.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.0rc5-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.0rc5-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-7.0rc4.r3-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-7.0rc4.r3-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.0rc3-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.0rc3-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-7.0rc3.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-7.0rc3.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-7.0rc2.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-7.0rc2.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-7.0rc2.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-7.0rc2.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.0rc2.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.0rc2.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-7.0rc1.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-7.0rc1.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-7.0rc1.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-7.0rc1.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.23-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-6.23-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-6.23-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-6.23-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.22.r8-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.22.r8-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.22.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.22.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.22.r0-whfx-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.22.r0-whfx-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.22-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-6.22-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.21.r10-whfx-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.21.r10-whfx-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.21.r8-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.21.r8-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-6.21.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-6.21.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.21.r1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.21.r1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.21.r0-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.21.r0-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-staging-6.21-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-6.21-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.20.r10-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.20.r10-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-tkg-staging-6.20.r6-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-tkg-staging-6.20.r6-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
if [ "$Wine_List" = "wine-ge-custom-6.20.GE.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-ge-custom-6.20.GE.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
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
if [ "$Wine_List" = "wine-staging-4.1-1-x86_64" ]; then
    touch ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
    echo "wine-staging-4.1-1-x86_64" > ~/.PlayOnGit/scripts/functions/PlayOnGit_NWV.txt
fi
