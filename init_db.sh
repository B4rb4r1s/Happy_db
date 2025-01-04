#!/bin/bash
psql -U happy_user -d happy_db <<-EOSQL
    BEGIN;
        CREATE TABLE DOCUMENTS(
            ID SERIAL PRIMARY KEY,
            filename VARCHAR,
            content TEXT,
            summary TEXT,
            upload_time TIMESTAMP
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

        CREATE TABLE DOC_DATASET(
            ID SERIAL PRIMARY KEY,
            full_text_tesseract VARCHAR,
            full_text_dedok VARCHAR,
            file_name VARCHAR,
            event VARCHAR,
            format VARCHAR
        );

    COMMIT;
EOSQL