# InSpec test for recipe servicenow-ritm::automate


# script exists
describe file('/tmp/kitchen/cache/servicenow-ritm.rb') do
  it { should exist }
  it { should be_executable }
  its('content') { should match /^automate_url = \"https:\/\/inez.bottlebru.sh\"$/ }
  its('content') { should match /^automate_token = \"kmDKZ5kot2MR99QxPR4oDi5-9TI=\"$/ }
  its('content') { should match /^automate_window = \"120\"$/ }
end

# add crontab entry for cron[knife ec backup]
describe crontab do
  its('commands') { should include '/tmp/kitchen/cache/servicenow-ritm.rb' }
end

describe crontab.commands('/tmp/kitchen/cache/servicenow-ritm.rb') do
  its('minutes') { should cmp '*/10' }
  its('hours') { should cmp '*' }
  its('days') { should cmp '*' }
  its('months') { should cmp '*' }
  its('weekdays') { should cmp '*' }
end
