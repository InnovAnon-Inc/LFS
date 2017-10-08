cd /sources

test -f postgresql-9.6.5.tar.bz2 || \
wget --no-check-certificate \
	http://ftp.postgresql.org/pub/source/v9.6.5/postgresql-9.6.5.tar.bz2

rm -rf postgresql-9.6.5
tar xf postgresql-9.6.5.tar.bz2
cd postgresql-9.6.5

sed -i '/DEFAULT_PGSOCKET_DIR/s@/tmp@/run/postgresql@' src/include/pg_config_manual.h

./configure --prefix=/usr          \
            --enable-thread-safety \
            --docdir=/usr/share/doc/postgresql-9.6.5
make

make install
make install-docs

#make -C contrib/<SUBDIR-NAME> install

install -v -dm700 /srv/pgsql/data
install -v -dm755 /run/postgresql

groupadd -g 41 postgres
useradd -c "PostgreSQL Server" -g postgres -d /srv/pgsql/data \
        -u 41 postgres

chown -Rv postgres:postgres /srv/pgsql /run/postgresql

su - postgres -c '/usr/bin/initdb -D /srv/pgsql/data'

su - postgres -c '/usr/bin/postgres -D /srv/pgsql/data > \
                  /srv/pgsql/data/logfile 2>&1 &'

su - postgres -c '/usr/bin/createdb test'
echo "create table t1 ( name varchar(20), state_province varchar(20) );" \
    | (su - postgres -c '/usr/bin/psql test ')
echo "insert into t1 values ('Billy', 'NewYork');" \
    | (su - postgres -c '/usr/bin/psql test ')
echo "insert into t1 values ('Evanidus', 'Quebec');" \
    | (su - postgres -c '/usr/bin/psql test ')
echo "insert into t1 values ('Jesse', 'Ontario');" \
    | (su - postgres -c '/usr/bin/psql test ')
echo "select * from t1;" | (su - postgres -c '/usr/bin/psql test')

su - postgres -c "/usr/bin/pg_ctl stop -D /srv/pgsql/data"

make install-postgresql
