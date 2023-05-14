"""
Python script to setup my dev envionment with

- tmux
- vim

On MacOS:
- alacritty
"""
import os
import logging
import argparse
from datetime import datetime


DOTFILES_DIR = os.path.dirname(os.path.abspath(__file__))
CONFIG_DIR = os.path.join(DOTFILES_DIR, ".config")


def backup_config() -> None:
    logging.info("Backing up existing config files...")
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    os.system(f"mv ~/.config ~/.config.bak_{timestamp}")
    os.system(f"mv ~/.vimrc ~/.vimrc.bak_{timestamp}")
    os.system(f"mv ~/.tmux.conf ~/.tmux.conf.bak_{timestamp}")
    os.system(f"mv ~/.zshrc ~/.zshrc.bak_{timestamp}")
    logging.info("Done backing up existing config files!")

def get_install_temp_dir() -> str:
    """
    Gets the install temp directory
    """
    install_temp = os.path.join(os.getcwd(), ".install_temp")
    if not os.path.exists(install_temp):
        os.mkdir(install_temp)
    return install_temp

def install_alacritty() -> None:
    """
    Installs alacritty on MacOS
    """
    logging.info("Installing alacritty...")
    # download rustup script
    install_temp = get_install_temp_dir()
    rustup_script = os.path.join(install_temp, "rustup.sh")
    os.system(f"curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o {rustup_script}")
    # run rustup script
    os.system(f"sh {rustup_script} -y")
    # install alacritty
    os.system("cargo install alacritty")
    logging.info("Done installing alacritty!")

def link_config() -> None:
    # link .config files
    logging.info("Linking .config files...")
    os.system(f"ln -s {CONFIG_DIR} ~/.config")

def link_zshrc() -> None:
    # link .zshrc
    logging.info("Linking .zshrc...")
    zshrc = os.path.join(CONFIG_DIR, "zsh", ".zshrc")
    os.system(f"ln -s {zshrc} ~/.zshrc")

def install_font() -> None:
    logging.info("Installing fonts...")
    # install with brew
    os.system("brew tap homebrew/cask-fonts")
    os.system("brew install --cask font-hack-nerd-font")

def install_startship() -> None:
    logging.info("Installing starship...")
    # Download shell script
    install_temp = get_install_temp_dir()
    starship_script = os.path.join(install_temp, "starship_install.sh")
    os.system(f"curl -fsSL https://starship.rs/install.sh -o {starship_script}")
    # Run shell script
    os.system(f"sh {starship_script} -y")

def install_zsh_autosuggestions() -> None:
    logging.info("Installing zsh autosuggestions...")
    # clone repo
    zsh_autosuggestions_dir = os.path.join(CONFIG_DIR, "zsh", "plugins", "zsh-autosuggestions")
    # remove existing dir
    if os.path.exists(zsh_autosuggestions_dir):
        os.system(f"rm -rf {zsh_autosuggestions_dir}")
    os.system(f"git clone https://github.com/zsh-users/zsh-autosuggestions {zsh_autosuggestions_dir}")

def install_tmux() -> None:
    logging.info("Installing tmux...")
    # install with brew
    os.system("brew install tmux")

def install_tpm() -> None:
    logging.info("Installing tmux plugin manager...")
    # clone repo
    tpm_dir = os.path.join(CONFIG_DIR, "tmux", "plugins", "tpm")
    # remove existing dir
    if os.path.exists(tpm_dir):
        os.system(f"rm -rf {tpm_dir}")
    os.system(f"git clone https://github.com/tmux-plugins/tpm {tpm_dir}")

def install_neovim() -> None:
    logging.info("Installing neovim...")
    # install with brew
    os.system("brew install neovim")

def main(args: argparse.Namespace) -> None:

    # backup existing .config files
    if not args.skip_backup:
        backup_config()

    install_alacritty()
    link_config()
    install_font()
    install_startship()
    link_zshrc()
    install_zsh_autosuggestions()
    install_tmux()
    install_tpm()
    install_neovim()

    # open alacritty
    os.system("alacritty")


def setup_logging(verbose: bool) -> None:
    """
    Sets up logging
    """
    if verbose:  
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Setup my dev environment")
    parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")
    parser.add_argument("--skip-backup", "-s", action="store_true", help="Skip backing up existing config files")
    args = parser.parse_args()

    setup_logging(args.verbose)

    main(args)
    
