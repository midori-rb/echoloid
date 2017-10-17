class PostRoute < Midori::API
  get '' do
    user = UserService.auth(request)
    page = (request.params['page'][0] || '1').to_i
    lang = request.params['lang'][0] || 'en'
    filter = user&.admin? ? Post : Post.where(status: 1).where { published_time <= DateTime.now }
    candidates = filter.order(:published_time).reverse.limit(10).offset((page - 1) * 10)
    data = Atom.where(post: candidates).join(:posts).where {
      (atoms[:language] =~ lang) | (atoms[:language] =~ posts[:fallback_language])
    }.order { posts[:published_time] }.reverse.map do |row|
      {
        post_id: row.post_id,
        atom_id: row.id,
        title: row.title,
        abstract: row.abstract,
        image: row.image,
        language: row.language,
        author: row.user.username,
      }
    end
    result = {}
    data.each { |row| result[row.id] = row if result[row.id].nil? || data[:language] == lang }
    {
      current_page: page,
      total_page: (filter.count / 10.0).ceil,
      data: result.values,
    }
  end

  get '/:post_id' do
    rows = Atom.where(post_id: request.params['post_id']).all
    raise NotFoundError if rows.nil? || rows == []
    rows.map do |row|
      {
        post_id: row.post_id,
        atom_id: row.id,
        title: row.title,
        abstract: row.abstract,
        image: row.image,
        language: row.language,
        author: row.user.username,
      }
    end.to_json
  end

  get '/:post_id/:lang' do
    row = Atom.where(id: request.params['atom_id'], language: request.params['lang'])&.first
    raise NotFoundError if row.nil?
    {
      post_id: row.post_id,
      atom_id: row.id,
      title: row.title,
      abstract: row.abstract,
      image: row.image,
      language: row.language,
      author: row.user.username,
      content: row.content,
    }.to_json
  end

  post '' do
    user = UserService.auth!(request)
    raise UnauthorizedError unless user.editable?
    req = JSON.parse(request.body)
    post = Post.create(
      fallback_language: req[:fallback_language],
      published_time: DateTime.parse(req[:published_time]),
      status: req[:status],
    )
    Atom.where(id: req[:atoms], post_id: nil).map do |atom|
      post.add_atom(atom)
    end
    {}.to_json
  end

  put '/:post_id' do
    user = UserService.auth!(request)
    raise UnauthorizedError unless user.editable?
    req = JSON.parse(request.body)
    post = Post.where(post_id: request.params[:post_id])&.first
    raise NotFoundError if post.nil?
    post.update(
      fallback_language: req[:fallback_language],
      published_time: DateTime.parse(req[:published_time]),
      status: req[:status],
    )
    post.remove_all_atoms
    Atom.where(id: req[:atoms], post_id: nil)&.map do |atom|
      post.add_atom(atom)
    end
    {}.to_json
  end

  delete '/:post_id' do
    user = UserService.auth!(request)
    raise UnauthorizedError unless user.editable?
    Post.where(id: request.params[:post_id])&.delete
    {}.to_json
  end
end
