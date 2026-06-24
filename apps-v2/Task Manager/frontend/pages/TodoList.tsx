import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { CheckCircle2, ListTodo, Loader2, Plus, Trash2 } from 'lucide-react'
import { Button } from '../lib/shadcn/button'
import { Input } from '../lib/shadcn/input'
import { Checkbox } from '../lib/shadcn/checkbox'
import { Card, CardContent, CardHeader, CardTitle } from '../lib/shadcn/card'
import { Tabs, TabsList, TabsTrigger } from '../lib/shadcn/tabs'
import { cn } from '../lib/shadcn/utils'
import {
  useCreateTodo,
  useDeleteTodo,
  useListTodos,
  useToggleTodo,
} from '../hooks/backend/todos'

type Todo = {
  id: number
  title: string
  completed: boolean
  created_at: string
}

type Filter = 'all' | 'active' | 'completed'

export default function TodoList() {
  const list = useListTodos()
  const create = useCreateTodo()
  const toggle = useToggleTodo()
  const remove = useDeleteTodo()

  const [title, setTitle] = useState('')
  const [filter, setFilter] = useState<Filter>('all')
  const [pendingIds, setPendingIds] = useState<Set<number>>(new Set())

  useEffect(() => {
    list.trigger()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  const todos: Todo[] = (list.data as Todo[] | null) ?? []

  const filtered = useMemo(() => {
    if (filter === 'active') return todos.filter((t) => !t.completed)
    if (filter === 'completed') return todos.filter((t) => t.completed)
    return todos
  }, [todos, filter])

  const remaining = todos.filter((t) => !t.completed).length
  const total = todos.length

  const markPending = (id: number, on: boolean) => {
    setPendingIds((prev) => {
      const next = new Set(prev)
      if (on) next.add(id)
      else next.delete(id)
      return next
    })
  }

  const handleAdd = async (e: FormEvent) => {
    e.preventDefault()
    const value = title.trim()
    if (!value) return
    await create.trigger({ title: value }).result
    setTitle('')
    await list.trigger(undefined, { skipCache: true }).result
  }

  const handleToggle = async (todo: Todo) => {
    markPending(todo.id, true)
    try {
      await toggle.trigger({ id: todo.id, completed: !todo.completed }).result
      await list.trigger(undefined, { skipCache: true }).result
    } finally {
      markPending(todo.id, false)
    }
  }

  const handleDelete = async (todo: Todo) => {
    markPending(todo.id, true)
    try {
      await remove.trigger({ id: todo.id }).result
      await list.trigger(undefined, { skipCache: true }).result
    } finally {
      markPending(todo.id, false)
    }
  }

  const initialLoading = list.loading && todos.length === 0

  return (
    <div className="min-h-screen bg-background text-foreground py-10 px-4">
      <div className="max-w-2xl mx-auto">
        <header className="flex items-center gap-3 mb-6">
          <div className="p-2 rounded-md bg-primary/10 text-primary">
            <ListTodo className="w-6 h-6" />
          </div>
          <div>
            <h1 className="text-2xl font-bold tracking-tight">Todo List</h1>
            <p className="text-sm text-muted-foreground">
              {total === 0
                ? 'No tasks yet — add your first one below.'
                : `${remaining} of ${total} remaining`}
            </p>
          </div>
        </header>

        <Card>
          <CardHeader>
            <CardTitle className="text-base">Add a task</CardTitle>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleAdd} className="flex gap-2">
              <Input
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="What needs to be done?"
                disabled={create.loading}
                autoFocus
              />
              <Button type="submit" disabled={create.loading || !title.trim()}>
                {create.loading ? (
                  <Loader2 className="w-4 h-4 animate-spin" />
                ) : (
                  <Plus className="w-4 h-4" />
                )}
                Add
              </Button>
            </form>
            {create.error && (
              <p className="text-sm text-destructive mt-2">{create.error}</p>
            )}
          </CardContent>
        </Card>

        <div className="mt-6">
          <Tabs value={filter} onValueChange={(v) => setFilter(v as Filter)}>
            <TabsList>
              <TabsTrigger value="all">All ({total})</TabsTrigger>
              <TabsTrigger value="active">Active ({remaining})</TabsTrigger>
              <TabsTrigger value="completed">
                Completed ({total - remaining})
              </TabsTrigger>
            </TabsList>
          </Tabs>
        </div>

        <div className="mt-4 rounded-lg border border-border bg-card text-card-foreground divide-y divide-border">
          {initialLoading ? (
            <div className="flex items-center justify-center py-12 text-muted-foreground">
              <Loader2 className="w-5 h-5 animate-spin mr-2" />
              Loading...
            </div>
          ) : list.error ? (
            <div className="py-12 text-center text-destructive">
              {list.error}
            </div>
          ) : filtered.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-12 text-muted-foreground">
              <CheckCircle2 className="w-8 h-8 mb-2 opacity-50" />
              <p className="text-sm">
                {filter === 'completed'
                  ? 'No completed tasks yet.'
                  : filter === 'active'
                    ? 'Nothing to do — nice!'
                    : 'No tasks yet.'}
              </p>
            </div>
          ) : (
            filtered.map((todo) => {
              const pending = pendingIds.has(todo.id)
              return (
                <div
                  key={todo.id}
                  className={cn(
                    'flex items-center gap-3 px-4 py-3 transition-colors',
                    pending && 'opacity-60',
                  )}
                >
                  <Checkbox
                    checked={todo.completed}
                    onCheckedChange={() => handleToggle(todo)}
                    disabled={pending}
                    aria-label={`Mark "${todo.title}" as ${todo.completed ? 'incomplete' : 'complete'}`}
                  />
                  <span
                    className={cn(
                      'flex-1 text-sm',
                      todo.completed && 'line-through text-muted-foreground',
                    )}
                  >
                    {todo.title}
                  </span>
                  <Button
                    variant="ghost"
                    size="icon"
                    onClick={() => handleDelete(todo)}
                    disabled={pending}
                    aria-label={`Delete "${todo.title}"`}
                    className="text-muted-foreground hover:text-destructive"
                  >
                    <Trash2 className="w-4 h-4" />
                  </Button>
                </div>
              )
            })
          )}
        </div>
      </div>
    </div>
  )
}
