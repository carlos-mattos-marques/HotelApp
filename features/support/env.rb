require 'cucumber/rails'

World(FactoryBot::Syntax::Methods)

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :transaction

Cucumber::Rails::Database.javascript_strategy = :truncation

