class AtomRoute < Midori::API
  get '' do
    user = UserService.auth!(request)
    page = (request.params['page'][0] || '1').to_i
    filter = user.editable? ? Atom : Atom.where(user: user)
    filter.order { posts[:published_time] }.reverse.map do |row|
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
  end

  get '/:atom_id' do
    user = UserService.auth!(request)
    row = Atom.where(id: request.params['atom_id']).first
    raise UnauthorizedError unless user.editable? || row.user == user
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
    req = JSON.parse(request.body)
    Atom.create(
      title:  req['title'],
      abstract: req['abstract'],
      language: req['language'],
      image: req['image'],
      content: req['content'],
      user: user,
    )
    ''
  end

  put '/:atom_id' do
    user = UserService.auth!(request)
    row = Atom.where(id: request.params['atom_id']).first
    req = JSON.parse(request.body)
    raise NotFoundError if row.nil?
    raise UnauthorizedError unless user.editable? || row.user == user
    row.update(
      title: req['title'],
      abstract: req['abstract'],
      language: req['language'],
      image: req['image'],
      content: req['content'],
    )
    ''
  end

  delete '/:atom_id' do
    user = UserService.auth!(request)
    row = Atom.where(id: request.params['atom_id'])&.first
    raise NotFoundError if row.nil?
    raise UnauthorizedError unless user.editable? || row.user == user
    row.delete
    ''
  end
end
