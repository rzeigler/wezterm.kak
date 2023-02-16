provide-module wezterm %{
    evaluate-commands %sh{
        [ -z "${kak_opt_windowing_modules}" ] || ([ -n "$WEZTERM_PANE" ] && command -v wezterm > /dev/null) || echo 'fail wezterm not detected'
    }

    define-command -override wezterm -params .. -docstring '
        wezterm [<flags>] [<options>] [<subcommand>]: run wezterm' \
    %{
        nop %sh{
            WEZTERM_PANE=$kak_client_env_WEZTERM_PANE wezterm "$@" < /dev/null > /dev/null 2>&1 &
        }
    }

    define-command -override wezterm-terminal-horizontal -params .. -shell-completion -docstring '
        wezterm-terminal-horizontal <program> [<arguments>]: create a new terminal as a WezTerm pane
        The current pane is split into two, left and right
        The program passed as argument will be executed in the new terminal' \
    %{
        wezterm cli split-pane --horizontal --cwd %val{client_env_PWD} -- %arg{@}
    }

    define-command -override wezterm-terminal-vertical -params .. -shell-completion -docstring '
        wezterm-terminal-vertical <program> [<arguments>]: create a new terminal as a WezTerm pane
        The current pane is split into two, top and bottom
        The program passed as argument will be executed in the new terminal' \
    %{
        wezterm cli split-pane --cwd %val{client_env_PWD} -- %arg{@}
    }

    define-command -override wezterm-terminal-tab -params .. -shell-completion -docstring '
        wezterm-terminal-tab <program> [<arguments>]: create a new terminal as a WezTerm tab
        The program passed as argument will be executed in the new terminal' \
    %{
        wezterm cli spawn --cwd %val{client_env_PWD} -- %arg{@}
    }

    define-command -override wezterm-terminal-window -params .. -shell-completion -docstring '
        wezterm-terminal-window <program> [<arguments>]: create a new terminal as a WezTerm window
        The program passed as argument will be executed in the new terminal' \
    %{
        wezterm cli spawn --new-window --cwd %val{client_env_PWD} -- %arg{@}
    }

    declare-option -docstring "Default split direction for terminal" str wezterm_terminal_mode horizontal


    alias global terminal wezterm-terminal-horizontal
    alias global terminal-horizontal wezterm-terminal-horizontal
    alias global terminal-vertical wezterm-terminal-vertical
    alias global terminal-tab wezterm-terminal-tab
    alias global terminal-window wezterm-terminal-window
}
