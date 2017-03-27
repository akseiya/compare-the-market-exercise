# Compare the Market exercise
Framework and scenarios for CtM's technical exercise

## Infrastructure
The scripts and framework have been written for running under Ubuntu 16.04 LTS.
Remote Git repository considerations are outside scope. Whichever way the code has landed on its target machine, I'm only concerned with steps that might need to be taken once it's there.
### Required components
1. Ruby 2.3
2. Bundler
3. Google Chrome
4. XVFB
5. bash

## Running the tests
The `spec` script provided in root directory of the repo is intended to run the test suite in virtual framebuffer, producing results as text output in the terminal.
