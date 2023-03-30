import React, { useEffect, useState } from "react";
import Book from "./Book";

function MyHomePage({ readerId }) {
  const [books, setBooks] = useState(null);
  const [booksBought, setBooksBought] = useState([]);
  const [booksSuggest, setBooksSuggest] = useState([]);
  const [booksAll, setBooksAll] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [booksPerPage] = useState(8);

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books?max=4`, {
      mode: "cors",
    })
      .then((response) => {
      if(!response.ok){
        throw Error("404 Not Found");
      }
      return response.json();

  })
      .then((data) => {
      
        setBooks(data);
        console.log("data", books);
      })
      .catch((error) => {
        console.error("Erreur fetching book:", error);
        setBooks(null);
      })
      ;

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

  useEffect(() => {
    fetch(`http://localhost:8000/api/readers/${readerId}/books/recommendations`, {
      mode: "cors",
    })
      .then((response) => {
      if(!response.ok){
        throw Error("404 Not Found");
      }
      return response.json();

  })
      .then((data) => {
      
        setBooksSuggest(data);
        console.log("data", books);
      })
      .catch((error) => {
        console.error("Erreur fetching book:", error);
        setBooksSuggest(null);
      })
      ;

  }, [readerId]);




  const indexOfLastBook = currentPage * booksPerPage;
  const indexOfFirstBook = indexOfLastBook - booksPerPage;
  const currentBooks = booksAll.slice(indexOfFirstBook, indexOfLastBook);

  const totalPages = Math.ceil(booksAll.length / booksPerPage);
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
    <div className="bg-white min-h-[52vh] flex flex-col items-center text-left">
      <div className="w-[90%] md:w-[80%]">
        {
          readerId ?(
            <>
              <h2 className="text-2xl pt-24 pb-8 flex flex-start " >Vos derniers livres empruntés</h2>
              <ul className="flex flex-col md:flex-row flex-wrap ">
                {books ? (books.map((book) => (
                  <Book book={book} aria-label={`Titre : ${book.title}. Auteur : ${book.author}.`} />
                ))) : (<div>Vous n'avez pas encore emprunté de livre</div>)}
              </ul>
              
              <h2 className="text-2xl pt-24 pb-8 flex flex-start ">Vous pourriez aimer aussi</h2>
              <ul className="flex flex-col md:flex-row flex-wrap ">
                {booksSuggest ? (booksSuggest.map((book) => (
                  <Book book={book} />
                ))): (<div>Vous n'avez aucun livres suggérés</div>)}
              </ul>
              
              <h2 className="text-2xl pt-24 pb-8 flex flex-start ">Les dernières acquisitions de la Bibliothèque</h2>
              <ul className="flex flex-col md:flex-row flex-wrap ">
                {booksBought.map((book) => (
                  <Book book={book} />
                ))}
              </ul>
            </>
          ) : (<></>)
        }
        <h2 className="text-2xl pt-24 pb-8 flex flex-start ">Tous les livres de la Bibliothèque</h2>
        {pagination()}
        <ul className="flex flex-col md:flex-row flex-wrap ">
          {currentBooks.map((book) => (
            <Book book={book} />
          ))}
        </ul>
        {pagination()}
      </div>
    </div>
  );
}

export default MyHomePage;
