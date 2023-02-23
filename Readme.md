# Github Action Demo

Setup the following secrects in `Settings` -> `Secrets and variables` -> `Actions`.

- `Q_ACTIVATIONID`
- `Q_API_SERVER`
- `Q_CUSTOMERID`
- `Q_PASSWORD`
- `Q_POD_URL`
- `Q_USERNAME`


# Key parts

## `Dockerfile`

A sample docker file that is used as a sample that is
built and scanned during the workflow.

## `validate_image.sh`

This is a modified version of the Qualys Community script
found at:  
https://github.com/Qualys/community/tree/master/containerSecurity
(as of commit 98add7d, Dec 19, 2022)

In particular, the version in this repository has been scanned
with [`shellcheck`](https://www.shellcheck.net/) and modified
to correct quoting of variables.

## `.github/workflows/build.yml`

This is the action workflow. It has several steps:
- `start the qualys cs sensor` - Runs the sensor as a background process for the rest of the workflow.
- `docker build and run` - Build the demo container image.
- `validate image` - Runs the script to integorate the scan results.

## `jq_filter.txt`

This fille is a `jq` script to extract the identified vulnerabilities from the
json payload returned by the Qualys api after the container image scan
results are ready.
