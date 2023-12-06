Facter.add(:join_command) do
  setcode do
    if File.exists? '/etc/kubernetes/admin.conf'
      command = 'kubeadm token create --print-join-command'
      join_command = Facter::Core::Execution.execute(command)
    end
  end
end
