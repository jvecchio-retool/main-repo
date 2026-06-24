type Todo = {
  id: number
  title: string
  completed: boolean
  created_at: string
}

export default async function () {
  const result = await retoolDb.query<Todo>(
    'SELECT id, title, completed, created_at FROM todos ORDER BY created_at DESC'
  )
  return result.data
}
