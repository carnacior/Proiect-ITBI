#!/bin/bash

root_dir="/home/lucaa303/UserFS/Root"

while true; do
	active_users=$(who | awk '{print $1}')
	for user in $active_users; do
		if [ ! -d "$root_dir/$user" ]; then
			mkdir "$root_dir/$user"
			touch "$root_dir/$user/procs"
		fi
		ps aux > "$root_dir/$user/procs"
		rmdir "$root_dir/$user/lastlogin"
	done
	for user_dir in "$root_dir"/*/; do
		userul=$(basename "$user_dir")
		if ! echo "$active_users" | grep -q "^$userul$"; then
			touch "$root_dir/$user/lastlogin"
			: > "$user_dir/procs"
        		date '+%Y-%m-%d %H:%M:%S' > "$user_dir/lastlogin"
		fi
	done
	sleep 30
done
