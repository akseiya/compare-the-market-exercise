#!/bin/bash

bundle check || bundle install
xvfb-run rspec
