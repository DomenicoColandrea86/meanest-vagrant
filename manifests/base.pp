
$node_version = "v0.10.33"

file { '/etc/motd':
	content => "
  MEANEST
  - Version: 0.0.1
  - OS:      Official Ubuntu Server 64-bit 14.04
  - Node:    ${node_version}
  - IP:      192.168.33.10
  - Code:    ~/code/meanest
  - Authors:  Domenico Colandrea
\n"
}

# Make all the magic happen by instantiating the meanest class :)
class { meanest:
	node_version => $node_version
}
