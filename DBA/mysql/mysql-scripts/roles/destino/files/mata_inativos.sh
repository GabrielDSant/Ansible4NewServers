#!/bin/bash

# Defina as variáveis de conexão com o banco de dados
USUARIO="<USUARIO>"
SENHA="<SENHA>"
BANCO="<BANCO>"

# Consulta para identificar sessões inativas há mais de um dia
inactive_sessions=$(mysql -u "$USUARIO" -p"$SENHA" -D "$BANCO" -sse "
    SELECT id 
    FROM information_schema.processlist 
    WHERE command = 'Sleep' 
      AND time > 86400;")

# Loop para matar as sessões inativas identificadas
for session_id in $inactive_sessions; do
    mysql -u "$USUARIO" -p"$SENHA" -D "$BANCO" -e "KILL $session_id;"
    if [ $? -eq 0 ]; then
        echo "Sessão $session_id foi encerrada com sucesso."
    else
        echo "Erro ao tentar encerrar a sessão $session_id."
    fi
done
