config_opts['chroot_setup_cmd'] = 'install bash bzip2 coreutils cpio diffutils redhat-release findutils gawk glibc-minimal-langpack grep gzip info patch redhat-rpm-config rpm-build sed tar unzip util-linux which xz'
config_opts['dist'] = 'el9.alma'  # only useful for --resultdir variable subst
config_opts['releasever'] = '9'
config_opts['package_manager'] = 'dnf'
config_opts['extra_chroot_dirs'] = [ '/run/lock', ]
config_opts['bootstrap_image'] = 'quay.io/almalinuxorg/almalinux:9'


config_opts['dnf.conf'] = """
[main]
keepcache=1
debuglevel=2
reposdir=/dev/null
logfile=/var/log/yum.log
retries=20
obsoletes=1
gpgcheck=0
assumeyes=1
syslog_ident=mock
syslog_device=
metadata_expire=0
mdpolicy=group:primary
best=1
install_weak_deps=0
protected_packages=
module_platform_id=platform:el9
user_agent={{ user_agent }}


[baseos]
name=AlmaLinux $releasever - BaseOS
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos
# baseurl=https://repo.almalinux.org/almalinux/$releasever/BaseOS/$basearch/os/
enabled=1
countme=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9
skip_if_unavailable=False

[appstream]
name=AlmaLinux $releasever - AppStream
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream
# baseurl=https://repo.almalinux.org/almalinux/$releasever/AppStream/$basearch/os/
enabled=1
countme=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[crb]
name=AlmaLinux $releasever - CRB
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb
# baseurl=https://repo.almalinux.org/almalinux/$releasever/CRB/$basearch/os/
enabled=1
countme=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[extras]
name=AlmaLinux $releasever - Extras
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras
# baseurl=https://repo.almalinux.org/almalinux/$releasever/extras/$basearch/os/
enabled=1
countme=1
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[devel]
name=AlmaLinux $releasever - Devel (WARNING: UNSUPPORTED - FOR BUILDROOT USE ONLY!)
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/devel
# baseurl=https://repo.almalinux.org/almalinux/$releasever/devel/$basearch/os/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[baseos-debuginfo]
name=AlmaLinux $releasever - BaseOS debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-debuginfo
# baseurl=https://repo.almalinux.org/almalinux/$releasever/BaseOS/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[appstream-debuginfo]
name=AlmaLinux $releasever - AppStream debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-debuginfo
# baseurl=https://repo.almalinux.org/almalinux/$releasever/AppStream/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[crb-debuginfo]
name=AlmaLinux $releasever - CRB debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb-debuginfo
# baseurl=https://repo.almalinux.org/almalinux/$releasever/CRB/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[extras-debuginfo]
name=AlmaLinux $releasever - Extras debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-debuginfo
# baseurl=https://repo.almalinux.org/almalinux/$releasever/extras/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[devel-debuginfo]
name=AlmaLinux $releasever - Devel debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/devel-debuginfo
# baseurl=https://repo.almalinux.org/almalinux/$releasever/devel/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[baseos-source]
name=AlmaLinux $releasever - BaseOS Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-source
# baseurl=https://repo.almalinux.org/almalinux/$releasever/BaseOS/Source/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[appstream-source]
name=AlmaLinux $releasever - AppStream Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-source
# baseurl=https://repo.almalinux.org/almalinux/$releasever/AppStream/Source/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[crb-source]
name=AlmaLinux $releasever - CRB Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb-source
# baseurl=https://repo.almalinux.org/almalinux/$releasever/CRB/Source/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[extras-source]
name=AlmaLinux $releasever - Extras Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-source
# baseurl=https://repo.almalinux.org/almalinux/$releasever/extras/Source/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

[devel-source]
name=AlmaLinux $releasever - Devel Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/devel-source
# baseurl=https://repo.almalinux.org/almalinux/$releasever/devel/Source/
enabled=0
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/alma/RPM-GPG-KEY-AlmaLinux-9

"""
