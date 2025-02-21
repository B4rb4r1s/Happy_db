#!/bin/bash
psql -U happy_user -d happy_db <<-EOSQL
    BEGIN;
        CREATE TABLE DOCUMENTS(
            ID SERIAL PRIMARY KEY,
            filename VARCHAR,
            content TEXT,
            text_tesseract TEXT,
            text_dedoc TEXT
            big_summary TEXT,
            summary TEXT,
            upload_time TIMESTAMP,
            doc_format TEXT,
        );
        CREATE TABLE NAMED_ENTITIES(
            ID SERIAL PRIMARY KEY,
            doc_id INTEGER,
            entity VARCHAR,
            value VARCHAR
        );
        CREATE TABLE METADATA(
            ID SERIAL PRIMARY KEY,
            doc_id INTEGER,
            format VARCHAR,
            author VARCHAR,
            creator VARCHAR,
            title VARCHAR,
            subject VARCHAR,
            keywords VARCHAR,
            creation_date TIMESTAMP,
            producer VARCHAR
        );
        CREATE TABLE TABLES(
            ID SERIAL PRIMARY KEY,
            doc_id INTEGER REFERENCES DOCUMENTS,
            header TEXT[], 
            rows TEXT[]
        );


        CREATE TABLE DOC_DATASET(
            ID SERIAL PRIMARY KEY,
            file_name VARCHAR,
            full_text_tesseract VARCHAR,
            full_text_dedok VARCHAR,
            event VARCHAR,
            format VARCHAR,
            big_summary TEXT,
            summary TEXT,
        );      
        CREATE TABLE NAMED_ENTITIES_DATASET(
            ID SERIAL PRIMARY KEY,
            doc_id INTEGER,
            entity VARCHAR,
            value VARCHAR
        );
        CREATE TABLE METADATA_DATASET(
            ID SERIAL PRIMARY KEY,
            doc_id INTEGER,
            format VARCHAR,
            author VARCHAR,
            creator VARCHAR,
            title VARCHAR,
            subject VARCHAR,
            keywords VARCHAR,
            creation_date TIMESTAMP,
            producer VARCHAR
        );

    COMMIT;
EOSQL