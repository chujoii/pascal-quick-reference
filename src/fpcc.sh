#!/bin/sh

fpc $1 2>&1 | grep -Ei --color 'error|fatal|warning|note|'
