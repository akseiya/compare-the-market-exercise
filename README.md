# Compare the Market exercise
Framework and scenarios for CtM's technical challenge

## Solution

To achieve the requested goal of running a set of tests on a remote webpage I decided to use
- RSpec for base testing capabilities with specification-by-example approach
- Selenium + Chromedriver as the base automation tool (headless drivers introduce risk of inability to render certain dynamic pages)
- Capybara as the BDD layer

Capybara provides its own layer of abstraction and human readability, thus the PageObjects-like code is generally limited to masking
raw selectors for automation-unfriendly elements. Page elements are still Capybara/Selenium objects with their usual query/interaction capabilities.

## Infrastructure

The scripts and framework have been written for running under Ubuntu 16.04 LTS.

Remote Git repository considerations are outside scope. Whichever way the code has landed on its target machine, I'm only concerned with steps that might need to be taken once it's there.

### Prerequisites

1. bash
1. Ruby 2.3
1. Bundler
1. Google Chrome

## Running the tests

The `spec` script provided in root directory of the repo is intended to run the test suite in virtual framebuffer, producing results as text output in the terminal.

## Test scope

Chief branches of the user journey seem to be:
- quote with or without bill to hand (enables entering particular tariff etc)
- quote for gas, energy or both (extra data entries available)

### Limitations

The challenge description refers to best coverage of functionality, thus I limit the tests to functional ones. Browser/OS support, performance etc are considered descoped.

The extra feature of back navigation, while useful, does not seem crucial.

Testing the mail quote would require extra setup (receiving account) and code (retrieving the message).

### Scenarios

1. Getting joint gas and electricity quote using a bill and single provider
1. Getting joint quote with a bill for a mix of providers
1. Getting a joint quote without a bill (this disables single provider option so two different ones are tested)
