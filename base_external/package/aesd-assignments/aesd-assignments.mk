
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
#AESD_ASSIGNMENTS_VERSION = 79357760c01f24d79ec17fcc49ef2d7cf4e7fcb6
#AESD_ASSIGNMENTS_VERSION = 3fcbd252ab59c68bc6eb6f322e20261d651e6956
#AESD_ASSIGNMENTS_VERSION = 8a8a27ded8b59259dc1953a3ba74e343f6c2667c
#AESD_ASSIGNMENTS_VERSION = 4a4b17920f85b11213bac1d95670fc427a82b9ed
#AESD_ASSIGNMENTS_VERSION = 'ab1d246a091bb346578e63aae39e71cda7e77c1d'
#AESD_ASSIGNMENTS_VERSION = '356841accd37a920062ab73e9609866fc4e039a5'
#AESD_ASSIGNMENTS_VERSION = 'ee5a4a23302854f54ab6a78ea8cbf2bccde9c399'
#AESD_ASSIGNMENTS_VERSION = '18a7a6b6da62991e58026f3617ec926641fb9fd1'
#AESD_ASSIGNMENTS_VERSION = '67de042b848640fc47c18206d457216a063b0dc7'
#AESD_ASSIGNMENTS_VERSION = '4b6cdaf1cdd08a9840f055435bd71f028744e8fd'
#AESD_ASSIGNMENTS_VERSION = '4ff4e2ed59bc014e643fa9fdca1fd8b38a29cf58'
#AESD_ASSIGNMENTS_VERSION = '835484b82ba5e99e38f71209953cbcafe43dce1a'
#AESD_ASSIGNMENTS_VERSION = 'e5f1e2d204b1ed929421ef0d0651667a6b0d4f23'
#AESD_ASSIGNMENTS_VERSION = 'b4082831b51c89d621ae9021bae832087f97996f'
#AESD_ASSIGNMENTS_VERSION = '7753c8ec9372e0bdf6d113d532fd961dd9c42b60'
#AESD_ASSIGNMENTS_VERSION = 'd228f5dd9642fea284e1896a3970ea878bbbf042'
#AESD_ASSIGNMENTS_VERSION = '40a912e358abc8b746ad6963093685724fd06e0e'
AESD_ASSIGNMENTS_VERSION = 'aceeeee0cbec8a7130b3b530bff2cfbe7624d820'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-colio1.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin

	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket

endef

$(eval $(generic-package))
