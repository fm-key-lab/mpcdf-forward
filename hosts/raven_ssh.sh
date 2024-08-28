#!/bin/bash
#
# Raven cluster at MPCDF
# Prints an ssh configuration for the user, selecting a login node at random
# Sample usage: bash raven_ssh.sh
echo
read -p "MPCDF username > "  FORWARD_USERNAME

echo "Host gate1 gate2 raven raven01i raven02i raven03i raven04i
    User ${FORWARD_USERNAME}
    HostName %h.mpcdf.mpg.de
    ControlMaster auto
    ControlPath ~/.ssh/control-%h-%p-%r
    ControlPersist yes
    LogLevel ERROR
    Port 22
    StrictHostKeyChecking ask
    UserKnownHostsFile ~/.ssh/known_hosts
    GSSAPIAuthentication yes
    GSSAPIDelegateCredentials yes

Host raven raven01i raven02i raven03i raven04i
    ProxyJump gate1

Match originalhost gate*,raven*
    CanonicalDomains mpcdf.mpg.de
    CanonicalizeFallbackLocal no
    CanonicalizeHostname yes

Match canonical host gate*
    User ${FORWARD_USERNAME}
    Compression yes
    ServerAliveInterval 120

Match canonical host raven*
    User ${FORWARD_USERNAME}
    Compression yes
    ProxyJump gate1"