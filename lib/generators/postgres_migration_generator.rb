require 'rails/generators/active_record/migration/migration_generator'

class PostgresMigrationGenerator < ActiveRecord::Generators::MigrationGenerator
  migration_file = File.dirname(
    ActiveRecord::Generators::MigrationGenerator
      .instance_method(:create_migration_file)
      .source_location.first
  )

  source_root File.join(migration_file, "templates")

  def create_migration_file
    set_local_assigns!
    validate_file_name!
    migration_template @migration_template, "postgres_db/migrate/#{file_name}.rb"
  end
end