SANDBOX_DIR := "sandbox/"

default:
  just --list

recreate:
    rm -rf {{SANDBOX_DIR}}
    copier copy . {{SANDBOX_DIR}} --vcs-ref=HEAD