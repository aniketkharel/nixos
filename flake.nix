{
  description = "kratos collection of flake templates";

  outputs = { self }: {

    templates = {

      vm = {
        path = ./vm;
        description = "A very basic vm flake template.";
        welcomeText = ''
          You just created a vm flake template.
          '';
      };

      personal = {
        path = ./personal;
        description = "A very basic personal machine flake template.";
        welcomeText = ''
          You just created a vm flake template.
          '';
      };

      work = {
        path = ./work;
        description = "A very basic work machine flake template.";
        welcomeText = ''
          You just created a vm flake template.
          '';
      };

      defaultTemplate = self.templates.vm;
    };
  }
}
