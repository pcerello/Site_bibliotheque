import React from "react";

class MyHomePage extends React.Component {
  render() {
    // Récupérer la prop "type"
    const { type } = this.props;

    // Définir un tableau de livres
    const books = [
      {
        id: 1,
        title: "Le seigneur des anneaux",
        author: "J.R.R. Tolkien",
        read: true,
      },
      {
        id: 2,
        title: "Harry Potter et la pierre philosophale",
        author: "J.K. Rowling",
        read: false,
      },
      {
        id: 3,
        title: "Le petit prince",
        author: "Antoine de Saint-Exupéry",
        read: true,
      },
      { id: 4, title: "1984", author: "George Orwell", read: false },
      {
        id: 5,
        title: "Le conte de deux cités",
        author: "Charles Dickens",
        read: true,
      },
    ];

    // Filtrer les livres en fonction de la valeur de "type"
    const filteredBooks =
      type === "read"
        ? books.filter((book) => book.read)
        : books.filter((book) => !book.read);

    // Afficher la liste de livres filtrée
    return (
      <div>
        <h2>{type === "read" ? "Livres lus" : "Nouveaux livres"}</h2>
        <ul>
          {filteredBooks.map((book) => (
            <li key={book.id}>
              {book.title} - {book.author}
            </li>
          ))}
        </ul>
      </div>
    );
  }
}

export default MyHomePage;

/*
import React from "react";

class MyHomePage extends React.Component {
  state = {
    books: [],
  };

  componentDidMount() {
    fetch("http://localhost:8000/books")
      .then((response) => response.json())
      .then((data) => this.setState({ books: data }));
  }

  render() {
    // Récupérer la prop "type"
    const { type } = this.props;

    // Filtrer les livres en fonction de la valeur de "type"
    let filteredBooks;
    if (type === "read") {
      filteredBooks = this.state.books
        .filter((book) => book.read)
        .slice(-4)
        .reverse();
    } else if (type === "new") {
      filteredBooks = this.state.books.filter((book) => !book.read);
    } else if (type === "bought") {
      filteredBooks = this.state.books
        .filter((book) => book.bought)
        .slice(-4)
        .reverse();
    } else {
      filteredBooks = this.state.books;
    }

    // Afficher la liste de livres filtrée
    return (
      <div>
        <h2>
          {type === "read"
            ? "Vos derniers livres empruntés"
            : type === "new"
            ? "Nouveaux livres"
            : "Les dernières acquisitions de la Bibliothèque"}
        </h2>
        <ul>
          {filteredBooks.map((book) => (
            <li key={book.id}>
                <a href= {book.link} target="_blank" rel="noopener noreferrer"> 
              {book.picture && ( // Si book.picture existe
                <img src="http://localhost:8000/images/{book.picture}" alt="" />
                )}

              {book.title} - {book.author} - {book.date}
                </a>
            </li>
          ))}
        </ul>
      </div>
    );
  }
}

export default MyHomePage;
*/
