class AtomRoute < Midori::API
  get '' do
    user = UserService.auth!(request)
    page = (request.query_params['page'][0] || '1').to_i
    filter = user.editable? ? Atom : Atom.where(user: user)
    data = filter.order('created_time').reverse.limit(10).offset((page - 1) * 10).map do |row|
      {
        post_id: row.post_id,
        atom_id: row.id,
        title: row.title,
        abstract: row.abstract,
        image: row.image,
        language: row.language,
        author: row.user.username,
        created_time: row.created_time,
        updated_time: row.updated_time,
      }
    end
    {
      current_page: page,
      total_page: (filter.count / 10.0).ceil,
      data: data,
    }.to_json
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
      created_time: row.created_time,
      updated_time: row.updated_time,
    }.to_json
  end

  post '' do
    user = UserService.auth!(request)
    req = JSON.parse(request.body)
    row = Atom.create(
      title:  req['title'],
      abstract: req['abstract'],
      language: req['language'],
      image: req['image'],
      content: req['content'],
      user: user,
    )
    {
      atom_id: row.id,
    }.to_json
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
    {}.to_json
  end

  delete '/:atom_id' do
    user = UserService.auth!(request)
    row = Atom.where(id: request.params['atom_id'])&.first
    raise NotFoundError if row.nil?
    raise UnauthorizedError unless user.editable? || row.user == user
    row.delete
    {}.to_json
  end
end
