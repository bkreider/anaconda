#!/usr/bin/env ruby
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'anaconda::env' do
    let(:facts) { {:kernel => 'linux', } }
    let(:title) { 'env1' }

    it { should include_class('anaconda') }

    describe 'defaults' do
        it { should contain_exec('anaconda_env_env1') }
    end
end

