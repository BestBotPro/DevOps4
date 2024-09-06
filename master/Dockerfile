FROM postgres:latest

# Создание конфигурационного файла postgresql.conf
RUN mkdir -p /etc/postgresql && echo "\
listen_addresses = '*'\n\
port = 5432\n\
max_connections = 100\n\
wal_level = replica\n\
max_wal_senders = 10\n\
wal_log_hints = on\n\
max_wal_size = 1GB\n\
min_wal_size = 80MB\n\
archive_mode = on\n\
archive_command = 'cp %p /var/lib/postgresql/data/archive/%f'\n\
log_replication_commands = on\n\
logging_collector = on\n\
log_directory = '/var/lib/postgresql/data/logs'\n\
log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'\n\
log_rotation_age = 1d\n\
log_rotation_size = 10MB\n\
log_min_messages = notice\n\
log_min_error_statement = error\n\
log_min_duration_statement = -1\n\
" > /etc/postgresql/postgresql.conf

# Копирование скриптов инициализации
COPY init_db.sql /docker-entrypoint-initdb.d/

# Создание скрипта для добавления правил в pg_hba.conf
RUN echo "\
#!/bin/bash\n\
echo \"host replication postgres 0.0.0.0/0 scram-sha-256\" >> /var/lib/postgresql/data/pg_hba.conf\n\
" > /docker-entrypoint-initdb.d/add_replication_rule.sh && chmod +x /docker-entrypoint-initdb.d/add_replication_rule.sh

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
