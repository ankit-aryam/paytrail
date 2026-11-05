CREATE TABLE accounts(
    id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    owner_name      VARCHAR(255) NOT NULL,
    currency        CHAR(3)      NOT NULL,
    balance_minor   BIGINT       NOT NULL,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT now()
);