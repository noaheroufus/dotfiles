#!/bin/bash

#
# ./link.sh
# Noah Roufus
#

# List of files to link
# Always links relative to $HOME/
files=".bash_profile .bashrc .zshrc .tmux.conf .vimrc .config/alacritty.yml .config/nvim/init.vim"

curDir=$(dirname $(realpath "$0"))
backupDir="${curDir}/backup"
homeDir=$HOME

echo "--- Linking dotfiles ---"
echo
echo ${files}
echo
echo "NOTE: If the destination file already exists, it will be moved to the backup directory listed below:"
echo ${backupDir}
echo

read -p "Continue (y/n)? " canGo
if [[ ${canGo} != "y" ]]; then
    echo "Bailing out..."
    exit 0
fi

# Create ./backup/
if [[ ! -d ${backupDir} ]]; then
    echo "Creating backup directory: ${backupDir}/"
    mkdir ${backupDir}

    echo "Creating backup .config directory: ${backupDir}/.config/"
    mkdir "${backupDir}/.config/"
fi

# Create ./backup/.config/
if [[ ! -d "${homeDir}/.config/" ]]; then
    echo "Creating directory: ${homeDir}/.config/"
    mkdir "${homeDir}/.config/"
fi

for file in $files; do
    dest="${homeDir}/${file}"

    ## Skip if the file is already a symlink
    if [[ -h ${dest} ]]; then
        echo "Skipping, already a symlink: ${dest}"
        continue
    fi

    ## Backup the file if it exists
    if [[ -f ${dest} ]]; then
        echo "Backing up ${dest}"
        mv ${dest} "${backupDir}/${file}"
    fi

    ## Link it!
    echo "Linking ${curDir}/${file} -> ${dest}"
    ln -s "${curDir}/${file}" ${dest}
done

