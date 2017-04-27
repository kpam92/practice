import React from 'react';

class PokemonIndex extends React.Component {
  constructor(){
    super()
  };

  componentDidMount(){

    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;
    return(
      <ul>
        {pokemon.map((poke,idx) => <li key={idx}>{poke.name}</li>)}
      </ul>
    )
  };
};

export default PokemonIndex;
