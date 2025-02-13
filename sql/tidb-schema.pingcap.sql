CREATE DATABASE diligent;
USE diligent;

CREATE TABLE clustered
(
    pk        varchar(32)    NOT NULL,
    uniq      varchar(32)    NOT NULL,
    small_grp varchar(32)    NOT NULL,
    large_grp varchar(32)    NOT NULL,
    fixed_val varchar(32)    NOT NULL,
    seq_num   int            NOT NULL,
    ts        timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payload   varchar(10240) NOT NULL,
    PRIMARY KEY (pk) CLUSTERED
);

CREATE TABLE clusteredWindex
(
    pk        varchar(32)    NOT NULL,
    uniq      varchar(32)    NOT NULL,
    small_grp varchar(32)    NOT NULL,
    large_grp varchar(32)    NOT NULL,
    fixed_val varchar(32)    NOT NULL,
    seq_num   int            NOT NULL,
    ts        timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payload   varchar(10240) NOT NULL,
    PRIMARY KEY (pk) CLUSTERED,
    UNIQUE KEY idx_uniq (uniq),
    KEY idx_small_grp (small_grp),
    KEY idx_large_grp (large_grp),
    KEY idx_same (fixed_val),
    KEY idx_seq_num (seq_num),
    KEY idx_ts (ts)
);

CREATE TABLE clusteredPartitionGlobalIndex
(
    pk        varchar(32)    NOT NULL,
    uniq      varchar(32)    NOT NULL,
    small_grp varchar(32)    NOT NULL,
    large_grp varchar(32)    NOT NULL,
    fixed_val varchar(32)    NOT NULL,
    seq_num   int            NOT NULL,
    ts        timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payload   varchar(10240) NOT NULL,
    PRIMARY KEY (pk, ts) CLUSTERED,
    UNIQUE KEY idx_pk (pk) GLOBAL
) PARTITION BY RANGE (UNIX_TIMESTAMP(ts)) INTERVAL (86400) FIRST PARTITION LESS THAN (UNIX_TIMESTAMP('2025-01-01 00:00:00')) LAST PARTITION LESS THAN (UNIX_TIMESTAMP('2026-01-01 00:00:00'));

CREATE TABLE clusteredPartitionGlobalIndexWIndex
(
    pk        varchar(32)    NOT NULL,
    uniq      varchar(32)    NOT NULL,
    small_grp varchar(32)    NOT NULL,
    large_grp varchar(32)    NOT NULL,
    fixed_val varchar(32)    NOT NULL,
    seq_num   int            NOT NULL,
    ts        timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payload   varchar(10240) NOT NULL,
    PRIMARY KEY (pk, ts) CLUSTERED,
    UNIQUE KEY idx_pk (pk) GLOBAL,
    UNIQUE KEY idx_uniq (uniq) GLOBAL,
    KEY idx_small_grp (small_grp),
    KEY idx_large_grp (large_grp),
    KEY idx_same (fixed_val),
    KEY idx_seq_num (seq_num),
    KEY idx_ts (ts)
) PARTITION BY RANGE (UNIX_TIMESTAMP(ts)) INTERVAL (86400) FIRST PARTITION LESS THAN (UNIX_TIMESTAMP('2025-01-01 00:00:00')) LAST PARTITION LESS THAN (UNIX_TIMESTAMP('2026-01-01 00:00:00'));

CREATE TABLE nonclustered
(
    pk        varchar(32)    NOT NULL,
    uniq      varchar(32)    NOT NULL,
    small_grp varchar(32)    NOT NULL,
    large_grp varchar(32)    NOT NULL,
    fixed_val varchar(32)    NOT NULL,
    seq_num   int            NOT NULL,
    ts        timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payload   varchar(10240) NOT NULL,
    PRIMARY KEY (pk) NONCLUSTERED
);

CREATE TABLE nonclusteredWindex
(
    pk        varchar(32)    NOT NULL,
    uniq      varchar(32)    NOT NULL,
    small_grp varchar(32)    NOT NULL,
    large_grp varchar(32)    NOT NULL,
    fixed_val varchar(32)    NOT NULL,
    seq_num   int            NOT NULL,
    ts        timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payload   varchar(10240) NOT NULL,
    PRIMARY KEY (pk) NONCLUSTERED,
    UNIQUE KEY idx_uniq (uniq),
    KEY idx_small_grp (small_grp),
    KEY idx_large_grp (large_grp),
    KEY idx_same (fixed_val),
    KEY idx_seq_num (seq_num),
    KEY idx_ts (ts)
);


