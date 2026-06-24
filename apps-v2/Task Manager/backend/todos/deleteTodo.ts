type Params = {
  id: number
}

export default async function (req: { params: Params }) {
  await retoolDb.query('DELETE FROM todos WHERE id = $1', [req.params.id])
  return { success: true }
}
