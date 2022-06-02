#!/bin/sh

if [ ! -d "/root/.acme.sh" ]; then
    curl https://get.acme.sh | sh
fi

/root/.acme.sh/acme.sh --issue --dns dns_cf -d YOURDOMAIN
