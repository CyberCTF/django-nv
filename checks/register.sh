#!/bin/sh
# A new account registers and logs in, which proves the database answers.
set -e
jar=$(mktemp)
u=http://web:8000/taskManager
token() { curl -fsS -c "$jar" -b "$jar" "$1" | sed -n "s/.*name='csrfmiddlewaretoken' value='\([^']*\)'.*/\1/p" | head -n 1; }
t=$(token $u/register/)
curl -fsS -c "$jar" -b "$jar" -o /dev/null -e $u/register/ \
  --data "csrfmiddlewaretoken=$t&username=probe$$&email=probe$$@tm.com&password=Probe-pass1&first_name=P&last_name=R" $u/register/
t=$(token $u/login/)
curl -fsS -c "$jar" -b "$jar" -o /dev/null -e $u/login/ \
  --data "csrfmiddlewaretoken=$t&username=probe$$&password=Probe-pass1" $u/login/
page=$(curl -fsS -c "$jar" -b "$jar" $u/dashboard/)
echo "$page" | grep -qi "logout"
