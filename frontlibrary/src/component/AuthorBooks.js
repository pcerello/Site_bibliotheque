import React from "react";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

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
    <div className="bg-white mt-40 flex flex-col items-center">
      <div className="w-[90%] md:w-[80%]">
        {
          books.length === 0 ? (<div>
            <h2>Aucun livre disponible pour cet auteur</h2>
          </div>) : (<div>
        <h2 className="text-2xl py-8 text-gray-400">Tous les livres de <b className="font-bold text-color"> {author} </b> disponible à la bibliothèque</h2>
        {pagination()}
        <ul className="flex flex-col md:flex-row items-center md:flex-wrap">
          {currentBooks.map((book) => (
            <li key={book[0].id} className="m-4 flex flex-col w-[60%]  md:max-w-[15%] ease-out duration-150 hover:scale-105 items-center p-2 bg-white drop-shadow-lg">

              {book[0].picture ? (
                <Link to={`/books/${book[0].id}`} className="flex flex-col items-center">
                  <img src={`${book[0].picture}`} alt={book[0].title} title={book[0].title}/>
                  <p>
                    {book[0].title}
                  </p>
                </Link>
                
            ) : (
              <Link to={`/books/${book[0].id}`} className="flex flex-col w-fit items-center">
              <img src={defaultImage} alt="default" style={{ width: "128px" }} title={book[0].title}/>
              <p>
                {book[0].title}
              </p>
              </Link>
            )}
            </li>
          ))}
        </ul>
        {pagination()}
        </div>)
        }
      </div>
    </div>
  );
}

export default AuthorBooks;
