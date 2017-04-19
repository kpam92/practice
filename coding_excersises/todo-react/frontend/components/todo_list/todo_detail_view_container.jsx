import { connect} from 'react-redux';
import TodoDetailView from './todo_detail_view'
import { allTodos } from '../../reducers/selectors';
import {receiveTodo, removeTodo} from '../../actions/todo_actions';

const mapStateToProps = (state, ownProps) => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo))
});


const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoDetailView);

export default TodoDetailViewContainer;
