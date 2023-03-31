import React, { useEffect, useState } from "react";
import Book from "./Book";

/**
 * This function represents the page that displays the home page of the application.
 * It displays the reader's books by calling the Book component if the reader has connected.
 * It displays the books bought by the library by calling the Book component if the reader has connected.
 * It displays the books recommended by the library by calling the Book component if the reader has connected.
 * It displays all books by calling the Book component.
 * @param {*} param0 the reader id
 * @returns JS Element
 */
function MyHomePage({ readerId }) {
  const [books, setBooks] = useState(null); // books of the reader
  const [booksBought, setBooksBought] = useState([]); // books bought by the library
  const [booksSuggest, setBooksSuggest] = useState([]); // books recommended for the reader
  const [booksAll, setBooksAll] = useState([]); // all books
  const [currentPage, setCurrentPage] = useState(1); // current page
  const [booksPerPage] = useState(8); // number of books per page

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books?max=4`, {
      mode: "cors",
    })
      .then((response) => {
        if (!response.ok) {
          throw Error("404 Not Found");
        }
        return response.json(); // Transform the data into json
      })
      .then((data) => {
        setBooks(data); // Set the books to the data returned by the API
      })
      .catch((error) => {
        console.error("Erreur fetching book:", error);
        setBooks(null); // Set the books to null if there is an error
      });
  }, [readerId]);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books`, {
      mode: "cors",
    })
      .then((response) => response.json()) // Transform the data into json
      .then((data) => {
        setBooksAll(data); // Set the books to the data returned by the API
      });
  }, []);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books?max=4&date=DESC`, {
      mode: "cors",
    })
      .then((response) => response.json()) // Transform the data into json
      .then((data) => {
        setBooksBought(data); // Set the books to the data returned by the API
      });
  }, []);

  useEffect(() => {
    fetch(
      `http://localhost:8000/api/readers/${readerId}/books/recommendations?max=8`,
      {
        mode: "cors",
      }
    )
      .then((response) => {
        if (!response.ok) {
          throw Error("404 Not Found");
        }
        return response.json(); // Transform the data into json
      })
      .then((data) => {
        setBooksSuggest(data); // Set the books to the data returned by the API
      })
      .catch((error) => {
        console.error("Erreur fetching book:", error);
        setBooksSuggest(null); // Set the books to null if there is an error
      });
  }, [readerId]);

  const indexOfLastBook = currentPage * booksPerPage; // index of the last book
  const indexOfFirstBook = indexOfLastBook - booksPerPage; // index of the first book
  const currentBooks = booksAll.slice(indexOfFirstBook, indexOfLastBook); // books of the current page
  const totalPages = Math.ceil(booksAll.length / booksPerPage); // total number of pages
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
    <div className="bg-white min-h-[52vh] flex flex-col items-center text-left">
      <div className="w-[90%] md:w-[80%]">
        {readerId ? ( // if the reader is connected
          <>
            <h2 className="text-2xl pt-24 pb-8 flex flex-start ">
              Vos derniers livres empruntés
            </h2>
            <ul className="flex flex-col md:flex-row flex-wrap ">
              {books ? ( // if the reader has books
                books.map((book) => (
                  <Book
                    book={book}
                    aria-label={`Titre : ${book.title}. Auteur : ${book.author}.`}
                  />
                ))
              ) : (
                // if the reader has no books
                <div>Vous n'avez pas encore emprunté de livre</div>
              )}
            </ul>

            <h2 className="text-2xl pt-24 pb-8 flex flex-start ">
              Vous pourriez aimer aussi
            </h2>
            <ul className="flex flex-col md:flex-row flex-wrap ">
              {booksSuggest ? ( // if the reader has books suggested
                booksSuggest.map((book) => <Book book={book} />)
              ) : (
                // if the reader has no books suggested
                <div>Vous n'avez aucun livres suggérés</div>
              )}
            </ul>

            <h2 className="text-2xl pt-24 pb-8 flex flex-start ">
              Les dernières acquisitions de la Bibliothèque
            </h2>
            <ul className="flex flex-col md:flex-row flex-wrap ">
              {booksBought.map(
                (
                  book // Books bought by the library
                ) => (
                  <Book book={book} />
                )
              )}
            </ul>
          </>
        ) : (
          // if the reader is not connected
          <></>
        )}
        <h2 className="text-2xl pt-24 pb-8 flex flex-start ">
          Tous les livres de la Bibliothèque
        </h2>
        {pagination()}
        <ul className="flex flex-col md:flex-row flex-wrap">
          {currentBooks.map(
            (
              book // all the books
            ) => (
              <Book book={book} />
            )
          )}
        </ul>
        {pagination()}
      </div>
    </div>
  );
}

export default MyHomePage;
