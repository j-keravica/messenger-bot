require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to have_db_column(:number) }
  it { is_expected.to have_db_column(:currency) }
  it { is_expected.to have_db_column(:balance) }
  it { is_expected.to have_db_column(:balance) }
  it { is_expected.to have_db_column(:user_id) }
end
