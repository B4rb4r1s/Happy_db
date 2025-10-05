#!/bin/bash
psql -U happy_user -d happy_db <<-EOSQL
    BEGIN;
        CREATE TABLE DOCUMENTS(
            ID SERIAL PRIMARY KEY,
            filename VARCHAR,
            content TEXT,
            TEXT_tesseract TEXT,
            TEXT_dedoc TEXT
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

        CREATE TABLE elibrary_dataset (
            ID SERIAL PRIMARY KEY,
            filename VARCHAR,
            source_text TEXT,
            tag VARCHAR,
            target_summary TEXT,
            summary_lingvo TEXT,
            summary_mt5 TEXT,
            summary_mbart TEXT,
            summary_rut5 TEXT,
            summary_t5 TEXT
        );
        CREATE TABLE elibrary_dataset_tables(
            ID SERIAL PRIMARY KEY,
            doc_id INTEGER REFERENCES DOCUMENTS,
            header TEXT[], 
            rows TEXT[]
        );
        CREATE TABLE similarity_metrics (
            ID SERIAL PRIMARY KEY,
            doc_id INTEGER NOT NULL,
            text_source TEXT,
            text_target TEXT,
            metric_rubert_tiny2 DOUBLE PRECISION,
            metric_labse_ru_sts DOUBLE PRECISION,
            metric_multilingual DOUBLE PRECISION,
            metric_rubert_base DOUBLE PRECISION
        );

    COMMIT;
EOSQL