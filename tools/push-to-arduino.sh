#!/bin/bash
source ./tools/config.sh

if [ -x $GITHUB_TOKEN ]; then
	echo "ERROR: GITHUB_TOKEN was not defined"
	exit 1
fi

if ! [ -d "$AR_COMPS/arduino" ]; then
	echo "ERROR: Target arduino folder does not exist!"
	exit 1
fi

#
# UPDATE FILES
#

if [ $AR_HAS_COMMIT == "0" ]; then
	# make changes to the files
	echo "Patching files in branch '$AR_NEW_BRANCH_NAME'..."
	ESP32_ARDUINO="$AR_COMPS/arduino" ./tools/copy-to-arduino.sh

	cd $AR_COMPS/arduino

	# did any of the files change?
	if [ -n "$(git status --porcelain)" ]; then
		echo "Pushing changes to branch '$AR_NEW_BRANCH_NAME'..."
	    git add . && git commit --message "$AR_NEW_COMMIT_MESSAGE" && git push -u origin $AR_NEW_BRANCH_NAME
		if [ $? -ne 0 ]; then
		    echo "ERROR: Pushing to branch '$AR_NEW_BRANCH_NAME' failed"
			exit 1
		fi
	else
	    echo "No changes in branch '$AR_NEW_BRANCH_NAME'"
	    if [ $AR_HAS_BRANCH == "0" ]; then
	    	echo "Delete created branch '$AR_NEW_BRANCH_NAME'"
	    	git branch -d $AR_NEW_BRANCH_NAME
	    fi
	    exit 0
	fi
fi

