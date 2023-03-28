import React, { useEffect, useState } from "react";
import Book from "./Book";

function MyHomePage({ readerId }) {
  const [books, setBooks] = useState([]);
  const [booksBought, setBooksBought] = useState([]);
  const [booksAll, setBooksAll] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [booksPerPage] = useState(8);

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books?max=4`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooks(data);
      });
  }, [readerId]);

  useEffect(() => {
    fetch(`http://localhost:8000/api/books`, {
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooksAll(data);
      });
  }, []);

  useEffect(() => {
    fetch(`http://127.0.0.1:8000/api/books?max=4&date=DESC`, { 
      mode: "cors",
    })
      .then((response) => response.json())
      .then((data) => {
        setBooksBought(data);
      });
  }, []);

  const indexOfLastBook = currentPage * booksPerPage;
  const indexOfFirstBook = indexOfLastBook - booksPerPage;
  const currentBooks = booksAll.slice(indexOfFirstBook, indexOfLastBook);

  const totalPages = Math.ceil(booksAll.length / booksPerPage);
  const prevPages = currentPage > 2 ? [currentPage - 2, currentPage - 1] : [1];
  const nextPages =
    currentPage < totalPages - 1
      ? [currentPage + 1, currentPage + 2]
      : [totalPages];

  return (
    <div className="bg-white min-h-[52vh] flex flex-col items-center">
      <div className="w-[80%]">
        <h2 className="text-2xl pt-32 pb-8 flex flex-start ">Vos derniers livres empruntés</h2>
        <ul className="flex flex-row flex-wrap space-x-4 justify-around">
          {books.map((book) => (
            <Book book={book} />
          ))}
        </ul>
        <h2 className="text-2xl pt-32 pb-8 flex flex-start ">Les dernières acquisitions de la Bibliothèque</h2>
        <ul className="flex flex-row flex-wrap space-x-4 justify-center">
          {booksBought.map((book) => (
            <Book book={book} />
          ))}
        </ul>
        <h2 className="text-2xl pt-32 pb-8 flex flex-start ">Tous les livres de la Bibliothèque</h2>
        <ul className="flex flex-row flex-wrap space-x-4 space-y-16 w-[80%]">
          {currentBooks.map((book) => (
            <Book book={book} />
          ))}
        </ul>
        <div className="flex flex-row justify-center">
          <button
            disabled={currentPage === 1}
            onClick={() => setCurrentPage(currentPage - 1)}
          >
            Page précédente
          </button>
          {currentPage > 1 &&
            prevPages.map((page) => (
              <button
                key={page}
                onClick={() => setCurrentPage(page)}
                className={`${currentPage === page ? "bg-blue-500" : ""}`}
              >
                {page}
              </button>
            ))}
          <button
            key={currentPage}
            disabled={true}
            className="cursor-default"
          >
            {currentPage}
          </button>
          {nextPages.map((page) => (
            <button
              key={page}
              onClick={() => setCurrentPage(page)}
              className={`${currentPage === page ? "bg-blue-500" : ""}`}
            >
              {page}
            </button>
          ))}
          <button
            disabled={currentPage === totalPages}
            onClick={() => setCurrentPage(currentPage + 1)}
          >
            Page suivante
          </button>
        </div>
      </div>
    </div>
  );
}

export default MyHomePage;
