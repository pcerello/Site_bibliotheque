import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

class SearchEngine extends React.Component {
  /*constructor(props) {
        super(props);
        // Initialisation du state
        this.state = {
          data: [],
        };
        // binding des méthodes pour qu'elles aient accès au this de la classe
        this.handleSubmit = this.props.cherche.bind(this);
      }*/

  render() {
    return (
      <form className="bg-sky-800 pt-16 pb-16">
        <input type="text" className="p-1 text-color-hover" placeholder="Rechercher un auteur" />
        <button type="submit" onClick={this.handleSubmit} className="p-1 px-6 bg-color hover:bg-color-hover text-white">
          <FontAwesomeIcon icon="fa-solid fa-magnifying-glass" />
        </button>
      </form>
    );
  }
}
export default SearchEngine;