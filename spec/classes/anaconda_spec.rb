#!/usr/bin/env ruby
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'anaconda' do
    let(:facts) { {:kernel => 'linux', } }

    it { should include_class('anaconda::install') }

    describe 'defaults' do

        it { should contain_exec('install_anaconda') }
        it { should contain_exec('download_anaconda') }
        it { should contain_file('/opt/anaconda/.condarc') }
    end
end
