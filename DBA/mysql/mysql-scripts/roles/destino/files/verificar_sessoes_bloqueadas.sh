#!/bin/bash
# check_locked_sessions.sh
EMAIL="seu_email@example.com"

locked_sessions=$(mysql -u <USUARIO> -p<SENHA> -e "SELECT * FROM information_schema.processlist WHERE command = 'Sleep' AND time > 120;")

if [[ -n "$locked_sessions" ]]; then
  echo "Sessões bloqueadas por mais de 2 minutos encontradas: $locked_sessions" \
    | mail -s "Alerta: Sessões bloqueadas no MySQL" "$EMAIL"
fi
