require 'spec_helper'

describe User do
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:nickname) }
end