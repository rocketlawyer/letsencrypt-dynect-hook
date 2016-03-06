#!/usr/bin/env bash

echo -n "Dynect customer: "
read -r DYN_CUST
export DYN_CUST=$DYN_CUST

echo -n "Dynect username: "
read -r DYN_USER
export DYN_USER=$DYN_USER

echo -n "Dynect password: "
read -rs DYN_PASS
export DYN_PASS=$DYN_PASS
