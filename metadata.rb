name 'selenium'
maintainer 'Cameron Johnston'
maintainer_email 'cameron@needle.com'
description 'installs components required for running selected flavors of selenium'
version '0.1.5'
%w{ java python runit }.each { |cb| depends cb }
