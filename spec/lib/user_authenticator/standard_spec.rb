require 'rails_helper'

describe UserAuthenticator::Standard do
  describe '#perform' do
    let(:authenticator) { described_class.new('jsmith', 'password') }
    subject { authenticator.perform }

    context "when invalid login" do
      it "should raise an error" do
        expect{ subject}.to raise(
          UserAuthenticator::Standard::AuthenticationError
        )
        expect(authenticator.user).to be_nil
      end
    end

    context "when invalid password" do
      
    end

    context "when successed auth" do
      
    end
  end
end