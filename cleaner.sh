#!/bin/bash
#Author Omar BOUYKOURNE
#42login : obouykou
#update
if [ "$1" == "update" ];
then
    tmp_dir=".issent_wakha_daguis_t9ddart_ghina_ard_trmit_orra_tskert_zond_ism_yad_ikan_repo_gh_desktop_nk_achko_awldi_4ayad_yogguer_l'encrypting_n_2^10000_ghayad_aras_tinin_t''a.*\l7i?t_agmano_mohmad"
    if ! git clone --quiet https://github.com/su-omb/Cleaner_42.git "$HOME"/"$tmp_dir" &>/dev/null;
    then
        sleep 0.5
        echo -e "\033[31m\n           -- Couldn't update CCLEAN! :( --\033[0m"
        if [[ "$(pwd)" == "/" ]]; then
            echo -e "\033[33m\n   -- Maybe you need to change your bad habits XD --\n\033[0m"
        fi
        exit 1
    fi
    sleep 1
    if [ "" == "$(diff "$HOME"/Cleaner_42.sh "$HOME"/"$tmp_dir"/Cleaner_42.sh)" ];
    then
        echo -e "\033[33m\n -- You already have the latest version of cclean --\n\033[0m"
        /bin/rm -rf "$HOME"/"${tmp_dir:?}"
        exit 0
    fi
    cp -f "$HOME"/"$tmp_dir"/Cleaner_42.sh "$HOME" &>/dev/null
    /bin/rm -rf "$HOME"/"${tmp_dir:?}" &>/dev/null
    echo -e "\033[33m\n -- cclean has been updated successfully --\n\033[0m"
    exit 0
fi
#calculating the current available storage
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
    Storage="0B"
fi
echo "Available Storage Before Cleaning : || $Storage ||"
echo "Cleaning ..."
#42 Caches
/bin/rm -rf ~/Library/*.42* &>/dev/null
/bin/rm -rf ~/*.42* &>/dev/null
/bin/rm -rf ~/.zcompdump* &>/dev/null
/bin/rm -rf ~/.cocoapods.42_cache_bak* &>/dev/null
#Trash
/bin/rm -rf ~/.Trash/* &>/dev/null
#General Cache files
/bin/rm -rf ~/Library/Caches/* &>/dev/null
#Slack, VSCode, Discord and Chrome Caches
/bin/rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/discord/Cache/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/discord/Code\ Cache/js* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Application\ Cache/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null
#.DS_Store files
find ~/Desktop -name .DS_Store -depth -exec /bin/rm {} \; &>/dev/null
#tmp downloaded files with browsers
/bin/rm -rf ~/Library/Application\ Support/Chromium/Default/File\ System &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Chromium/Profile\ [0-9]/File\ System &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/File\ System &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/File\ System &>/dev/null
#calculating the new available storage after cleaning
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
    Storage="0B"
fi
sleep 1
echo "Available Storage After Cleaning : || $Storage ||"
