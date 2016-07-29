require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Go sample app' do
  describe service('supervisor') do
    it { should be_running }
  end

  describe port(8484) do
    it { should be_listening }
  end

  describe command('supervisorctl status') do
    its(:stdout) { should match(/^go-app\s*RUNNING/) }
  end
end
