#/bin/bash

source ./tools/config.sh

DL_REPO_URL="https://github.com/espressif/esp-dl.git"
SR_REPO_URL="https://github.com/espressif/esp-sr.git"

#
# CLONE/UPDATE ARDUINO
#

if [ ! -d "$AR_COMPS/arduino" ]; then
	git clone $AR_REPO_URL "$AR_COMPS/arduino"
fi

if [ -z $AR_BRANCH ]; then
	if [ -z $GITHUB_HEAD_REF ]; then
		current_branch=`git branch --show-current`
	else
		current_branch="$GITHUB_HEAD_REF"
	fi
	echo "Current Branch: $current_branch"
	if [[ "$current_branch" != "master" && `git_branch_exists "$AR_COMPS/arduino" "$current_branch"` == "1" ]]; then
		export AR_BRANCH="$current_branch"
	else
		has_ar_branch=`git_branch_exists "$AR_COMPS/arduino" "idf-$IDF_BRANCH"`
		if [ "$has_ar_branch" == "1" ]; then
			export AR_BRANCH="idf-$IDF_BRANCH"
		else
			has_ar_branch=`git_branch_exists "$AR_COMPS/arduino" "$AR_PR_TARGET_BRANCH"`
			if [ "$has_ar_branch" == "1" ]; then
				export AR_BRANCH="$AR_PR_TARGET_BRANCH"
			fi
		fi
	fi
fi

if [ "$AR_BRANCH" ]; then
	git -C "$AR_COMPS/arduino" checkout "$AR_BRANCH" && \
	git -C "$AR_COMPS/arduino" fetch && \
	git -C "$AR_COMPS/arduino" pull --ff-only
fi
if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-DL
#

#if [ ! -d "$AR_COMPS/esp-dl" ]; then
#	git clone $DL_REPO_URL "$AR_COMPS/esp-dl"
#else
#	git -C "$AR_COMPS/esp-dl" fetch && \
#	git -C "$AR_COMPS/esp-dl" pull --ff-only
#fi
#if [ $? -ne 0 ]; then exit 1; fi

#
# CLONE/UPDATE ESP-SR
#

#if [ ! -d "$AR_COMPS/esp-sr" ]; then
#	git clone $SR_REPO_URL "$AR_COMPS/esp-sr"
#else
#	git -C "$AR_COMPS/esp-sr" fetch && \
#	git -C "$AR_COMPS/esp-sr" pull --ff-only
#fi
#if [ $? -ne 0 ]; then exit 1; fi
