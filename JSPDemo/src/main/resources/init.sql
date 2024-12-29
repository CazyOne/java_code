

CREATE TABLE convert (
                         a VARCHAR(10) NOT NULL,
                         b VARCHAR(10) NOT NULL,
                         c DECIMAL(10, 4) NOT NULL -- 假设汇率最多有4位小数
);

INSERT INTO convert (a, b, c) VALUES ('AUD', 'USD', 0.75);