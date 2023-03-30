import React from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import defaultImage from "./livre.png";

function AuthorBooks() {
  const { id } = useParams();
  const [books, setBooks] = useState([]);
  const [author, setAuthors] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [booksPerPage] = useState(8);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books?idAuthor=${id}`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooks(data);
        console.log("data", data);
        setAuthors(data[0].nameAuthor);
      });
  }, [id]);

  const indexOfLastBook = currentPage * booksPerPage;
  const indexOfFirstBook = indexOfLastBook - booksPerPage;
  const currentBooks = books.slice(indexOfFirstBook, indexOfLastBook);

  const totalPages = Math.ceil(books.length / booksPerPage);
  const prevPages = currentPage > 2 ? [currentPage - 2, currentPage - 1] : [1];
  const nextPages =
    currentPage < totalPages - 1
      ? [currentPage + 1, currentPage + 2]
      : [totalPages];



    
      function pagination() {
        return (
          <div className="flex flex-row justify-center py-8">
            <button
              tabIndex={currentPage === 1 ? -1 : 0}
              aria-hidden={currentPage === 1 ? true : false}
              className="mx-8 bg-white drop-shadow-md p-2 disabled:text-gray-300 disabled:drop-shadow-none disabled:bg-gray-50 disabled:shadow-inner"
              disabled={currentPage === 1}
              onClick={() => setCurrentPage(currentPage - 1)}
            >
              Page précédente
            </button>
            {currentPage > 1 &&
              prevPages.map((page) => (
                <button
                  key={page}
                  tabIndex={0}
                  className="mx-2"
                  onClick={() => setCurrentPage(page)}
                >
                  {page}
                </button>
              ))}
            <button
              key={currentPage}
              tabIndex={-1}
              aria-hidden="true"
              disabled={true}
              className="cursor-default underline mx-2"
            >
              {currentPage}
            </button>
            {currentPage < totalPages &&
              nextPages.map((page) => (
                <button
                  key={page}
                  tabIndex={0}
                  className="mx-2"
                  onClick={() => setCurrentPage(page)}
                >
                  {page}
                </button>
              ))}
            <button
              tabIndex={currentPage === totalPages ? -1 : 0}
              aria-hidden={currentPage === totalPages ? true : false}
              className="mx-8 bg-white drop-shadow-md p-2 disabled:text-gray-300 disabled:drop-shadow-none disabled:bg-gray-50 disabled:shadow-inner"
              disabled={currentPage === totalPages}
              onClick={() => setCurrentPage(currentPage + 1)}
            >
              Page suivante
            </button>
          </div>
        );
      }

  return (
    <div>
      {
        books.length === 0 ? (<div>
          <h2>Aucun livre disponible pour cet auteur</h2>
        </div>) : (<div>
      <h2>Tous les livres de {author} disponible à la bibliothèque</h2>
      <ul>
        {pagination()}
        {books.map((book) => (
          <li key={book[0].id}>
            {book[0].picture ? (
            <img src={`${book[0].picture}`} alt={book[0].title} title={book[0].title} />
          ) : (
            <img src={defaultImage} alt="default" style={{ width: "128px" }} title={book[0].title}/>
          )}
          </li>
        ))}
        {pagination()}
      </ul>
      </div>)
      }
    </div>
  );
}
/*
class AuthorBooks extends React.Component {
  /**
   * Constructor
   * 
   * @param {*} props
   *
  constructor(props) {
    super(props);
    this.state = {
      books: []
    };
    this.bookAuthor();
  }

  /**
   * Cherche les livres de l'auteur
   *
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
   *
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
}*/

export default AuthorBooks;
