require 'foodcritic'
require 'rubocop/rake_task'
require 'kitchen/rake_tasks'

namespace :style do
  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |task|
    task.options = {
      fail_tags: %w(any)
    }
  end

  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)
end

task style: ['style:ruby', 'style:chef']

namespace :integration do
  task: circleci do
    loader = Kitchen::Loader::Yaml.New(local_config: '.kitchen.circleci.yml')
    Kitchen::Config.new(loader: @loader).instances.each do |instance|
      instance.test(:always)
    end
end

  Kitchen::RakeTasks.new
end

task integration: ['integration:kitchen:all']

task default: ['test']

task test: ['style', 'integration:kitchen:all']
task testcontinuous: ['style', 'integration:circleci']
