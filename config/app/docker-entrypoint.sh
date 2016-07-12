#!/bin/bash

cd $CON_PROJECT_HOME
gunicorn -w 1 -b 0.0.0.0:8000 --log-file /var/log/gunicorn-error.log --log-level debug myapp:app 
