import React from "react";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import defaultImage from "./livre.png";
import { Link } from "react-router-dom";

/**
 * This function represents the component that displays the books of an author.
 * @returns  JS Element
 */
function AuthorBooks() {
  const { id } = useParams(); // get the id of the author
  const [books, setBooks] = useState([]); // books of the author
  const [author, setAuthors] = useState([]); // author name
  const [currentPage, setCurrentPage] = useState(1); // current page
  const [booksPerPage] = useState(8); // number of books per page

  useEffect(() => {
    fetch(`http://localhost:8000/api/books?idAuthor=${id}`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooks(data); // Set the books to the data returned by the API
        setAuthors(data[0].nameAuthor); // Set the author name
      });
  }, [id]);

  const indexOfLastBook = currentPage * booksPerPage; // index of the last book of the page
  const indexOfFirstBook = indexOfLastBook - booksPerPage; // index of the first book of the page
  const currentBooks = books.slice(indexOfFirstBook, indexOfLastBook); // books of the current page
  const totalPages = Math.ceil(books.length / booksPerPage); // total number of pages
  const prevPages = currentPage > 2 ? [currentPage - 2, currentPage - 1] : [1]; // previous pages
  const nextPages = // next pages
    currentPage < totalPages - 1
      ? [currentPage + 1, currentPage + 2]
      : [totalPages];

  /**
   * This function represents the pagination of the page.
   * It displays the pagination buttons.
   * @returns JS Element
   * @param {number} currentPage - The current page
   * @param {number} totalPages - The total number of pages
   * @param {number} prevPages - The previous pages
   * @param {number} nextPages - The next pages
   */
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
        {books.length === 0 ? ( // If there is no book for this author
          <div>
            <h2>Aucun livre disponible pour cet auteur</h2>
          </div>
        ) : (
          // If there is books for this author
          <div>
            <h2 className="text-2xl py-8 text-gray-400">
              Tous les livres de{" "}
              <b className="font-bold text-color"> {author} </b> disponible à la
              bibliothèque
            </h2>
            {pagination()}
            <ul className="flex flex-col md:flex-row items-center md:flex-wrap">
              {currentBooks.map(
                (
                  book // Display the books
                ) => (
                  <li
                    key={book[0].id}
                    className="m-4 flex flex-col w-[60%]  md:max-w-[15%] ease-out duration-150 hover:scale-105 items-center p-2 bg-white drop-shadow-lg"
                  >
                    {book[0].picture ? ( // If the book has a picture
                      <Link
                        to={`/books/${book[0].id}`}
                        className="flex flex-col items-center"
                      >
                        <img
                          src={`${book[0].picture}`}
                          alt={book[0].title}
                          title={book[0].title}
                        />
                        <p>{book[0].title}</p>
                      </Link>
                    ) : (
                      // If the book has no picture
                      <Link
                        to={`/books/${book[0].id}`}
                        className="flex flex-col w-fit items-center"
                      >
                        <img
                          src={defaultImage}
                          alt="default"
                          style={{ width: "128px" }}
                          title={book[0].title}
                        />
                        <p>{book[0].title}</p>
                      </Link>
                    )}
                  </li>
                )
              )}
            </ul>
            {pagination()}
          </div>
        )}
      </div>
    </div>
  );
}

export default AuthorBooks;
