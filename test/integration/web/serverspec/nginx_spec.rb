require 'serverspec'

set :backend, :exec

describe "nginx service" do

  describe port(80) do
    it { should be_listening }
  end

  describe service("nginx") do
    it { should be_running }
  end

  describe command("nginx -t") do
    its(:exit_status) { should eq 0 }
  end

end
