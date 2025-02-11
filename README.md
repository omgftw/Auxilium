# Auxilium

## Installation
```shell script
./install.sh
```

## About

### Key concepts

DRY, flexible, recursive templating

Extreme configuration flexibility through a combination of regex support, multi-level variable definition with override support, and multi-pass jinja templating

Reads all variables relative to the script location (with regex support for the path) and creates a flat variables list
Does an initial templating pass (this pass will ignore errors thrown from usage of secrets or instance information)
Fetches instance information and secrets from AWS (if applicable)
Does multiple passes of jinja templating until there are no remaining templates to be populated

## Encrypted Config

By default the configuration file is encrypted using blackbox
and requires an appropriate private GPG key to decrypt.

## SSH Authentication

The default authentication mechanism for SSH in these script is ssh-agent.
To access a resource, you must have the appropriate SSH key added to your agent.

## Usage

The script can be used interactively by just launching it. It will prompt you with the available options.
You can either type the name of the option (case-sensitive) or the corresponding number.
```shell script
aux
```
Alternatively, if you know the path of the script you would like to launch you can also pass it as an arg:
```shell script
aux vcc/dev/nomad
```

## Special keywords and prefixes
aws_instance_*:
    name: example
    profile: example
    limit: 10
aws_secret_*:
    name: example
    profile: example
aws_profile

## Debugging

The script outputs a temp file `/tmp/aux_tmp` when running. This is the final templated version of your script.

## Authentication

## Bring your own config

There are 2 ways to use your own custom configuration with Auxilium. You can either overwrite the default config and scripts directories located at `/usr/local/bin/auxilium.yaml` AND `/usr/local/bin/.auxilium` respectively, by default.
Alternatively, you can override the default locations using the `--config` and `--script-dir` arguments.

## TODO

X Support for multiple instances within a single script  
X Support for multiple secrets within a single script  
X AWS session manager (manage session per profile, cache and reuse sessions)  
X Support for pulling multiple instances' information  
X   Perhaps support for special prefixes for dicts in yaml (ex: aws_instance_*)  
X add argparse (for --debug etc)  
Move to modules  
Support for multiple config files  
Support for other selectors for instances (other than tag "Name")  
Have tmp script file have an appended timestamp so you can run multiple scripts in tandem without conflicts
Add color to all relevant output (including differentiating dirs from scripts)  
