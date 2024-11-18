#!/bin/bash
# monitor_alert_log.sh
EMAIL="seu_email@example.com"
ALERT_LOG="/var/log/mysql/error.log"

# Verifica erros novos no log desde a última execução
new_errors=$(tail -n 100 $ALERT_LOG | grep -i 'error')

if [[ -n "$new_errors" ]]; then
  echo "Erros recentes no log de alertas do MySQL: $new_errors" \
    | mail -s "Alerta: Erros no log de alertas do MySQL" "$EMAIL"
fi
