Facter.add(:join_command) do
  setcode do
    command = 'kubeadm token create --print-join-command'
    host = Facter::Core::Execution.execute(command)
  end
end
