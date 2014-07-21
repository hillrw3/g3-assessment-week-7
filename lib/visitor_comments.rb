class CommentsTable
  def initialize(database_connection)
    @database_connection = database_connection
  end

  def create(name, message)
    insert_message_sql = <<-SQL
      INSERT INTO comments (name, message)
      VALUES ('#{name}', '#{message}')
      RETURNING id
    SQL

    @database_connection.sql(insert_message_sql).first["id"]
  end

  def select_all
    select_sql = "select * from comments"
    @database_connection.sql(select_sql)
  end

end
