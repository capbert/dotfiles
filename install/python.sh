#! /bin/bash

echo 'python stuff'
if type pip  &>/dev/null; then
    echo "pip found, installing virtualenv and virtualenvwrapper"
    pip install virtualenv
    pip install virtualenvwrapper

fi
