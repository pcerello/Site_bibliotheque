import "./App.css";
import SearchEngine from "./component/SearchEngine";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import Layout from "./component/Layout";
import AuthorBooks from "./component/AuthorBooks";
import { useLocation } from "react-router-dom";
import { useState, useEffect } from "react";
import defaultImage from "../src/component/livre.png";
import { Link } from "react-router-dom";

library.add(fas, far, fab);

function AuthorsPage() {
  const location = useLocation();
  const authors = location.state.authorName;
  const [books, setBooks] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [booksPerPage] = useState(8);

  console.log("authors", authors);
  useEffect(() => {
    fetch(`http://localhost:8000/api/books?author=${authors}`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooks(data);
        console.log("data", data);
      })
      .catch((error) => {
        console.error("Erreur fetching book:", error);
        setBooks(null);
      });
  }, [authors]);

  const indexOfLastBook = currentPage * booksPerPage;
  const indexOfFirstBook = indexOfLastBook - booksPerPage;
  const currentBooks = Array.isArray(books) ? (books.slice(indexOfFirstBook, indexOfLastBook)): null;


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
    <div className="App">
      <Layout>
      <SearchEngine />
        <div className="bg-white mt-40 flex flex-col items-center">
          <div className="w-[90%] md:w-[80%]">
            {books.length === 0 ? (
              <div>
                <h2 className="text-gray-400 text-lg py-16">Aucun livre disponible pour la recherche : {authors}</h2>
              </div>
            ) : (
              <div>
                <h2 className="text-gray-400 text-2xl py-16">
                  Tous les livres disponible à la bibliothèque pour la recherche :{" "}
                  <b className="font-bold text-color">{authors}</b>
                </h2>
                {pagination()}
                <ul className="flex flex-col md:flex-row items-center md:flex-wrap">
                  {currentBooks.map((book) => (
                    <li key={book[0].id} className="m-3 flex flex-col w-[60%]  md:w-[10%] ease-out duration-150 hover:scale-105 items-center p-2 bg-white drop-shadow-lg">
                      {book[0].picture ? (
                        <Link to={`/books/${book[0].id}`} className="flex flex-col items-center">
                          <img
                            src={`${book[0].picture}`}
                            alt={book[0].title}
                            title={book[0].title}
                          />
                          <p>{book[0].title}</p>
                        </Link>
                      ) : (
                        <Link to={`/books/${book[0].id}`} className="flex flex-col items-center">
                          <img
                            src={defaultImage}
                            alt="default"
                            title={book[0].title}
                            style={{ width: "128px" }}
                          />
                          <p>{book[0].title}</p>
                        </Link>
                      )}
                    </li>
                  ))}
                </ul>
                {pagination()}
              </div>
            )}
          </div>
        </div>
      </Layout>
    </div>
  );
}

export default AuthorsPage;
