class ChangeColumnNameInPosts < ActiveRecord::Migration[7.1]
  def up
    # Convert the column using a specific casting expression
    execute <<-SQL
      ALTER TABLE posts
      ALTER COLUMN status TYPE integer USING status::integer;
    SQL
  end

  def down
    # Revert the column back to its original type
    execute <<-SQL
      ALTER TABLE posts
      ALTER COLUMN status TYPE varchar USING status::varchar;
    SQL
  end
end
