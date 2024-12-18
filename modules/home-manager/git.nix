{
  config,
  lib,
  pkgs,
  ...
}: {
  programs = {
    # https://nixos.asia/en/git
    git = {
      enable = true;
      userName = "Paul Dufour";
      userEmail = "paul.dufour@epita.fr";
      ignores = [
        # Direnv #
        ##########
        ".direnv/"

        # Compiled source #
        ###################
        "*.[568vq]"
        "*.a"
        "*.cgo1.go"
        "*.cgo2.c"
        "*.class"
        "*.dll"
        "*.exe"
        "*.exe"
        "*.o"
        "*.so"
        "[568vq].out"
        "_cgo_defun.c"
        "_cgo_export.*"
        "_cgo_gotypes.go"
        "_obj"
        "_test"
        "_testmain.go"

        # Ruby/Rails #
        ##############
        "**.orig"
        "*.gem"
        "*.rbc"
        "*.sassc"
        ".bundle/"
        ".sass-cache/"
        ".yardoc"
        "/public/assets/"
        "/public/index.html"
        "/public/system/*"
        "/vendor/bundle/"
        "_yardoc"
        "app/assets/stylesheets/scaffolds.css.scss"
        "capybara-*.html"
        "config/*.yml"
        "coverage/"
        "lib/bundler/man/"
        "pickle-email-*.html"
        "pkg/"
        "rerun.txt"
        "spec/reports/"
        "spec/tmp/*"
        "test/tmp/"
        "test/version_tmp/"
        "tmp/*"
        "tmp/**/*"

        # Packages #
        ############
        "*.7z"
        "*.bzip"
        "*.deb"
        "*.dmg"
        "*.egg"
        "*.gem"
        "*.gz"
        "*.iso"
        "*.jar"
        "*.lzma"
        "*.rar"
        "*.rpm"
        "*.tar"
        "*.xpi"
        "*.xz"
        "*.zip"

        # Logs and databases #
        ######################
        "*.log"
        "*.sqlite[0-9]"

        # OS generated files #
        ######################
        ".DS_Store"
        ".Spotlight-V100"
        ".Trashes/"
        "._*"
        ".directory"
        "Desktop.ini"
        "Icon?"
        "Thumbs.db"
        "ehthumbs.db"

        # Text-Editors files #
        ######################
        "*.bak"
        "*.pydevproject"
        "*.tmp"
        "*.tmproj"
        "*.tmproject"
        "*.un~"
        "*~"
        "*~.nib"
        ".*.sw[a-z]"
        ".\#*"
        ".classpath/"
        ".cproject/"
        ".elc/"
        ".loadpath/"
        ".metadata/"
        ".project/"
        ".redcar/"
        ".settings/"
        ".ycm_extra_conf.py"
        "/.emacs.desktop"
        "/.emacs.desktop.lock"
        "Session.vim"
        "\#*"
        "\#*\#"
        "auto-save-list/"
        "local.properties"
        "nbactions.xml"
        "nbproject/"
        "tmtags/"
        "tramp/"

        # Other Version Control Systems #
        #################################
        ".svn/"

        # Invert gitignore (Should be last) #
        #####################################
        "!.keep"
        "!.gitkeep"
        "!.gitignore"
      ];

      aliases = {
        kk = "status";
        ee = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; vim `f`";
        aa = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`";
      };
      extraConfig = {
        init.defaultBranch = "main";
        commit.verbose = true;
      };
      lfs.enable = true;

      includes = [
        {
          condition = "hasconfig:remote.*.url:*:prologin/**/**";
          contents = {
            user.email = "paul.dufour@prologin.org";
          };
        }
        {
          condition = "hasconfig:remote.*.url:*gitlab.corp.dblc.io:**/**";
          contents = {
            user.email = "paul.dufour@diabolocom.com";
          };
        }
      ];
    };
  };
}
