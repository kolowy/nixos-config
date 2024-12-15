{
  security.krb5 = {
    enable = true;
    settings = {
      libdefaults = {
        default_realm = "PROLOGIN.EU";
        dns_fallback = true;
        dns_canonicalize_hostname = false;
        rnds = false;
        forwardable = true;
      };
      domain_realm = {
        ".prologin.eu" = "PROLOGIN.EU";
        "prologin.eu" = "PROLOGIN.EU";
      };

      realms = {
        "PROLOGIN.ORG" = {
          admin_server = "kerberos.prologin.org";
          kdc = "kerberos.prologin.org";
        };
        "PROLOGIN.EU" = {
          admin_server = "kerberos.prologin.eu";
          kdc = "kerberos.prologin.eu";
        };
      };
    };
  };
}
