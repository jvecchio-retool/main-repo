type Params = {
  id: number
  completed: boolean
}

type Todo = {
  id: number
  title: string
  completed: boolean
  created_at: string
}

export default async function (req: { params: Params }) {
  const result = await retoolDb.query<Todo>(
    'UPDATE todos SET completed = $1 WHERE id = $2 RETURNING id, title, completed, created_at',
    [req.params.completed, req.params.id]
  )
  return result.data[0]
}
