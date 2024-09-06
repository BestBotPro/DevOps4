FROM postgres:latest

CMD ["sh", "-c", "set -ex; \
    rm -rf /var/lib/postgresql/data/*; \
    export PGPASSWORD=${POSTGRES_PASSWORD}; \
    pg_basebackup -R -h $MASTER_HOST -U $POSTGRES_USER -D /var/lib/postgresql/data -P && \
    unset PGPASSWORD && \
    echo 'Base backup completed.' && \
    chown -R $POSTGRES_USER:$POSTGRES_USER /var/lib/postgresql/data && \
    chmod -R 0700 /var/lib/postgresql/data && \
    exec gosu $POSTGRES_USER postgres -c 'config_file=/var/lib/postgresql/data/postgresql.conf'"]
