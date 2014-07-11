describe Rspec::ExitMatchers do
  it 'works'do
    expect { exit(1) }.to exit_with_status(1)
  end

  it 'returns false for block which does not exit' do
    block = -> {  } # no exit
    subject = Rspec::ExitMatchers::ExitWithStatus.new &block

    expect(subject.matches?(1)).to be_falsey
  end

  it 'returns true for block which does exit with status 1' do
    block = -> { exit(1) }
    subject = Rspec::ExitMatchers::ExitWithStatus.new &block

    expect(subject.matches?(1)).to be_truthy
  end

  it 'returns false for block which does exit with status 0' do
    block = -> { exit(0) }
    subject = Rspec::ExitMatchers::ExitWithStatus.new &block

    expect(subject.matches?(1)).to be_falsey
  end

  it '#exit_with_status is defined when included in context'do
    context = Class.new do
      include Rspec::ExitMatchers
    end.new

    context.respond_to? :exit_with_status
  end
end
