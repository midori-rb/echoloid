Sequel.migration do
  transaction
  change do
    create_table(:users) do
      primary_key :id
      String :username, size: 255, null: false, unique: true
      String :password, text: true, null: false
      Integer :usergroup, null: false, default: -1 # -1: Banned, 0: Admin, 1: Editor, 2: User
      DateTime :created_time, null: false
    end

    create_table(:posts) do
      primary_key :id
      Integer :status, default: 0 # 0: Draft, 1: Publish
      String :fallback_language, text: true, null: false
      DateTime :published_time, null: false
    end

    create_table(:atoms) do
      primary_key :id
      DateTime :created_time, null: true
      DateTime :updated_time, null: true
      String :language, text: true, null: false
      String :title, text: true, null: false
      String :abstract, text: true, null: false
      String :image, text: true, null: true
      String :content, text: true, null: false
      foreign_key :post_id, :posts, null: true, key: [:id]
      foreign_key :user_id, :users, null: false, key: [:id]
    end

    create_table(:post_sets) do
      primary_key :id
      String :name, text: true, null: false
    end

    create_table(:post_sets_posts) do
      foreign_key :post_id, :posts, null: false, key: [:id]
      foreign_key :post_set_id, :post_sets, null: false, key: [:id]
    end
  end
end
