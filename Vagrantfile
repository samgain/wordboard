# read settings file
require "yaml"
settings = YAML.load_file("settings.yaml")

# check for required plugins
settings["plugins"].each do |plugin|
  unless Vagrant.has_plugin?(plugin)
    raise "Missing plugin. Run: vagrant plugin install " + plugin
  end
end

Vagrant.configure(2) do |config|
  # configure VM
  config.vm.box = settings["box"]
  config.vm.hostname = settings["hostname"]
  config.vm.provider "virtualbox" do |vb|
    vb.name = settings["name"]
    vb.memory = settings["memory"]
    vb.cpus = settings["cpus"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end
  
  # share code with VM
  config.vm.synced_folder "./", "/wordboard", type: "virtualbox"

  # start vagrant ssh in correct location
  config.vm.provision :shell, privileged: false, inline: <<-SHELL
    grep -q 'cd /wordboard' ~/.bashrc || echo 'cd /wordboard' >> ~/.bashrc
  SHELL

  config.vm.provision :shell, path: 'provision.sh'
end


