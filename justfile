SANDBOX_DIR := "sandbox/"

default:
  just --list

recreate: clear
    copier copy . {{SANDBOX_DIR}} --vcs-ref=HEAD

clear:
    rm -rf {{SANDBOX_DIR}}