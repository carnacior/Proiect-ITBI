#!/bin/bash

users=$(who | awk '{print $1}')
for user in users: do
	if[ ! find . -name "$user" -type d]; then
		mkdir "$user"
		cd "$user"
		touch procs
		ps aux > procs
	else
		cd "$user"
		ps aux > procs

