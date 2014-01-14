default['repo'] = {
	'epel' => {
		'description' => 'Extra Packages for Enterprise Linux 6 - $basearch',
		'mirrorlist'  => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
		'gpgkey'      => 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
	},
	'remi' => {
		'description' => 'Les RPM de remi pour Enterprise Linux 6 - $basearch',
		'mirrorlist'  => 'http://rpms.famillecollet.com/enterprise/6/remi/mirror',
		'gpgkey'      => 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
	}
}
