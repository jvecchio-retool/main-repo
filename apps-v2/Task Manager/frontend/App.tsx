import { Routes, Route } from 'react-router-dom'
import TodoList from './pages/TodoList'

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<TodoList />} />
      <Route path="*" element={<TodoList />} />
    </Routes>
  )
}
