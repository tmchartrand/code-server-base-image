# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n 2> /dev/null || true
ln -s /root/vscode_machine_settings.json /root/capsule/code/.vscode/Machine/settings.json
