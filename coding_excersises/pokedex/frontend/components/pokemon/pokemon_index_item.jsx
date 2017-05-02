import React from 'react';
import { Link } from 'react-router';

const PokemonIndexItem = ({pokemon, router}) => (
  <li className="pokemon-index-item">

      <span>{pokemon.id}</span>
      <Link to={`/pokemon/${pokemon.id}`}>
        <img src={pokemon.image_url} alt={pokemon.name} />
        <span>{pokemon.name}</span>
      </Link>
  </li>
);

export default PokemonIndexItem;
