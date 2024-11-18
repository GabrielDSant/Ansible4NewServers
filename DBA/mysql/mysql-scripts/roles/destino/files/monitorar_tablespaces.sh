#!/bin/bash
# monitor_tablespace.sh
EMAIL="seu_email@example.com"
THRESHOLD=1000  # Defina o limite em MB

db_sizes=$(mysql -u <USUARIO> -p<SENHA> -e "SELECT table_schema AS 'Database', 
ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Size_MB' 
FROM information_schema.tables GROUP BY table_schema;")

echo "$db_sizes" | while read db size; do
  if [[ $size -gt $THRESHOLD ]]; then
    echo "Database $db está usando $size MB, ultrapassando o limite de $THRESHOLD MB." \
      | mail -s "Alerta: Espaço excedido no database $db" "$EMAIL"
  fi
done
