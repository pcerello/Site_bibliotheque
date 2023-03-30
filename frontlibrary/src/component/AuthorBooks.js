import React from "react";
import axios from "axios";

class AuthorBooks extends React.Component {
  /**
   * Constructor
   * 
   * @param {*} props
   */
  constructor(props) {
    super(props);
    this.state = {
      books: []
    };
    this.bookAuthor();
  }

  /**
   * Cherche les livres de l'auteur
   */
  bookAuthor() {
    let request = "http://localhost:8000/api/books?idAuthor=" + this.props.author;
    axios 
      .get(request)
      .then((response) => {
        if (response.status === 200) {
          this.setState({ books: response.data });
          console.log("data", response.data);
        }
      })
      .catch((error) => {
        console.log(error);
      });
  }

  /**
   * Affiche les livres de l'auteur
   *  
   * @returns html
   * 
   */
  render() {
    
    return (
      <div>
        <h2>Livres de l'auteur</h2>
        <ul>
          {this.state.books.map((book) => (
            <li key={book[0].id}>{book[0].title}</li>
          ))}
        </ul>
        <p>
          erzrzerz
        </p>
      </div>
    );
  }
}

export default AuthorBooks;
