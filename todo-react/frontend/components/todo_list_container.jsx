import { connect} from 'react-redux';
import TodoList from './todo_list'
import allTodos from '../reducers/selectors';
import receiveTodo from '../actions/todo_actions';

const mapStateToProps = (state, ownProps) => ({
  todos: state.todos
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});


const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export default TodoListContainer;
