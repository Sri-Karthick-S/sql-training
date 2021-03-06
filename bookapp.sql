
create table BOOKS (BOOK_ID NUMBER ,
BOOK_NAME VARCHAR2(100) NOT NULL,
CONSTRAINT BOOK_ID_PK PRIMARY KEY ( BOOK_ID),
CONSTRAINT BOOK_NAME_UQ UNIQUE( BOOK_NAME)
);

INSERT INTO BOOKS ( BOOK_ID, BOOK_NAME) 
VALUES (101,'C');
INSERT INTO BOOKS ( BOOK_ID, BOOK_NAME) 
VALUES (102,'Java');

SELECT * FROM BOOKS;



create table BOOK_STOCK (STOCK_ID NUMBER, 
BOOK_ID NUMBER ,
QUANTITY VARCHAR2(100) NOT NULL,
CONSTRAINT STOCK_ID_PK PRIMARY KEY ( STOCK_ID),
CONSTRAINT ST_BOOK_ID_PK FOREIGN KEY ( BOOK_ID) REFERENCES BOOKS(BOOK_ID),
CONSTRAINT QUANTITY_CK CHECK( QUANTITY >= 0 )
);

INSERT INTO BOOK_STOCK ( STOCK_ID,BOOK_ID, QUANTITY) 
VALUES (1,101, 100);


INSERT INTO BOOK_STOCK ( STOCK_ID,BOOK_ID, QUANTITY) 
VALUES (2,102, 50);

SELECT * FROM BOOK_STOCK;


CREATE TABLE ORDERS (ORDER_ID NUMBER,
USERNAME VARCHAR2(100) NOT NULL,
BOOK_ID NUMBER NOT NULL,
QUANTITY NUMBER NOT NULL,
STATUS VARCHAR2(20) DEFAULT 'ORDERED',
CONSTRAINT ORDER_BOOK_ID_FK FOREIGN KEY ( BOOK_ID )
REFERENCES BOOKS(BOOK_ID),
CONSTRAINT ORDER_QUANTITY_CK CHECK (QUANTITY > 1),
CONSTRAINT ORDER_STATUS_CK CHECK ( STATUS IN ('ORDERED','DELIVERED','CANCELLED'))
);
                                  

CREATE SEQUENCE ORDER_ID_SEQ START WITH 1 INCREMENT BY 1;
