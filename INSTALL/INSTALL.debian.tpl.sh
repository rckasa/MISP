#!/usr/bin/env bash
############################################################
######                                                     #
#####   Please                      AutoGenerated...      ##
####      Do NOT                    was                  ###
###        Manually                It                   ####
##          Change this Script...                      #####
#                                                     ######
############################################################
############################################################
#INSTALLATION INSTRUCTIONS                                #
##########################################################
#------------------------- for Debian Flavored Linux Distributions
#
#-------------------------------------------------------|
# 0/ Quick MISP Instance on Debian Based Linux - Status |
#-------------------------------------------------------|
#
#    20190208: Kali Linux tested and working.
#
#
#-------------------------------------------------------|
# 1/ For Kali, download and run Installer Script        |
#-------------------------------------------------------|
#
# To install MISP on Kali copy paste the following to your r00t shell:
# # wget -O /tmp/misp-kali.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.debian.sh && bash /tmp/misp-kali.sh
# /!\ Please read the installer script before randomly doing the above.
# The script is tested on a plain vanilla Kali Linux Boot CD and installs quite a few dependencies.
#
#
#---------------------------------------------------------------------------------------------|
# 2/ For other Debian based Linux distributions, download script and run as unprivileged user |
#---------------------------------------------------------------------------------------------|
#
# $ wget -O ~/INSTALL.debian.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.debian.sh && bash ~/INSTALL.debian.sh -C
#
#
#----------------------------------------------------------|
# 3/ The following script has been partially autogenerated |
#----------------------------------------------------------|
#
# To generate this script yourself, the following steps need to be taken.
# $ git clone https://github.com/SteveClement/xsnippet.git
# Make sure xsnippet resides somewhere in your $PATH - It is a shell script so a simple, copy to somewhere sane is enough.
# $ git clone https://github.com/MISP/MISP.git
# $ cd MISP/INSTALL ; ./INSTALL.debian.tpl.sh
#
##
###
####----------------\
##   Developer Note |
####--------------------------------------------------------------------------------------------------|
##   In theory the order does not matter as everything is a self-contained function.                  |
#    That said, ideally leave the order as is and do NOT change the lines as they are place-holders.  |
#    Script files that do NOT have a #_name.sh are scripts that have NO functions. This is by design. |
#-----------------------------------------------------------------------------------------------------|
#
# ToC #
#
#### BEGIN AUTOMATED SECTION ####
#
## 0_global-vars.sh ##
## 0_support-functions.sh ##
## 0_apt-upgrade.sh ##
## 0_sudoKeeper.sh ##
## 0_installCoreDeps.sh ##
## 0_installDepsPhp73.sh ##
## 0_installDepsPhp72.sh ##
## 1_prepareDB.sh ##
## 1_apacheConfig.sh ##
## 1_mispCoreInstall.sh ##
## 1_installCake.sh ##
## 2_permissions.sh ##
## 2_configMISP.sh ##
## 2_core-cake.sh ##
## 2_gnupg.sh ##
## 2_logRotation.sh ##
## 2_backgroundWorkers.sh ##
## 3_misp-modules.sh ##
## 4_misp-dashboard.sh ##
## 4_misp-dashboard-cake.sh ##
## 5_mail_to_misp.sh ##
## 6_viper.sh ##

# No functions scripts:
## apt-upgrade.sh ##
## postfix.sh ##
## interfaces.sh ##
#
### END AUTOMATED SECTION ###

# This function will generate the main installer.
# It is a helper function for the maintainers for the installer.
generateInstaller () {
  if [ ! -f $(which xsnippet) ]; then
    echo 'xsnippet is NOT installed. Clone the repository below and copy the xsnippet shell script somehwere in your $PATH'
    echo "git clone https://github.com/SteveClement/xsnippet.git"
    exit 1
  fi

  mkdir installer ; cd installer
  cp ../INSTALL.debian.tpl.sh .

  # Pull code snippets out of Main Install Documents
  for f in `echo INSTALL.ubuntu1804.md INSTALL.debian9.md INSTALL.kali.md xINSTALL.debian_testing.md xINSTALL.tsurugi.md xINSTALL.debian9-postgresql.md xINSTALL.ubuntu1804.with.webmin.md`; do
    xsnippet . ../../docs/${f}
  done

  # Pull out code snippets from generic Install Documents
  for f in `echo globalVariables.md mail_to_misp-debian.md MISP_CAKE_init.md misp-dashboard-debian.md misp-modules-debian.md gnupg.md ssdeep-debian.md sudo_etckeeper.md supportFunctions.md viper-debian.md`; do
    xsnippet . ../../docs/generic/${f}
  done

  # TODO: Fix the below.
  # $ for f in `echo ls [0-9]_*`; do
  # $   perl -pe 's/## ${f} ##/`cat ${f}`/ge' -i INSTALL.debian.sh
  # $ done
  #
  # Temporary copy/paste holder
  perl -pe 's/^## 0_global-vars.sh ##/`cat 0_global-vars.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 0_apt-upgrade.sh ##/`cat 0_apt-upgrade.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 0_sudoKeeper.sh ##/`cat 0_sudoKeeper.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 0_installCoreDeps.sh ##/`cat 0_installCoreDeps.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 0_installDepsPhp73.sh ##/`cat 0_installDepsPhp73.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 0_installDepsPhp72.sh ##/`cat 0_installDepsPhp72.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 1_prepareDB.sh ##/`cat 1_prepareDB.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 1_apacheConfig.sh ##/`cat 1_apacheConfig.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 1_mispCoreInstall.sh ##/`cat 1_mispCoreInstall.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 1_installCake.sh ##/`cat 1_installCake.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 2_permissions.sh ##/`cat 2_permissions.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 2_configMISP.sh ##/`cat 2_configMISP.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 0_support-functions.sh ##/`cat 0_support-functions.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 2_gnupg.sh ##/`cat 2_gnupg.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 2_logRotation.sh ##/`cat 2_logRotation.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 2_backgroundWorkers.sh ##/`cat 2_backgroundWorkers.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 2_core-cake.sh ##/`cat 2_core-cake.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 3_misp-modules.sh ##/`cat 3_misp-modules.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 4_misp-dashboard-cake.sh ##/`cat 4_misp-dashboard-cake.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 4_misp-dashboard.sh ##/`cat 4_misp-dashboard.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 5_mail_to_misp.sh ##/`cat 5_mail_to_misp.sh`/ge' -i INSTALL.debian.tpl.sh
  perl -pe 's/^## 6_viper.sh ##/`cat 6_viper.sh`/ge' -i INSTALL.debian.tpl.sh

  cp INSTALL.debian.tpl.sh ../INSTALL.debian.sh
  cd ..
  rm -rf installer
  echo -e "${LBLUE}Generated INSTALL.debian.sh${NC}"
  exit 0
}

# Simple debug function with message

# Make sure no alias exists
if [[ $(type -t debug) == "alias" ]]; then unalias debug; fi
debug () {
  echo -e "${GREEN}$1${NC}"
  if [ ! -z $DEBUG ]; then
    echo -e "${RED}Debug Mode${NC}, press ${LBLUE}enter${NC} to continue..."
    read
  fi
}

installMISPcore () {
  space
  echo "Proceeding with the installation of MISP core"
  space
  checkSudoKeeper
  # add-user.sh
  sudo apt update
  # postfix.sh
  installDeps # doubleCheck
  # Mysql install functions
  # misp code function

## From test install:
  aptUpgrade
  checkSudoKeeper
  # <snippet-begin add-user.sh>
  # logout (run SUDO_USER in installer)
  # <snippet-begin postfix.sh>
  MISPvars
  installCoredDeps
  installDepsPhp72
  installCore
  installCake
  permissions
  prepareDB
  apacheConfig
  logRotation
  configMISP
  setupGnuPG
  backgroundWorkers
  coreCAKE
  updateGOWNT 
  checkUsrLocalSrc
  mispmodules
  sudo -H -u www-data $CAKE Admin setSetting "MISP.python_bin" "${PATH_TO_MISP}/venv/bin/python"
}

# Main Kalin Install function
installMISPonKali () {
  # Kali might have a bug on installs where libc6 is not up to date, this forces bash and libc to update
  kaliUpgrade
  # Kali uses php-7.3
  installDepsPhp73
  # Set custom Kali only variables and tweaks
  space
  # The following disables sleep on kali/gnome
  disableSleep

  debug "Installing dependencies"
  installDeps

  debug "Enabling redis and gnupg modules"
  phpenmod -v 7.3 redis
  phpenmod -v 7.3 gnupg

  debug "Apache2 ops: dismod: status php7.2 - dissite: 000-default enmod: ssl rewrite headers php7.3 ensite: default-ssl"
  a2dismod status
  a2dismod php7.2
  a2enmod ssl rewrite headers php7.3
  a2dissite 000-default
  a2ensite default-ssl

  debug "Restarting mysql.service"
  systemctl restart mysql.service

  debug "Fixing redis rc script on Kali"
  fixRedis

  debug "git clone, submodule update everything"
  mkdir $PATH_TO_MISP
  chown www-data:www-data $PATH_TO_MISP
  cd $PATH_TO_MISP
  $SUDO_WWW git clone https://github.com/MISP/MISP.git $PATH_TO_MISP

  $SUDO_WWW git config core.filemode false

  cd $PATH_TO_MISP
  $SUDO_WWW git submodule update --init --recursive
  # Make git ignore filesystem permission differences for submodules
  $SUDO_WWW git submodule foreach --recursive git config core.filemode false

  cd $PATH_TO_MISP/app/files/scripts
  $SUDO_WWW git clone https://github.com/CybOXProject/python-cybox.git
  $SUDO_WWW git clone https://github.com/STIXProject/python-stix.git
  $SUDO_WWW git clone https://github.com/CybOXProject/mixbox.git

  mkdir /var/www/.cache/

  MISP_USER_HOME=$(sudo -Hiu $MISP_USER env | grep HOME |cut -f 2 -d=)
  mkdir $MISP_USER_HOME/.cache
  chown $MISP_USER:$MISP_USER $MISP_USER_HOME/.cache
  chown www-data:www-data /var/www/.cache

  debug "Generating rc.local"
  genRCLOCAL

  debug "Installing MISP dashboard"
  mispDashboard

  debug "Setting up main MISP virtualenv"
  # Needs virtualenv
  sudo -u www-data virtualenv -p python3 ${PATH_TO_MISP}/venv

  debug "Installing python-cybox"
  cd $PATH_TO_MISP/app/files/scripts/python-cybox
  sudo -H -u www-data ${PATH_TO_MISP}/venv/bin/pip install .
  debug "Installing python-stix"
  cd $PATH_TO_MISP/app/files/scripts/python-stix
  sudo -H -u www-data ${PATH_TO_MISP}/venv/bin/pip install .
  # install STIX2.0 library to support STIX 2.0 export:
  debug "Installing cti-python-stix2"
  cd ${PATH_TO_MISP}/cti-python-stix2
  sudo -H -u www-data ${PATH_TO_MISP}/venv/bin/pip install -I .
  debug "Installing mixbox"
  cd $PATH_TO_MISP/app/files/scripts/mixbox
  sudo -H -u www-data ${PATH_TO_MISP}/venv/bin/pip install .
  # install PyMISP
  debug "Installing PyMISP"
  cd $PATH_TO_MISP/PyMISP
  sudo -H -u www-data ${PATH_TO_MISP}/venv/bin/pip install .

  # Install Crypt_GPG and Console_CommandLine
  debug "Installing pear Console_CommandLine"
  pear install ${PATH_TO_MISP}/INSTALL/dependencies/Console_CommandLine/package.xml
  debug "Installing pear Crypt_GPG"
  pear install ${PATH_TO_MISP}/INSTALL/dependencies/Crypt_GPG/package.xml

  debug "Installing composer with php 7.3 updates"
  composer73

  $SUDO_WWW cp -fa $PATH_TO_MISP/INSTALL/setup/config.php $PATH_TO_MISP/app/Plugin/CakeResque/Config/config.php

  chown -R www-data:www-data $PATH_TO_MISP
  chmod -R 750 $PATH_TO_MISP
  chmod -R g+ws $PATH_TO_MISP/app/tmp
  chmod -R g+ws $PATH_TO_MISP/app/files
  chmod -R g+ws $PATH_TO_MISP/app/files/scripts/tmp

  debug "Setting up database"
  if [ ! -e /var/lib/mysql/misp/users.ibd ]; then
    echo "
      set timeout 10
      spawn mysql_secure_installation
      expect \"Enter current password for root (enter for none):\"
      send -- \"\r\"
      expect \"Set root password?\"
      send -- \"y\r\"
      expect \"New password:\"
      send -- \"${DBPASSWORD_ADMIN}\r\"
      expect \"Re-enter new password:\"
      send -- \"${DBPASSWORD_ADMIN}\r\"
      expect \"Remove anonymous users?\"
      send -- \"y\r\"
      expect \"Disallow root login remotely?\"
      send -- \"y\r\"
      expect \"Remove test database and access to it?\"
      send -- \"y\r\"
      expect \"Reload privilege tables now?\"
      send -- \"y\r\"
      expect eof" | expect -f -

    mysql -u $DBUSER_ADMIN -p$DBPASSWORD_ADMIN -e "create database $DBNAME;"
    mysql -u $DBUSER_ADMIN -p$DBPASSWORD_ADMIN -e "grant usage on *.* to $DBNAME@localhost identified by '$DBPASSWORD_MISP';"
    mysql -u $DBUSER_ADMIN -p$DBPASSWORD_ADMIN -e "grant all privileges on $DBNAME.* to '$DBUSER_MISP'@'localhost';"
    mysql -u $DBUSER_ADMIN -p$DBPASSWORD_ADMIN -e "flush privileges;"

    enableServices

    $SUDO_WWW cat $PATH_TO_MISP/INSTALL/MYSQL.sql | mysql -u $DBUSER_MISP -p$DBPASSWORD_MISP $DBNAME

    echo "<?php
  class DATABASE_CONFIG {
          public \$default = array(
                  'datasource' => 'Database/Mysql',
                  //'datasource' => 'Database/Postgres',
                  'persistent' => false,
                  'host' => '$DBHOST',
                  'login' => '$DBUSER_MISP',
                  'port' => 3306, // MySQL & MariaDB
                  //'port' => 5432, // PostgreSQL
                  'password' => '$DBPASSWORD_MISP',
                  'database' => '$DBNAME',
                  'prefix' => '',
                  'encoding' => 'utf8',
          );
  }" | $SUDO_WWW tee $PATH_TO_MISP/app/Config/database.php
  else
    echo "There might be a database already existing here: /var/lib/mysql/misp/users.ibd"
    echo "Skipping any creations…"
    sleep 3
  fi

  debug "Generating Certificate"
  openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
  -subj "/C=${OPENSSL_C}/ST=${OPENSSL_ST}/L=${OPENSSL_L}/O=${OPENSSL_O}/OU=${OPENSSL_OU}/CN=${OPENSSL_CN}/emailAddress=${OPENSSL_EMAILADDRESS}" \
  -keyout /etc/ssl/private/misp.local.key -out /etc/ssl/private/misp.local.crt

  debug "Generating Apache Conf"
  genApacheConf

  echo "127.0.0.1 misp.local" | tee -a /etc/hosts

  debug "Disabling site default-ssl, enabling misp-ssl"
  a2dissite default-ssl
  a2ensite misp-ssl

  for key in upload_max_filesize post_max_size max_execution_time max_input_time memory_limit
  do
      sed -i "s/^\($key\).*/\1 = $(eval echo \${$key})/" $PHP_INI
  done

  debug "Restarting Apache2"
  systemctl restart apache2

  debug "Setting up logrotate"
  cp $PATH_TO_MISP/INSTALL/misp.logrotate /etc/logrotate.d/misp
  chmod 0640 /etc/logrotate.d/misp

  $SUDO_WWW cp -a $PATH_TO_MISP/app/Config/bootstrap.default.php $PATH_TO_MISP/app/Config/bootstrap.php
  $SUDO_WWW cp -a $PATH_TO_MISP/app/Config/core.default.php $PATH_TO_MISP/app/Config/core.php
  $SUDO_WWW cp -a $PATH_TO_MISP/app/Config/config.default.php $PATH_TO_MISP/app/Config/config.php

  chown -R www-data:www-data $PATH_TO_MISP/app/Config
  chmod -R 750 $PATH_TO_MISP/app/Config

  debug "Setting up GnuPG"
  setupGnuPG

  chmod +x $PATH_TO_MISP/app/Console/worker/start.sh

  debug "Running Core Cake commands"
  coreCAKE
  dashboardCake
  sudo -H -u www-data $CAKE Admin setSetting "MISP.python_bin" "${PATH_TO_MISP}/venv/bin/python"

  debug "Update: Galaxies, Template Objects, Warning Lists, Notice Lists, Taxonomies"
  updateGOWNT

  gitPullAllRCLOCAL

  debug "Installing misp-modules"
  mispmodules

  debug "Installing Viper"
  viper

  debug "Setting permissions"
  permissions

  debug "Running Then End!"
  theEnd
}

debug "Checking if we are run as the installer template"
if [[ $0 == "./INSTALL.debian.tpl.sh" ]]; then
  generateInstaller
fi

debug "Checking for parameters or Kali Install"
if [[ $# -ne 1 && $0 != "/tmp/misp-kali.sh" ]]; then
  usage
  exit 
else
  debug "Setting install options with given parameters."
  setOpt $@
  checkOpt core && echo "core selected"
  checkOpt viper && echo "viper selected"
  checkOpt modules && echo "modules selected"
  checkOpt dashboard && echo "dashboard selected"
  checkOpt mail2 && echo "mail2 selected"
  checkOpt all && echo "all selected"
  checkOpt pre && echo "pre selected"
fi

debug "Checking flavour"
checkFlavour
debug "Setting MISP variables"
MISPvars

 
if [ "${FLAVOUR}" == "ubuntu" ]; then
  RELEASE=$(lsb_release -s -r| tr [A-Z] [a-z])
  if [ "${RELEASE}" == "18.04" ]; then
    echo "Install on Ubuntu 18.04 LTS fully supported."
    echo "Please report bugs/issues here: https://github.com/MISP/MISP/issues"
  fi
  if [ "${RELEASE}" == "18.10" ]; then
    echo "Install on Ubuntu 18.10 not supported, bye."
    exit 1
  fi
  if [ "${RELEASE}" == "19.04" ]; then
    echo "Install on Ubuntu 19.04 not supported, bye"
    exit 1
  fi
  if [ "${RELEASE}" == "19.10" ]; then
    echo "Install on Ubuntu 19.10 not supported, bye"
    exit 1
  fi
  echo "Installation done!"
  exit 0
fi

if [ "${FLAVOUR}" == "debian" ]; then
  CODE=$(lsb_release -s -c| tr [A-Z] [a-z])
  if [ "${CODE}" == "buster" ]; then
    echo "Install on Debian testing fully supported."
    echo "Please report bugs/issues here: https://github.com/MISP/MISP/issues"
    installDepsPhp73
  fi
  if [ "${CODE}" == "sid" ]; then
    echo "Install on Debian unstable not fully supported."
    echo "Please report bugs/issues here: https://github.com/MISP/MISP/issues"
    installDepsPhp73
  fi
  if [ "${CODE}" == "stretch" ]; then
    echo "Install on Debian stable fully supported."
    echo "Please report bugs/issues here: https://github.com/MISP/MISP/issues"
    installDepsPhp72
  fi
  echo "Installation done!"
  exit 0
fi

if [ "${FLAVOUR}" == "tsurugi" ]; then
  CODE=$(lsb_release -s -c| tr [A-Z] [a-z])
  if [ "${CODE}" == "bamboo" ]; then
    echo "Install on Tsurugi Lab semi-supported."
    echo "Please report bugs/issues here: https://github.com/MISP/MISP/issues"
  fi
  if [ "${CODE}" == "soy sauce" ]; then
    echo "Install on Tsurugi Acquire semi-supported."
    echo "Please report bugs/issues here: https://github.com/MISP/MISP/issues"
  fi
  echo "Installation done!"
  exit 0
fi

if [ "${FLAVOUR}" == "kali" ]; then
  kaliOnRootR0ckz
  installMISPonKali
  echo "Installation done!"
  exit 0
fi
