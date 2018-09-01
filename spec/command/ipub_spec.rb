require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Ipub do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ ipub }).should.be.instance_of Command::Ipub
      end
    end
  end
end

