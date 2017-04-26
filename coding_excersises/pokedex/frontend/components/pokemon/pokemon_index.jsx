import React from 'react';

class PokemonIndex extends React.Component {
  constructor(){
    super()
  };

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render() {
    const poke = this.props.pokemon.forEach(pokemon => (
      <li>{pokemon.name}</li>
    ))
    return(
      <ul>
        {poke}
      </ul>
    )
  };
};

export default PokemonIndex;
