SANDBOX_DIR := "sandbox/"
COPYRIGHT_HOLDER := "Kacper Stypik"
COPYRIGHT_HOLDER_EMAIL := "test@example.com"
COPYRIGHT_LICENSE := "ISC"
MODULE_NAME := "sandbox"
PROJECT_NAME := "sandbox"

default:
  just --list

recreate: clear
    copier copy . {{SANDBOX_DIR}} --vcs-ref=HEAD

clear:
    rm -rf {{SANDBOX_DIR}}

generate:
    copier copy . {{SANDBOX_DIR}} --skip --vcs-ref=HEAD \
    -d copyright_date=$(date +%Y) \
    -d copyright_holder="{{COPYRIGHT_HOLDER}}" \
    -d copyright_holder_email="{{COPYRIGHT_HOLDER_EMAIL}}" \
    -d copyright_license="{{COPYRIGHT_LICENSE}}" \
    -d module_name="{{MODULE_NAME}}" \
    -d project_name="{{PROJECT_NAME}}"

devrun: generate
    cd {{SANDBOX_DIR}} && uv run manage.py runserver
