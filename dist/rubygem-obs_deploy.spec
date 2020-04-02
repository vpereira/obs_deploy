#
# spec file for package rubygem-obs_deploy
#
# Copyright (c) 2020 SUSE LLC
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via https://bugs.opensuse.org/
#


%define mod_name obs_deploy
%define mod_full_name %{mod_name}-%{version}
Name:           rubygem-obs_deploy
Version:        0.1.1
Release:        0
Summary:        OBS Deployment tool
License:        
Group:          Development/Languages/Ruby
URL:            https://openbuildservice.org
Source:         https://rubygems.org/gems/%{mod_full_name}.gem
BuildRequires:  %{rubygem gem2rpm}
BuildRequires:  %{ruby}
BuildRequires:  ruby-macros >= 5
BuildRequires:  update-alternatives
# FIXME: use proper Requires(pre/post/preun/...)
PreReq:         update-alternatives

%description
OBS Deployment tool.

%prep

%build

%install
%gem_install \
  --symlink-binaries \
  --doc-files="README.md" \
  -f

%gem_packages

%changelog
