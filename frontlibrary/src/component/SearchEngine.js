import React from "react";

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
      <form>
        <input type="text" placeholder="Rechercher un auteur" />
        <button type="submit" onClick={this.handleSubmit}>
          Rechercher
        </button>
      </form>
    );
  }
}
export default SearchEngine;
