#!/bin/sh

sam build;
sam deploy --config-env "rodolfo"
date
