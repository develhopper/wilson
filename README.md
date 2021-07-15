# Wilson
![Wilson](wilson.jpg)

wilson is my tiny command line based assistant

just put .wilsonrc on your home and add your commands

## Manage services

```bash
foo@bar:$ wilson start service-name
```

## Config file

### syntax

alias->command

example:

help->cat ~/.wilsonrc

when you type: wilson help

it will run command: cat ~/.wilsonrc

### parameter placeholder

alias {}->command {}

example:

start {}->systemctl start {}

when you type: wilson start service-name

it will replace {} with service-name

for more please read wilsonrc and source code
