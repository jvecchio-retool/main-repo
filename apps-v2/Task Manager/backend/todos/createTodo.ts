type Params = {
  title: string
}

type Todo = {
  id: number
  title: string
  completed: boolean
  created_at: string
}

export default async function (req: { params: Params }) {
  const title = req.params.title.trim()
  if (!title) {
    throw new Error('Title is required')
  }
  const result = await retoolDb.query<Todo>(
    'INSERT INTO todos (title) VALUES ($1) RETURNING id, title, completed, created_at',
    [title]
  )
  return result.data[0]
}
