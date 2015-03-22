Vagrant.configure('2') do |config|
    config.vm.box = 'azure'
    config.vm.boot_timeout = 1000

    config.vm.provider :azure do |azure|
      azure.mgmt_certificate = ENV['AZURE_MANAGEMENT_CERT']
      azure.mgmt_endpoint = 'https://management.core.windows.net'
      azure.subscription_id = ENV['AZURE_SUBSCRIPTION']
      #azure.storage_acct_name = 'NAME OF YOUR STORAGE ACCOUNT' # optional. A new one will be generated if not provided.

      azure.vm_image = ENV['AZURE_IMAGE']
      azure.vm_user = ENV['AZURE_BOX_USERNAME'] # defaults to 'vagrant' if not provided
      azure.vm_password = ENV['AZURE_BOX_PASSWORD'] # min 8 characters. should contain a lower case letter, an uppercase letter, a number and a special character

      azure.vm_name = ENV['AZURE_BOX_NAME'] # max 15 characters. contains letters, number and hyphens. can start with letters and can end with letters and numbers
      azure.cloud_service_name = ENV['AZURE_SERVICE_NAME']
      azure.deployment_name = ENV['AZURE_DEPLOYMENT_NAME']
      azure.vm_location = ENV['AZURE_ZONE'] # e.g., West US
      azure.private_key_file = ENV['AZURE_BOX_PEM']
      azure.certificate_file = ENV['AZURE_BOX_PEM']

      # Provide the following values if creating a *Nix VM
      #azure.ssh_port = 'A VALID PUBLIC PORT'

      # Provide the following values if creating a Windows VM
      azure.winrm_transport = [ 'http', 'https' ] # this will open up winrm ports on both http (5985) and http (5986) ports
      azure.winrm_https_port = 5986 # customize the winrm https port, instead of 5986
      azure.winrm_http_port = 5985 # customize the winrm http port, insted of 5985

      azure.tcp_endpoints = '3389:53389' # opens the Remote Desktop internal port that listens on public port 53389. Without this, you cannot RDP to a Windows VM.
    end

    config.ssh.username = ENV['AZURE_BOX_USERNAME'] # the one used to create the VM
    config.ssh.password = ENV['AZURE_BOX_PASSWORD'] # the one used to create the VM

    #  Provisioning
    config.vm.provision 'shell', inline: 'iex ((new-object net.webclient).DownloadString(\'https://chocolatey.org/install.ps1\'))'
    config.vm.provision 'shell', inline: 'echo "Launching chef powershell installer script..." ; iex C:\vagrant\powershell\chef-installer.ps1'
    config.vm.provision 'shell', inline: 'cinst -y git.install'
    config.vm.provision 'shell', inline: 'echo "Launching chef repo powershell script..." ; iex C:\vagrant\powershell\chef-repo.ps1'
    # TODO: Figure out how in the hell these dependencies get on the production server, because I am pretty sure this is not the right way...
    config.vm.provision 'shell', inline: 'echo "Launching chef-solo powershell script..." ; iex C:\vagrant\powershell\chef-solo.ps1'
end
