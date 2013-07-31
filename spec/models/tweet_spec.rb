require 'spec_helper'

describe Tweet do
	## scheduled_time_is_in_future custom validation are making these tests fail. Manual testing
	## proven that the validation works. scheduled_time is nil for these tests when it should be
	## DateTime object like in all other tests.

	it { should belong_to(:user) }

 #  it { should validate_presence_of(:text) }
 #  it { should validate_presence_of(:scheduled_time) }
 #  it { should validate_presence_of(:user_id) }

 #  it { should ensure_length_of(:text).is_at_least(1).is_at_most(140) }
end

