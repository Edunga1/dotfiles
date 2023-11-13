# Tmux

I use tmux as a terminal multiplexer and a tmux-resurrect plugin to save and restore tmux session.
it need to install below items.

- tmux: https://github.com/tmux/tmux
- tmux plugin Manager(TPM): https://github.com/tmux-plugins/tpm 
- tmux-resurrect plugin: https://github.com/tmux-plugins/tmux-resurrect

**Installtion summary**

Tmux:

```bash
brew install tmux
```

Tmux Plugin Manager:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Configurations for TPM and tmux-resurrect are in the `.tmux.conf` file.

After re-source `.tmux.conf` file(`prefix + ctrl + r`), you can install plugins by `prefix + I`.

## Features

- Prefix: `Ctrl + a`
- Save tmux session: `prefix + Ctrl + s`
- Restore tmux session: `prefix + Ctrl + r`
