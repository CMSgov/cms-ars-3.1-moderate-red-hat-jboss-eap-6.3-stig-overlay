# encoding: utf-8

include_controls 'red-hat-jboss-eap-6.3-stig-baseline' do
  
  control 'V-62215' do
    desc 'fix', 'Follow procedure "4.4.  Configure the Wildfly Web Server to use HTTPS."  The 
         detailed procedure is found in the Wildfly Security Guide available at the vendor\'s 
         site, RedHat.com.  An overview of steps is provided here. 

         1. Obtain or generate CMS-approved SSL certificates.
         2. Configure the SSL certificate using your certificate values.
         3. Set the SSL protocol to TLS V1.1 or V1.2.'
  end 

  control 'V-62275' do
    desc 'Some networking protocols may not meet organizational security requirements to protect 
         data and components.

         Application servers natively host a number of various features, such as management 
         interfaces, httpd servers and message queues. These features all run on TCPIP ports. This 
         creates the potential that the vendor may choose to utilize port numbers or network services 
         that have been deemed unusable by the organization. The application server must have the 
         capability to both reconfigure and disable the assigned ports without adversely impacting
         application server operation capabilities.' 
  end

  control 'V-62235' do
    impact 0.0
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control 
         is not included in CMS ARS 3.1'
  end	  

  control 'V-62259' do
    impact 0.0
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
  end

  control 'V-62279' do
    desc 'Multifactor authentication creates a layered defense and makes it more
    difficult for an unauthorized person to access the application server.  If one
    factor is compromised or broken, the attacker still has at least one more
    barrier to breach before successfully breaking into the target.  Unlike a
    simple username/password scenario where the attacker could gain access by
    knowing both the username and password without the user knowing his account was
    compromised, multifactor authentication adds the requirement that the attacker
    must have something from the user, such as a token, or to biometrically be the
    user. 
    Multifactor authentication is defined as: using two or more factors to
      achieve authentication.
      Factors include:
      (i) something a user knows (e.g., password/PIN);
      (ii) something a user has (e.g., cryptographic identification device,
      token); or
      (iii) something a user is (e.g., biometric). A PIV or PKI Hardware Token
      meets this definition.
      A privileged account is defined as an information system account with
      authorizations of a privileged user.  These accounts would be capable of
      accessing the web management interface.
      When accessing the application server via a network connection,
      administrative access to the application server must be PKI Hardware Token
      enabled or a CMS-approved soft certificate.'
  end
  
  control 'V-62281' do
    desc 'Configure the application server so required users are individually authenticated by creating 
         individual user accounts. Utilize an LDAP server that is configured according to CMS policy.'
  end

  control 'V-62285' do
    title 'Wildfly management Interfaces must be integrated with a centralized authentication mechanism 
          that is configured to manage accounts according to CMS policy.'
    desc 'Wildfly management Interfaces must be integrated with a centralized authentication mechanism 
    that is configured to manage accounts according to CMS policy.'
  end
  
  control 'V-62343' do
    title 'The Wildlfy server must be configured to use CMS-approved PKI Class 3 or Class 4 certificates.'
    desc 'Class 3 PKI certificates are used for servers and software signing rather than for identifying 
         individuals. Class 4 certificates are used for business-to-business transactions. Utilizing 
         unapproved certificates not issued or approved by CMS creates an integrity risk. The application 
         server must utilize approved CMS Class 3 or Class 4 certificates for software signing and 
         business-to-business transactions.'
    desc 'check', 'Interview the administrator to determine if Wildlfy is using certificates for PKI.  If 
         Wildlfy is not performing any PKI functions, this finding is NA.

         The CA certs are usually stored in a file called cacerts located in the directory 
         $JAVA_HOME/lib/security.  If the file is not in this location, use a search command to locate the 
         file, or ask the administrator where the certificate store is located.

         Open a dos shell or terminal window and change to the location of the certificate store.  To view 
         the certificates within the certificate store, run the command (in this example, the keystore file 
         is cacerts.): keytool -list -v -keystore ./cacerts

         Locate the "OU" field for each certificate within the keystore.  The field should contain either 
         "CMS" as the Organizational Unit (OU).

         If the OU does not show that the certificates are CMS supplied, this is a finding.'
    desc 'fix', 'Configure the application server to use CMS-approved Class 3 or Class 4 PKI certificates.'
  end
  
  control 'V-62309' do
    impact 0.0
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
  end
  
  control 'V-62317' do
    impact 0.0
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
    title 'Wildfly must be configured to use CMS PKI-established certificate authorities for verification 
          of the establishment of protected sessions.'
    desc 'Untrusted Certificate Authorities (CA) can issue certificates, but they may be issued by organizations 
         or individuals that seek to compromise CMS systems or by organizations with insufficient security 
         controls. If the CA used for verifying the certificate is not a CMS-approved CA, trust of this CA 
         has not been established.

         CMS will only accept PKI certificates obtained from a CMS-approved internal or external certificate 
         authority. Reliance on CAs for the establishment of secure sessions includes, for example, the use 
         of SSL/TLS certificates.  The application server must only allow the use of CMS PKI-established 
         certificate authorities for verification.'
    desc 'check', 'Locate the cacerts file for the JVM.  This can be done using the appropriate find command 
         for the OS and change to the directory where the cacerts file is located.

         To view the certificates stored within this file, execute the java command 
         "keytool -list -v -keystore ./cacerts".
  
         Verify that the Certificate Authority (CA) for each certificate is CMS-approved.

         If any certificates have a CA that are not CMS-approved, this is a finding.'
         
    desc 'fix', 'Locate the cacerts file for the JVM.  This can be done using the appropriate find command for the 
         OS and change to the directory where the cacerts file is located.

         Remove the certificates that have a CA that is non-CMS approved, and import CMS CA-approved certificates.'
  end

  control 'V-62345' do
    impact 0.0
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
  end

end


