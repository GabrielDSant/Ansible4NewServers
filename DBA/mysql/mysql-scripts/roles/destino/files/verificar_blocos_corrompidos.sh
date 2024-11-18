#!/bin/bash
# check_data_block_corruption.sh
EMAIL="seu_email@example.com"

mysqlcheck -u <USUARIO> -p<SENHA> --all-databases --check --extended > /tmp/mysql_corruption.log
corrupt_tables=$(grep -i 'corrupt' /tmp/mysql_corruption.log)

if [[ -n "$corrupt_tables" ]]; then
  echo "Tabelas corrompidas detectadas: $corrupt_tables" \
    | mail -s "Alerta: Corrupção de blocos de dados no MySQL" "$EMAIL"
fi
