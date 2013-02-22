require 'spec_helper'

describe 'logstash', :type => 'class' do
 context "With a package" do
  context "On Debian OS" do
    let :facts do
      {
        :operatingsystem => 'Debian'
      }
    end
   
    # init.pp
    it { should contain_class('logstash::package') }
    it { should contain_class('logstash::config') }
    it { should contain_class('logstash::service') }

    # package.pp
    it { should contain_package('logstash') }

    # service.pp
    it { should contain_service('logstash') }

    # config.pp
  end

   context "On Ubuntu OS" do
    let :facts do
      {
        :operatingsystem => 'Ubuntu'
      }
    end

    # init.pp
    it { should contain_class('logstash::package') }
    it { should contain_class('logstash::config') }
    it { should contain_class('logstash::service') }

    # package.pp
    it { should contain_package('logstash') }

    # service.pp
    it { should contain_service('logstash') }

    # config.pp
  
  end

  context "On CentOS OS " do
    let :facts do
      {
        :operatingsystem => 'CentOS'
      }
    end

    # init.pp
    it { should contain_class('logstash::package') }
    it { should contain_class('logstash::config') }
    it { should contain_class('logstash::service') }

    # package.pp
    it { should contain_package('logstash') }

    # service.pp
    it { should contain_service('logstash') }

    # config.pp
   
  end

  context "On RedHat OS " do
    let :facts do
      {
        :operatingsystem => 'Redhat'
      }
    end

    # init.pp
    it { should contain_class('logstash::package') }
    it { should contain_class('logstash::config') }
    it { should contain_class('logstash::service') }

    # package.pp
    it { should contain_package('logstash') }

    # service.pp
    it { should contain_service('logstash') }

    # config.pp
    
  end

  context "On Fedora OS " do
    let :facts do
      {
        :operatingsystem => 'Fedora'
      }
    end

    # init.pp
    it { should contain_class('logstash::package') }
    it { should contain_class('logstash::config') }
    it { should contain_class('logstash::service') }

    # package.pp
    it { should contain_package('logstash') }

    # service.pp
    it { should contain_service('logstash') }

    # config.pp
  
  end

  context "On Scientific OS " do
    let :facts do
      {
        :operatingsystem => 'Scientific'
      }
    end

    # init.pp
    it { should contain_class('logstash::package') }
    it { should contain_class('logstash::config') }
    it { should contain_class('logstash::service') }

    # package.pp
    it { should contain_package('logstash') }

    # service.pp
    it { should contain_service('logstash') }

    # config.pp
   
  end

  context "On Amazon OS " do
    let :facts do
      {
        :operatingsystem => 'Amazon'
      }
    end

    # init.pp
    it { should contain_class('logstash::package') }
    it { should contain_class('logstash::config') }
    it { should contain_class('logstash::service') }

    # package.pp
    it { should contain_package('logstash') }

    # service.pp
    it { should contain_service('logstash') }

    # config.pp
   
  end

  context "On an unknown OS" do
    let :facts do
      {
        :operatingsystem => 'Darwin'
      }
    end
 
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
 end

 context "With custom jar file" do

  context "and built in init script" do

    let :facts do {
        :operatingsystem => 'CentOS'
    }
    end

    let :params do {
     :provider => 'custom',
     :jarfile => "puppet:///path/to/logstash-1.1.9.jar",
     :installpath => '/opt/logstash'
    }
    end

    it { should_not contain_package('logstash') }
    it { should contain_file('/etc/init.d/logstash') }
    it { should contain_service('logstash') }

  end

  context "and custom init script" do

    let :facts do {
        :operatingsystem => 'CentOS'
    }
    end

    let :params do {
     :provider => 'custom',
     :jarfile => "puppet:///path/to/logstash-1.1.9.jar",
     :installpath => '/opt/logstash',
     :initfile => "puppet:///path/to/logstash.init"
    }

    end

    it { should_not contain_package('logstash') }
    it { should contain_file('/etc/init.d/logstash').with('source' => 'puppet:///path/to/logstash.init') }
    it { should contain_service('logstash') }

  end
 end
 context "without service management" do
  let :facts do {
        :operatingsystem => 'CentOS'
    }
  end
  let :params do {
    :status => 'unmanaged'
  }
  end
  it { should_not contain_servce('logstash') }
 end

 context "Do not manage the service" do
   context "with a package" do
     let :facts do {
         :operatingsystem => 'CentOS'
     }
     end

     let :params do {
      :status => 'unmanaged'
     }
     end

     it { should contain_service('logstash') }
   end
   context "with a jar file" do
     let :facts do {
         :operatingsystem => 'CentOS'
     }
     end

     let :params do {
      :provider => 'custom',
      :jarfile => "puppet:///path/to/logstash-1.1.9.jar",
      :installpath => '/opt/logstash',
      :status => 'unmanaged'
     }
     end

     it { should_not contain_package('logstash') }
     it { should_not contain_file('/etc/init.d/logstash') }
     it { should_not contain_service('logstash') }

   end
 end
end
