require 'spec_helper'

describe CoolPay do
  it 'has a version number' do
    expect(CoolPay::VERSION).not_to be_nil
  end

  it 'has an api version' do
    expect(CoolPay::API_VERSION).not_to be_nil      
  end
  
  it 'has base url' do
    expect(CoolPay::BASE_URI).not_to be_nil
  end

  context '.logger' do
    it 'has a logger' do
      expect(CoolPay.logger).not_to be_nil
    end
  end  
  
end
