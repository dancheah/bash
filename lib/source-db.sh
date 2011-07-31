function use_redis {
    export REDIS_HOME=/opt/personal/pkg/redis-2.4.0-rc5
    export PATH=${REDIS_HOME}/src:${PATH}
}

function use_pgsql {
    use PGSQL_HOME /opt/personal/pkg/pgsql
    export PGDATA=/opt/personal/pkg/pgsql/data 
}

function start_pgsql {
    pg_ctl -l logfile start
}

# vim: sts=4 sw=4 ts=4 et 
