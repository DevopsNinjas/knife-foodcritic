$LOAD_PATH << File.expand_path('../../lib', __FILE__)

RSpec.configure do |c|
  c.before { allow($stdout).to receive(:puts) }
end