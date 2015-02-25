# Install MySQL stuff
class mysql {
  class { '::mysql::server':
    root_password => 'root'
  }

  include '::mysql::server'

  mysql_database { 'meanest_prod':
    ensure  => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }

  mysql_database { 'meanest_dev':
    ensure  => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }

  mysql_database { 'meanest_test':
    ensure  => 'present',
    charset => 'utf8',
    collate => 'utf8_general_ci',
  }

  mysql_user { 'root@127.0.0.1':
    ensure                   => 'present',
    max_connections_per_hour => '0',
    max_queries_per_hour     => '0',
    max_updates_per_hour     => '0',
    max_user_connections     => '0',
  }
}
