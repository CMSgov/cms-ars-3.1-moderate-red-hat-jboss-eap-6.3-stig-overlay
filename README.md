# cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay
InSpec profile overlay to validate the secure configuration of Red Hat JBoss EAP 6.3 against [DISA's](https://iase.disa.mil/stigs/Pages/index.aspx) Red Hat JBoss Enterprise Application Platform (EAP) 6.3 STIG Version 1 Release 3 tailored for [CMS ARS 3.1](https://www.cms.gov/Research-Statistics-Data-and-Systems/CMS-Information-Technology/InformationSecurity/Info-Security-Library-Items/ARS-31-Publication.html) for CMS systems categorized as Moderate.

## Container-Ready: Profile updated to adapt checks when the running against a containerized instance of MongoDB, based on reference container: (docker pull registry1.dso.mil/ironbank/opensource/jboss/wildfly:latest)

## Getting Started

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

The latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Tailoring to Your Environment
The following inputs must be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).

```
# description: Command used to connect to the wildfly instance.
connection: ''

    # For an out of the box installation of JBOSS: 
    # connection: '--connect'

    # If targeting a remote JBOSS instance: 
    # connection: '--connect --controller=<IP_OF_REMOTE_JBOSS_HOST>:9990'

    # If for example the JBOSS instance has been hardened with the wildfly-hardening cookbook (https://github.com/mitre/chef-red-hat-jboss-eap-6.3-stig-baseline) set the connection to the following:
    # connection: '-Djavax.net.ssl.trustStore=/opt/wildfly/standalone/configuration/a.jks --connect -u=test1 -p=test'

    # For further examples of how to utilize the JBOSS CLI 
    # JBOSS CLI Docs: https://docs.jboss.org/author/display/WFLY/Command+Line+Interface
  
# description: List of authorized users with the auditor role (e.g., ['user-auditor']).
auditor_role_users: []
           
# description: List of authorized users with the administrator role (e.g., ['user-admin']).
administrator_role_users: []
  
# description: List of authorized users with the SuperUser role (e.g., ['user-superuser', 'user-$local']).
superuser_role_users: []
  
# description: List of authorized auditor users (e.g., ['user-auditor']).  
auditor_group_users: []
           
# description: Group owner of files/directories (e.g., 'wildfly').
wildfly_group: ''
           
# description: User owner of files/directories (e.g., 'wildfly').
wildly_owner: ''
  
# description: List of authorized applications (e.g., ['sample.war']).
approved_applications: []

# description: List of authorized users (e.g., ['jboss.management.http.port=9990', 'jboss.management.https.port=9993', 'jboss.http.port=8080', 'jboss.https.port=8443', 'jboss.ajp.port=8009']).
auditor_group_users: []
           
# description: List of authorized users with the auditor role (e.g., ['user-auditor']).
auditor_role_users: []

# description: List of authorized users with the administrator role (e.g., ['user-admin']).
administrator_role_users: []
           
# description: List of authorized users with the SuperUser role (e.g., ['user-$local', 'user-superuser']).
superuser_role_users: []

# description: List of authorized users with the deployer role (e.g., ['user-deployer']).
deployer_role_users: []
           
# description: List of authorized users with the maintainer role (e.g., ['user-maintainer']).
maintainer_role_users: []

# description: List of authorized users with the monitor role (e.g., ['user-monitor']).
monitor_role_users: []
           
# description: 'List of authorized users with the operator role (e.g., [user-operator]).'  
operator_role_users: []

# description: 'Set to true if ldap is being used.'
ldap: false

# description: 'Set to true if widlfy is being used as a high-availability cluster.'
high_availability: false
```

## Running This Overlay
If this is a fresh JBOSS installation, run the following command from the command line of the system hosting the JBOSS instance:

``` bash
# Need to run the command 
$ /bin/sh /opt/wildfly/bin/jboss-cli.sh --connect 
# Enter P to permanetely accept the certificate
```
## Running This Overlay Directly from Github

Against a _**locally-hosted**_ instance (i.e., InSpec installed on the target)
```
inspec exec https://github.com/mitre/redhat-jboss-enterprise-application-platform-6.3-stig-baseline/archive/master.tar.gz --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json>
```
Against a _**docker-containerized**_ instance (i.e., InSpec installed on the node hosting the container):
```bash
inspec exec https://github.com/mitre/redhat-jboss-enterprise-application-platform-6.3-stig-baseline/archive/master.tar.gz -t docker://instance_id --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter json:<path_to_your_output_file/name_of_your_output_file.json> 
```

Runs this profile over ssh to the host at IP address hostip as a privileged user account (i.e., an account with administrative privileges), reporting results to both the command line interface (cli) and to a machine-readable JSON file.

### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Overlay from a local Archive copy 

If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this overlay and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.)


When the __"runner"__ host uses this profile overlay for the first time, follow these steps: 

```
mkdir profiles
cd profiles
git clone https://github.com/CMSgov/cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay.git
inspec archive cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay
git pull
cd ..
inspec archive cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay --overwrite
inspec exec <name of generated archive> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```

### Different InSpec Exec commands depending on your target
How to run on a remote target using ssh
```bash
# How to run 
$ inspec exec cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay -t ssh://TARGET_USERNAME:TARGET_PASSWORD@TARGET_IP:TARGET_PORT --input_files <path_to_your_input_file/name_of_your_input_file.yml> 
```

If you need to run your profile with escalated privileges
```bash
# How to run 
$ inspec exec cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay -t ssh://TARGET_USERNAME:TARGET_PASSWORD@TARGET_IP:TARGET_PORT --input_files <path_to_your_input_file/name_of_your_input_file.yml>  --sudo --sudo-options='-u jbosseap'
```

How to run on a remote target using pem key
```bash
# How to run 
$ inspec exec cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT -i PEM_KEY --input_files <path_to_your_input_file/name_of_your_input_file.yml> 
```

How to run on docker container
```bash
Inspec exec cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay -t docker://DOCKER_CONTAINER_ID --input_files <path_to_your_input_file/name_of_your_input_file.yml> 
```

To run it locally on the target with InSpec installed (JBOSS and InSpec installed on same box)
```bash
# How to run 
$ inspec exec cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay --input_files <path_to_your_input_file/name_of_your_input_file.yml> 
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.mitre.org/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Authors
* Eugene Aronne - [ejaronne](https://github.com/ejaronne)
* Danny Haynes - [djhaynes](https://github.com/djhaynes)

## Special Thanks
* Alicia Sturtevant - [asturtevant](https://github.com/asturtevant)
* Shivani Karikar - [karikarshivani](https://github.com/karikarshivani)

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/CMSgov/cms-ars-3.1-moderate-red-hat-jboss-eap-6.3-stig-overlay/issues/new).

### NOTICE

© 2018-2020 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.

### NOTICE 

MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the LICENSE.md file included with this project.

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation.

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.

### NOTICE 

DISA STIGs are published by DISA IASE, see: https://iase.disa.mil/Pages/privacy_policy.aspx
