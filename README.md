# wezterm.kak

Basic [WezTerm](https://github.com/wez/wezterm) integration for Kakoune. Inspired by [tmux.kak](https://github.com/alexherbo2/tmux.kak).

## Usage

Ensure that the wezterm command is on your path and add `wezterm` to the list of windowing_modules with

```
set-option -add global windowing_modules 'wezterm'
```

## User Mode

There is no default user mode provided. It's recommended to use [window.kak](https://github.com/alexherbo2/window.kak) in order to have common window interface.
