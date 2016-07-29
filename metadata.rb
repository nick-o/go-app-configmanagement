name             'go-app-configmanagement'
maintainer       'YOUR_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures go-app-configmanagement'
long_description 'Installs/Configures go-app-configmanagement'
version          '0.1.0'

depends 'chef-client'
depends 'apt'

depends 'nginx', '~>2.7.6'
depends 'supervisor', '~>0.4.12'
depends 'chef-sugar', '~> 3.4.0'
