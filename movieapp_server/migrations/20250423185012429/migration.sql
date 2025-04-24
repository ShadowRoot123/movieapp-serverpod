BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "movies" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "year" bigint NOT NULL,
    "imageUrl" text NOT NULL,
    "logline" text NOT NULL
);


--
-- MIGRATION VERSION FOR movieapp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('movieapp', '20250423185012429', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250423185012429', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
