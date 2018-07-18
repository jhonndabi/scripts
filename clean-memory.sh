#!/usr/bin/env bash

echo 3 > /proc/sys/vm/drop_caches > /dev/null
sysctl -w vm.drop_caches=3 > /dev/null

swapoff -a > /dev/null
echo "desligando memória swap" > /dev/null

echo 3 > /proc/sys/vm/drop_caches > /dev/null
sysctl -w vm.drop_caches=3 > /dev/null

swapon -a  > /dev/null
echo "reativando memória swap" > /dev/null
