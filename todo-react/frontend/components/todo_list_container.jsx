import { connect} from 'react-redux';
import TodoList from './todo_list'
const mapStateToProps = (state, ownProps) => ({

});

const mapDispatchToProps = dispatch => ({

});


const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export default TodoListContainer;
