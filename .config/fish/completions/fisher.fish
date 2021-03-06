complete -xc fisher -s q -l quiet -d "Enable quiet mode"
complete -xc fisher -n "__fish_use_subcommand" -s h -l help -d "Show usage help"
complete -xc fisher -n "__fish_use_subcommand" -s v -l version -d "Show version information"
complete -xc fisher -n "__fish_use_subcommand" -a install -d "Install plugins"
complete -xc fisher -n "__fish_use_subcommand" -a update -d "Upgrade and update plugins"
complete -xc fisher -n "__fish_use_subcommand" -a rm -d "Remove plugins"
complete -xc fisher -n "__fish_use_subcommand" -a ls -d "List what's installed"
complete -xc fisher -n "__fish_use_subcommand" -a ls-remote -d "List what can be installed"
complete -xc fisher -n "__fish_use_subcommand" -a help -d "Show help"
